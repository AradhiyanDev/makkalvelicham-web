<?php

namespace Botble\Blog\Http\Resources;

use Botble\Blog\Models\Post;
use Botble\Comment\Models\Comment;
use Botble\Media\Facades\RvMedia;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

/**
 * Optimized lightweight resource for mobile - minimal payload, no Shortcode compile
 * @mixin Post
 */
class MobilePostResource extends JsonResource
{
    public function toArray($request): array
    {
        $user = $request->user();
        $isLiked = false;
        $isViewed = false;
        if ($user) {
            // Check liked via favorite_posts JSON (ProPosts) or favorite_posts table
            $fav = $user->favorite_posts ? json_decode($user->favorite_posts, true) : [];
            $isLiked = in_array($this->id, (array) $fav);
            // Check viewed via user_post_views
            $isViewed = DB::table('user_post_views')->where('user_id', $user->getKey())->where('post_id', $this->id)->exists();
        }

        $commentsCount = Comment::where('reference_id', $this->id)
            ->where('reference_type', Post::class)
            ->where('status', 'published')
            ->count();

        return [
            'id' => $this->id,
            'title' => $this->name,
            'slug' => $this->slug,
            'excerpt' => $this->description,
            'image' => $this->image ? RvMedia::url($this->image) : null,
            'is_featured' => (bool) $this->is_featured,
            'views' => (int) $this->views,
            'comments_count' => (int) $commentsCount,
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
