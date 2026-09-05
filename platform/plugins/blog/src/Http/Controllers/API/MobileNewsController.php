<?php

namespace Botble\Blog\Http\Controllers\API;

use Botble\Api\Http\Controllers\BaseApiController;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Blog\Http\Resources\MobilePostResource;
use Botble\Blog\Http\Resources\PostResource;
use Botble\Blog\Models\Post;
use Botble\Comment\Models\Comment;
use Botble\Slug\Facades\SlugHelper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class MobileNewsController extends BaseApiController
{
    /**
     * Fast cached mobile news feed
     *
     * @group Mobile
     *
     * @queryParam page integer Current page. Default 1. Example: 1
     * @queryParam per_page integer Items per page max 20. Default 10. Example: 10
     * @queryParam category integer Category ID filter. Example: 5
     * @queryParam categories integer Category ID filter alias. Example: 5
     * @queryParam featured integer Featured only 0/1. Example: 1
     * @queryParam search string Search keyword. Example: விஜய்
     * @queryParam order_by string Sort field: created_at|updated_at|views|id. Default: created_at
     * @queryParam order string asc|desc. Default: desc
     * @queryParam exclude string Comma separated post IDs to exclude (swipe dedup for guests). Example: 1,2,3
     * @queryParam exclude_viewed boolean Exclude already viewed posts for auth user. Example: 1
     */
    public function index(Request $request)
    {
        $perPage = min($request->integer('per_page', 10), 20);
        $page = max($request->integer('page', 1), 1);
        $categoryId = $request->input('category') ?: $request->input('categories');
        $featured = $request->input('featured');
        $search = $request->input('search');
        $orderBy = in_array($request->input('order_by'), ['created_at', 'updated_at', 'views', 'id']) ? $request->input('order_by') : 'created_at';
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
        $exclude = $request->input('exclude');
        $excludeViewed = $request->boolean('exclude_viewed');
        $user = $request->user();

        // Cache key includes user viewed state for auth users
        $cacheKey = sprintf(
            'mobile_news_v1_p%d_pp%d_c%s_f%s_s%s_o%s_%s_ex%s_ev%s_u%s',
            $page,
            $perPage,
            $categoryId ?: 'all',
            $featured !== null ? $featured : 'all',
            $search ? md5($search) : 'all',
            $orderBy,
            $order,
            $exclude ? md5($exclude) : 'all',
            $excludeViewed ? '1' : '0',
            $user ? $user->getKey() : 'guest'
        );

        // For auth + exclude_viewed we cannot cache globally - short 30s or no cache
        $ttl = ($user && $excludeViewed) ? 30 : 300;

        $paginator = Cache::remember($cacheKey, $ttl, function () use ($perPage, $page, $categoryId, $featured, $search, $orderBy, $order, $exclude, $excludeViewed, $user) {
            $query = Post::query()
                ->select(['id', 'name', 'description', 'image', 'is_featured', 'views', 'author_id', 'author_type', 'status', 'created_at', 'updated_at'])
                ->where('status', BaseStatusEnum::PUBLISHED)
                ->with(['categories:id,name', 'slugable', 'author'])
                ->orderBy($orderBy, $order);

            if ($categoryId) {
                $query->whereHas('categories', function ($q) use ($categoryId) {
                    $q->where('categories.id', $categoryId);
                });
            }

            if ($featured !== null && $featured !== '') {
                $query->where('is_featured', (int) $featured);
            }

            if ($search) {
                $query->where(function ($q) use ($search) {
                    $q->where('name', 'LIKE', "%{$search}%")
                      ->orWhere('description', 'LIKE', "%{$search}%");
                });
            }

            if ($exclude) {
                $ids = array_filter(array_map('intval', explode(',', $exclude)));
                if ($ids) {
                    $query->whereNotIn('id', $ids);
                }
            }

            if ($user && $excludeViewed) {
                $viewedIds = DB::table('user_post_views')->where('user_id', $user->getKey())->pluck('post_id')->toArray();
                if ($viewedIds) {
                    $query->whereNotIn('id', $viewedIds);
                }
            }

            return $query->paginate($perPage, ['*'], 'page', $page);
        });

        $resource = MobilePostResource::collection($paginator);

        return $this->httpResponse()->setData($resource)->toApiResponse();
    }

    /**
     * Fast cached single post detail for mobile
     *
     * @group Mobile
     */
    public function show(string $slug)
    {
        $cacheKey = 'mobile_news_detail_' . md5($slug);

        $post = Cache::remember($cacheKey, 300, function () use ($slug) {
            $slugModel = SlugHelper::getSlug($slug, SlugHelper::getPrefix(Post::class));
            if (! $slugModel) {
                return null;
            }

            return Post::query()
                ->where(['id' => $slugModel->reference_id, 'status' => BaseStatusEnum::PUBLISHED])
                ->with(['categories', 'tags', 'slugable', 'author'])
                ->first();
        });

        if (! $post) {
            return $this->httpResponse()->setError()->setCode(404)->setMessage('Not found');
        }

        return $this->httpResponse()->setData(new PostResource($post))->toApiResponse();
    }

    /**
     * Toggle like (favorite) for post
     *
     * @group Mobile
     * @authenticated
     */
    public function toggleLike(Request $request, string $id)
    {
        $user = $request->user();
        if (! $user) {
            return $this->httpResponse()->setError()->setCode(401)->setMessage('Unauthenticated');
        }

        $post = Post::find($id);
        if (! $post || $post->status != BaseStatusEnum::PUBLISHED) {
            return $this->httpResponse()->setError()->setCode(404)->setMessage('Post not found');
        }

        $favorites = $user->favorite_posts ? json_decode($user->favorite_posts, true) : [];
        $favorites = array_map('intval', (array) $favorites);

        $isLiked = in_array((int) $id, $favorites);

        if ($isLiked) {
            $favorites = array_values(array_diff($favorites, [(int) $id]));
            DB::table('favorite_posts')->where(['post_id' => $id, 'user_id' => $user->getKey(), 'type' => 'favorite'])->delete();
        } else {
            $favorites[] = (int) $id;
            DB::table('favorite_posts')->updateOrInsert(
                ['post_id' => $id, 'user_id' => $user->getKey(), 'type' => 'favorite'],
                ['created_at' => now(), 'updated_at' => now()]
            );
        }

        $user->favorite_posts = json_encode(array_values(array_unique($favorites)));
        $user->save();

        return $this->httpResponse()->setData(['is_liked' => ! $isLiked, 'likes_count' => count($favorites)])->setMessage($isLiked ? 'Unliked' : 'Liked');
    }

    /**
     * Get liked posts for current user
     *
     * @group Mobile
     * @authenticated
     */
    public function likedPosts(Request $request)
    {
        $user = $request->user();
        $perPage = min($request->integer('per_page', 10), 20);

        $ids = $user->favorite_posts ? json_decode($user->favorite_posts, true) : [];
        if (empty($ids)) {
            return $this->httpResponse()->setData(MobilePostResource::collection(collect([])))->toApiResponse();
        }

        $posts = Post::whereIn('id', $ids)->where('status', BaseStatusEnum::PUBLISHED)->with(['categories', 'slugable', 'author'])->paginate($perPage);

        return $this->httpResponse()->setData(MobilePostResource::collection($posts))->toApiResponse();
    }

    /**
     * Increment views (idempotent per user per day)
     *
     * @group Mobile
     */
    public function incrementView(Request $request, string $id)
    {
        $post = Post::find($id);
        if (! $post) {
            return $this->httpResponse()->setError()->setCode(404)->setMessage('Post not found');
        }

        $user = $request->user();
        $cacheKey = $user ? "view_{$user->getKey()}_{$id}" : "view_ip_" . $request->ip() . "_{$id}";

        if (! Cache::has($cacheKey)) {
            $post->increment('views');
            Cache::put($cacheKey, true, 86400); // 24h dedup
            // Bust feed cache
            Cache::forget('mobile_news_v1_p1_pp10_call_of_all_fall_of_all_o_created_at_desc_exall_ev0_uguest');
        }

        // Also mark as viewed for swipe dedup if auth
        if ($user) {
            DB::table('user_post_views')->updateOrInsert(
                ['user_id' => $user->getKey(), 'post_id' => $id],
                ['ip_address' => $request->ip(), 'updated_at' => now(), 'created_at' => now()]
            );
        }

        return $this->httpResponse()->setData(['views' => (int) $post->fresh()->views])->setMessage('View counted');
    }

    /**
     * Mark post as viewed for swipe dedup (without incrementing views)
     *
     * @group Mobile
     * @authenticated
     */
    public function markViewed(Request $request, string $id)
    {
        $user = $request->user();
        DB::table('user_post_views')->updateOrInsert(
            ['user_id' => $user->getKey(), 'post_id' => $id],
            ['ip_address' => $request->ip(), 'updated_at' => now(), 'created_at' => now()]
        );

        return $this->httpResponse()->setData(['viewed' => true]);
    }

    /**
     * Get comments for post
     *
     * @group Mobile
     */
    public function comments(Request $request, string $id)
    {
        $post = Post::find($id);
        if (! $post) {
            return $this->httpResponse()->setError()->setCode(404)->setMessage('Post not found');
        }

        $perPage = min($request->integer('per_page', 20), 50);

        $comments = Comment::where('reference_id', $id)
            ->where('reference_type', Post::class)
            ->where('status', 'published')
            ->where('parent_id', 0)
            ->with(['user'])
            ->orderByDesc('created_at')
            ->paginate($perPage);

        return $this->httpResponse()->setData($comments)->toApiResponse();
    }

    /**
     * Post comment
     *
     * @group Mobile
     * @authenticated
     *
     * @bodyParam comment string required
     * @bodyParam parent_id integer Parent comment id for replies
     */
    public function storeComment(Request $request, string $id)
    {
        $user = $request->user();
        $post = Post::find($id);
        if (! $post) {
            return $this->httpResponse()->setError()->setCode(404)->setMessage('Post not found');
        }

        $validator = Validator::make($request->all(), [
            'comment' => ['required', 'string', 'max:1000'],
            'parent_id' => ['nullable', 'integer', 'exists:bb_comments,id'],
        ]);

        if ($validator->fails()) {
            return $this->httpResponse()->setError()->setCode(422)->setMessage(implode(' ', $validator->errors()->all()));
        }

        $comment = Comment::create([
            'comment' => $request->input('comment'),
            'reference_id' => $id,
            'reference_type' => Post::class,
            'ip_address' => $request->ip(),
            'user_id' => $user->getKey(),
            'user_type' => get_class($user),
            'status' => 'published',
            'parent_id' => $request->integer('parent_id', 0),
        ]);

        return $this->httpResponse()->setData($comment)->setMessage('Comment added');
    }
}
