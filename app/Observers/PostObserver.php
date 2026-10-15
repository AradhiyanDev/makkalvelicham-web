<?php

namespace App\Observers;

use App\Jobs\SendBreakingNewsPush;
use Botble\Blog\Enums\PostStatusEnum;
use Botble\Blog\Models\Post;

/**
 * Auto-push when a post becomes published + featured (breaking news).
 * Edits to an already-pushed post stay silent (job is idempotent).
 */
class PostObserver
{
    public function created(Post $post): void
    {
        if ($this->isBreaking($post)) {
            $this->dispatch($post);
        }
    }

    public function updated(Post $post): void
    {
        if (! $this->isBreaking($post)) {
            return;
        }

        $becamePublished = $post->wasChanged('status')
            && $post->getOriginal('status') != PostStatusEnum::PUBLISHED;

        $becameFeatured = $post->wasChanged('is_featured') && (bool) $post->is_featured;

        if ($becamePublished || $becameFeatured) {
            $this->dispatch($post);
        }
    }

    protected function isBreaking(Post $post): bool
    {
        return (string) $post->status === PostStatusEnum::PUBLISHED
            && (bool) $post->is_featured;
    }

    protected function dispatch(Post $post): void
    {
        if (! setting('push_breaking_enabled', true)) {
            logger()->info('[Push] Breaking auto-push disabled by setting', ['post_id' => $post->id]);

            return;
        }

        if (SendBreakingNewsPush::alreadyPushed($post->id)) {
            return;
        }

        logger()->info('[Push] Breaking post detected, dispatching fan-out', ['post_id' => $post->id]);

        SendBreakingNewsPush::dispatch($post->id);
    }
}
