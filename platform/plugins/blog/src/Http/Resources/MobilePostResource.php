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
        return [
            'id' => $this->id,
            'title' => $this->name,
            'slug' => $this->slug,
            'excerpt' => $this->description,
            'image' => $this->image ? RvMedia::url($this->image) : null,
            'is_featured' => (bool) $this->is_featured,
            'views' => (int) $this->views,
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
