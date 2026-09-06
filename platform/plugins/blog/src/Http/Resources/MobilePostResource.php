<?php

namespace Botble\Blog\Http\Resources;

use Botble\Blog\Models\Post;
use Botble\Media\Facades\RvMedia;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * Optimized lightweight resource for mobile - minimal payload, no Shortcode compile
 * @mixin Post
 */
class MobilePostResource extends JsonResource
{
    public function toArray($request): array
    {
        $viewedSet = $request->attributes->get('viewedIdsSet');
        $likedSet = $request->attributes->get('likedIdsSet');
        $user = $request->user();

        if ($viewedSet !== null && $likedSet !== null) {
            $isLiked = isset($likedSet[$this->id]);
            $isViewed = isset($viewedSet[$this->id]);
            $commentsCount = $this->comments_count ?? 0;
            $likesCount = $this->likes_count ?? 0;
        } else {
            // Fallback for direct calls (detail, likedPosts)
            $isLiked = false;
            $isViewed = false;
            if ($user) {
                $fav = $user->favorite_posts ? json_decode($user->favorite_posts, true) : [];
                $isLiked = in_array($this->id, (array) $fav);
                $isViewed = \Illuminate\Support\Facades\DB::table('user_post_views')->where('user_id', $user->getKey())->where('post_id', $this->id)->exists();
            }
            $commentsCount = \Botble\Comment\Models\Comment::where('reference_id', $this->id)->where('reference_type', \Botble\Blog\Models\Post::class)->where('status', 'published')->count();
            $likesCount = $this->likes_count ?? \Illuminate\Support\Facades\DB::table('likes')->where('post_id', $this->id)->count();
        }

        return [
            'id' => $this->id,
            'title' => $this->name,
            'slug' => $this->slug,
            'excerpt' => $this->description,
            'image' => $this->image ? RvMedia::url($this->image) : null,
            'is_featured' => (bool) $this->is_featured,
            'views' => (int) $this->views,
            'comments_count' => (int) $commentsCount,
            'likes_count' => (int) $likesCount,
            'is_liked' => $isLiked,
            'is_viewed' => $isViewed,
            'author' => $this->whenLoaded('author', function () {
                return $this->author ? [
                    'id' => $this->author->id,
                    'name' => $this->author->name,
                ] : null;
            }),
            'categories' => CategoryResource::collection($this->whenLoaded('categories')),
            'published_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
