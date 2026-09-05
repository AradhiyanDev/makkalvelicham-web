<?php

namespace Botble\Blog\Http\Controllers\API;

use Botble\Api\Http\Controllers\BaseApiController;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Blog\Http\Resources\MobilePostResource;
use Botble\Blog\Http\Resources\PostResource;
use Botble\Blog\Models\Post;
use Botble\Slug\Facades\SlugHelper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

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

        $cacheKey = sprintf(
            'mobile_news_v1_p%d_pp%d_c%s_f%s_s%s_o%s_%s',
            $page,
            $perPage,
            $categoryId ?: 'all',
            $featured !== null ? $featured : 'all',
            $search ? md5($search) : 'all',
            $orderBy,
            $order
        );

        // 5 min cache - paginator COUNT(*) only once per 5 min
        $paginator = Cache::remember($cacheKey, 300, function () use ($perPage, $page, $categoryId, $featured, $search, $orderBy, $order) {
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

            return $query->paginate($perPage, ['*'], 'page', $page);
        });

        // Need to keep pagination meta when using JsonResource collection + BaseHttpResponse
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
}
