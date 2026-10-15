<?php

namespace App\Jobs;

use Botble\Api\Models\PushNotification;
use Botble\Api\Services\PushNotificationService;
use Botble\Blog\Enums\PostStatusEnum;
use Botble\Blog\Models\Post;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Str;
use Throwable;

/**
 * Auto-push for breaking news via the platform PushNotificationService
 * (FCM v1). Idempotent: an already-pushed post is never pushed again,
 * so later edits stay silent.
 */
class SendBreakingNewsPush implements ShouldQueue
{
    use Dispatchable;
    use InteractsWithQueue;
    use Queueable;
    use SerializesModels;

    public function __construct(public int $postId)
    {
    }

    public function handle(PushNotificationService $push): void
    {
        $post = Post::find($this->postId);

        if (! $post) {
            logger()->warning('[Push] Breaking job: post not found', ['post_id' => $this->postId]);

            return;
        }

        if ((string) $post->status !== PostStatusEnum::PUBLISHED || ! $post->is_featured) {
            logger()->info('[Push] Breaking job: post no longer published+featured, skipping', [
                'post_id' => $post->id,
            ]);

            return;
        }

        if (self::alreadyPushed($post->id)) {
            logger()->info('[Push] Breaking job: already pushed, skipping', ['post_id' => $post->id]);

            return;
        }

        $title = Str::limit(trim(strip_tags((string) $post->name)), 100);
        $body = Str::limit(trim(strip_tags((string) ($post->description ?: $post->name))), 200);

        logger()->info('[Push] Breaking job: fan-out started', ['post_id' => $post->id]);

        $result = $push->sendToPlatform('android', [
            'title' => $title,
            'message' => $body,
            'type' => 'breaking',
            'data' => ['post_id' => (string) $post->id],
        ]);

        // Tag the created row with the post so re-edits stay silent.
        PushNotification::where('type', 'breaking')
            ->where('data->post_id', (string) $post->id)
            ->where('status', 'sent')
            ->latest('id')
            ->limit(1)
            ->update(['target_type' => 'post', 'target_value' => (string) $post->id]);

        logger()->info('[Push] Breaking job: fan-out done', [
            'post_id' => $post->id,
            'success' => $result['success'] ?? false,
            'message' => $result['message'] ?? null,
            'sent' => $result['sent_count'] ?? 0,
            'failed' => $result['failed_count'] ?? 0,
        ]);
    }

    public function failed(Throwable $e): void
    {
        logger()->error('[Push] Breaking job failed: ' . $e->getMessage(), [
            'post_id' => $this->postId,
            'throw_class' => get_class($e),
        ]);
    }

    public static function alreadyPushed(int $postId): bool
    {
        return PushNotification::where('type', 'breaking')
            ->where('data->post_id', (string) $postId)
            ->where('status', 'sent')
            ->exists();
    }
}
