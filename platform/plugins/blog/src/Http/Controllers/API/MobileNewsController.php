<?php

namespace Botble\Blog\Http\Controllers\API;

use Botble\Api\Http\Controllers\BaseApiController;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Blog\Http\Resources\MobilePostResource;
use Botble\Blog\Http\Resources\PostResource;
use Botble\Blog\Models\Post;
use Botble\Blog\Services\FeedRankingService;
use Botble\Comment\Models\Comment;
use Botble\Slug\Facades\SlugHelper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class MobileNewsController extends BaseApiController
{
    /**
     * Fast cached mobile news feed - supports page (legacy) and cursor (preferred)
     *
     * @group Mobile
     * @queryParam cursor string Cursor for next page (base64). Prefer over page. Example: eyJpZCI6MjcsImNyZWF0ZWRfYXQiOiIyMDI2LTA5LTA1In0=
     * @queryParam page integer Current page (fallback). Default 1. Example: 1
     * @queryParam per_page integer Items per page max 20. Default 10. Example: 10
     * @queryParam category integer Category ID filter. Example: 5
     * @queryParam featured integer Featured only 0/1. Example: 1
     * @queryParam search string Search keyword. Example: விஜய்
     * @queryParam order_by string Sort field: created_at|updated_at|views|id. Default: created_at
     * @queryParam order string asc|desc. Default: desc
     * @queryParam exclude string Comma separated post IDs to exclude (guest fallback). Example: 1,2,3
     * @queryParam exclude_viewed boolean Exclude already viewed posts for auth user. Example: 1
     * @queryParam feed string Feed type: latest|for_you. Default: latest
     */
    public function index(Request $request)
    {
        $perPage = min($request->integer('per_page', 10), 20);
        $cursor = $request->input('cursor');
        $page = max($request->integer('page', 1), 1);
        $categoryId = $request->input('category') ?: $request->input('categories');
        $featured = $request->input('featured');
        $search = $request->input('search');
        $orderBy = in_array($request->input('order_by'), ['created_at', 'updated_at', 'views', 'id']) ? $request->input('order_by') : 'created_at';
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
        $exclude = $request->input('exclude');
        $excludeViewed = $request->boolean('exclude_viewed');
        $feed = $request->input('feed', 'latest'); // Phase2: for_you adds ranking
        $user = $request->user();

        // Backward compat: if cursor provided, use cursor pagination
        $useCursor = ! empty($cursor);

        $cacheKey = sprintf(
            'mobile_news_v1_%s_p%d_pp%d_c%s_f%s_s%s_o%s_%s_ex%s_ev%s_u%s_feed%s',
            $useCursor ? 'cursor_' . substr(md5($cursor), 0, 8) : 'page',
            $page,
            $perPage,
            $categoryId ?: 'all',
            $featured !== null ? $featured : 'all',
            $search ? md5($search) : 'all',
            $orderBy,
            $order,
            $exclude ? md5($exclude) : 'all',
            $excludeViewed ? '1' : '0',
            $user ? $user->getKey() : 'guest',
            $feed
        );

        // Support category name filter (All, India, Tamil Nadu etc) via FeedRankingService map
        if ($categoryId && ! is_numeric($categoryId)) {
            $map = (new FeedRankingService())->categoryMap();
            $categoryId = $map[$categoryId] ?? $map[ucfirst($categoryId)] ?? null;
            if ($categoryId === null && strtolower((string) $request->input('category')) !== 'all') {
                // fallback to search for Technology etc
                $search = $search ? $search . ' ' . $request->input('category') : $request->input('category');
                $categoryId = null;
            }
        }

        $ttl = ($user && $excludeViewed) ? 30 : 60; // shorter for personalized

        // Batch preload for N+1 fix - pass via request attributes
        $viewedIdsSet = [];
        $likedIdsSet = [];
        if ($user) {
            $viewedIdsSet = DB::table('user_post_views')->where('user_id', $user->getKey())->pluck('post_id')->toArray();
            $viewedIdsSet = array_flip($viewedIdsSet);
            $fav = $user->favorite_posts ? json_decode($user->favorite_posts, true) : [];
            // Also check likes table for Phase1 idempotency
            $likes = DB::table('likes')->where('user_id', $user->getKey())->pluck('post_id')->toArray();
            $likedIdsSet = array_flip(array_unique(array_merge((array) $fav, $likes)));
        }
        $request->attributes->set('viewedIdsSet', $viewedIdsSet);
        $request->attributes->set('likedIdsSet', $likedIdsSet);

        if ($useCursor) {
            // Cursor pagination: cursor is base64(json{id,created_at})
            $decoded = json_decode(base64_decode($cursor), true);
            $cursorId = $decoded['id'] ?? null;
            $cursorCreatedAt = $decoded['created_at'] ?? null;

            $data = Cache::remember($cacheKey, $ttl, function () use ($perPage, $categoryId, $featured, $search, $orderBy, $order, $exclude, $excludeViewed, $user, $cursorId, $cursorCreatedAt, $feed) {
                $query = Post::query()
                    ->select(['id', 'name', 'description', 'image', 'is_featured', 'views', 'author_id', 'author_type', 'status', 'created_at', 'updated_at'])
                    ->selectSub(function ($q) {
                        $q->from('likes')->selectRaw('COUNT(*)')->whereColumn('likes.post_id', 'posts.id');
                    }, 'likes_count')
                    ->where('status', BaseStatusEnum::PUBLISHED)
                    ->with(['categories:id,name', 'slugable', 'author'])
                    ->withCount(['comments' => function ($q) {
                        $q->where('reference_type', Post::class)->where('status', 'published');
                    }]);

                // Apply filters
                if ($categoryId) {
                    $query->whereHas('categories', fn($q) => $q->where('categories.id', $categoryId));
                }
                if ($featured !== null && $featured !== '') {
                    $query->where('is_featured', (int) $featured);
                }
                if ($search) {
                    $query->where(fn($q) => $q->where('name', 'LIKE', "%{$search}%")->orWhere('description', 'LIKE', "%{$search}%"));
                }
                if ($exclude) {
                    $ids = array_filter(array_map('intval', explode(',', $exclude)));
                    if ($ids) $query->whereNotIn('id', $ids);
                }
                if ($user && $excludeViewed) {
                    $viewedIds = array_keys(DB::table('user_post_views')->where('user_id', $user->getKey())->pluck('post_id', 'post_id')->toArray());
                    if ($viewedIds) $query->whereNotIn('id', $viewedIds);
                }
                // Cursor where
                if ($cursorId && $cursorCreatedAt) {
                    $cursorCreatedAt = \Carbon\Carbon::parse($cursorCreatedAt)->format('Y-m-d H:i:s');
                    $query->where(function ($q) use ($cursorCreatedAt, $cursorId, $order) {
                        if ($order === 'desc') {
                            $q->where('created_at', '<', $cursorCreatedAt)->orWhere(function ($qq) use ($cursorCreatedAt, $cursorId) {
                                $qq->where('created_at', '=', $cursorCreatedAt)->where('id', '<', $cursorId);
                            });
                        } else {
                            $q->where('created_at', '>', $cursorCreatedAt)->orWhere(function ($qq) use ($cursorCreatedAt, $cursorId) {
                                $qq->where('created_at', '=', $cursorCreatedAt)->where('id', '>', $cursorId);
                            });
                        }
                    });
                }

                if ($feed === 'for_you') {
                    (new FeedRankingService())->scoreQuery($query, $user?->getKey());
                } else {
                    $query->orderBy($orderBy, $order)->orderBy('id', $order);
                }

                return $query->limit($perPage + 1)->get();
            });

            $hasMore = $data->count() > $perPage;
            $items = $hasMore ? $data->slice(0, $perPage) : $data;
            $nextCursor = null;
            if ($hasMore && $items->isNotEmpty()) {
                $last = $items->last();
                $nextCursor = base64_encode(json_encode(['id' => $last->id, 'created_at' => $last->created_at->toIso8601String()]));
            }

            $resource = MobilePostResource::collection($items);

            return $this->httpResponse()->setData($resource)->setAdditional([
                'meta' => ['next_cursor' => $nextCursor, 'has_more' => $hasMore, 'per_page' => $perPage],
            ])->toApiResponse();
        }

        // Page pagination (legacy) with batch preload
        $paginator = Cache::remember($cacheKey, $ttl, function () use ($perPage, $page, $categoryId, $featured, $search, $orderBy, $order, $exclude, $excludeViewed, $user, $feed) {
            $query = Post::query()
                ->select(['id', 'name', 'description', 'image', 'is_featured', 'views', 'author_id', 'author_type', 'status', 'created_at', 'updated_at'])
                ->selectSub(function ($q) {
                    $q->from('likes')->selectRaw('COUNT(*)')->whereColumn('likes.post_id', 'posts.id');
                }, 'likes_count')
                ->where('status', BaseStatusEnum::PUBLISHED)
                ->with(['categories:id,name', 'slugable', 'author'])
                ->withCount(['comments' => function ($q) {
                    $q->where('reference_type', Post::class)->where('status', 'published');
                }]);

            if ($categoryId) {
                $query->whereHas('categories', fn($q) => $q->where('categories.id', $categoryId));
            }
            if ($featured !== null && $featured !== '') {
                $query->where('is_featured', (int) $featured);
            }
            if ($search) {
                $query->where(fn($q) => $q->where('name', 'LIKE', "%{$search}%")->orWhere('description', 'LIKE', "%{$search}%"));
            }
            if ($exclude) {
                $ids = array_filter(array_map('intval', explode(',', $exclude)));
                if ($ids) $query->whereNotIn('id', $ids);
            }
            if ($user && $excludeViewed) {
                $viewedIds = DB::table('user_post_views')->where('user_id', $user->getKey())->pluck('post_id')->toArray();
                if ($viewedIds) $query->whereNotIn('id', $viewedIds);
            }

            if ($feed === 'for_you') {
                (new FeedRankingService())->scoreQuery($query, $user?->getKey());
            } else {
                $query->orderBy($orderBy, $order)->orderBy('id', $order);
            }

            return $query->paginate($perPage, ['*'], 'page', $page);
        });

        $resource = MobilePostResource::collection($paginator);

        // Also provide cursor for next page (enables migration to cursor without breaking page)
        $nextCursor = null;
        $hasMore = $paginator->hasMorePages();
        if ($hasMore && $paginator->count() > 0) {
            $last = $paginator->items()[count($paginator->items()) - 1];
            $nextCursor = base64_encode(json_encode(['id' => $last->id, 'created_at' => $last->created_at->toIso8601String()]));
        }

        // Only add next_cursor/has_more to meta - paginator's meta (current_page, total etc) already provided by ResourceCollection
        return $this->httpResponse()->setData($resource)->setAdditional([
            'meta' => [
                'next_cursor' => $nextCursor,
                'has_more' => $hasMore,
            ],
        ])->toApiResponse();
    }

    /**
     * Breaking news count since timestamp
     *
     * @group Mobile
     * @queryParam since string ISO8601 timestamp. Example: 2026-09-05T10:00:00Z
     */
    public function newCount(Request $request)
    {
        $since = $request->input('since');
        if (! $since) {
            return $this->httpResponse()->setError()->setCode(422)->setMessage('since param required');
        }
        try {
            $sinceTime = \Carbon\Carbon::parse($since);
        } catch (\Exception $e) {
            return $this->httpResponse()->setError()->setCode(422)->setMessage('Invalid since timestamp');
        }
        $count = Post::where('status', BaseStatusEnum::PUBLISHED)->where('created_at', '>', $sinceTime)->count();
        return $this->httpResponse()->setData(['new_count' => $count, 'since' => $sinceTime->toIso8601String()])->toApiResponse();
    }

    public function show(string $slug)
    {
        $cacheKey = 'mobile_news_detail_' . md5($slug);
        $post = Cache::remember($cacheKey, 300, function () use ($slug) {
            $slugModel = SlugHelper::getSlug($slug, SlugHelper::getPrefix(Post::class));
            if (! $slugModel) return null;
            return Post::query()->where(['id' => $slugModel->reference_id, 'status' => BaseStatusEnum::PUBLISHED])->with(['categories', 'tags', 'slugable', 'author'])->withCount(['comments' => fn($q) => $q->where('reference_type', Post::class)->where('status','published')])->first();
        });
        if (! $post) return $this->httpResponse()->setError()->setCode(404)->setMessage('Not found');
        return $this->httpResponse()->setData(new PostResource($post))->toApiResponse();
    }

    private function checkIdempotency(Request $request)
    {
        $key = $request->header('Idempotency-Key');
        if (! $key) return null;
        $userId = $request->user()?->getKey();
        $row = DB::table('idempotency_keys')->where('idempotency_key', $key)->where('user_id', $userId)->first();
        if ($row) {
            return json_decode($row->response_json, true);
        }
        return null;
    }

    private function storeIdempotency(Request $request, $responseData): void
    {
        $key = $request->header('Idempotency-Key');
        if (! $key) return;
        try {
            DB::table('idempotency_keys')->insert([
                'idempotency_key' => $key,
                'user_id' => $request->user()?->getKey(),
                'route' => $request->path(),
                'response_json' => json_encode($responseData),
                'created_at' => now(),
            ]);
        } catch (\Exception $e) {
            // duplicate key -> ignore
        }
    }

    public function toggleLike(Request $request, string $id)
    {
        if ($cached = $this->checkIdempotency($request)) {
            return $this->httpResponse()->setData($cached['data'] ?? $cached)->toApiResponse();
        }
        $user = $request->user();
        if (! $user) return $this->httpResponse()->setError()->setCode(401)->setMessage('Unauthenticated');
        $post = Post::find($id);
        if (! $post || $post->status != BaseStatusEnum::PUBLISHED) return $this->httpResponse()->setError()->setCode(404)->setMessage('Post not found');

        return DB::transaction(function () use ($request, $user, $id) {
            $exists = DB::table('likes')->where(['user_id' => $user->getKey(), 'post_id' => $id])->exists();
            $favorites = $user->favorite_posts ? json_decode($user->favorite_posts, true) : [];
            $favorites = array_map('intval', (array) $favorites);

            if ($exists) {
                DB::table('likes')->where(['user_id' => $user->getKey(), 'post_id' => $id])->delete();
                $favorites = array_values(array_diff($favorites, [(int) $id]));
                $isLiked = false;
            } else {
                DB::table('likes')->insert(['user_id' => $user->getKey(), 'post_id' => $id, 'created_at' => now(), 'updated_at' => now()]);
                $favorites[] = (int) $id;
                $isLiked = true;
            }
            DB::table('favorite_posts')->updateOrInsert(
                ['post_id' => $id, 'user_id' => $user->getKey(), 'type' => 'favorite'],
                ['created_at' => now(), 'updated_at' => now()]
            );
            if (! $isLiked) {
                DB::table('favorite_posts')->where(['post_id' => $id, 'user_id' => $user->getKey(), 'type' => 'favorite'])->delete();
            }

            $user->favorite_posts = json_encode(array_values(array_unique($favorites)));
            $user->save();

            $likesCount = DB::table('likes')->where('post_id', $id)->count();
            $data = ['is_liked' => $isLiked, 'likes_count' => $likesCount];
            $this->storeIdempotency($request, ['data' => $data]);
            return $this->httpResponse()->setData($data)->setMessage($isLiked ? 'Liked' : 'Unliked')->toApiResponse();
        });
    }

    public function likedPosts(Request $request)
    {
        $user = $request->user();
        $perPage = min($request->integer('per_page', 10), 20);
        $cursor = $request->input('cursor');

        $ids = DB::table('likes')->where('user_id', $user->getKey())->pluck('post_id')->toArray();
        if (empty($ids)) {
            // fallback to JSON column
            $ids = $user->favorite_posts ? json_decode($user->favorite_posts, true) : [];
        }
        if (empty($ids)) return $this->httpResponse()->setData(MobilePostResource::collection(collect([])))->toApiResponse();

        $query = Post::whereIn('id', $ids)->where('status', BaseStatusEnum::PUBLISHED)->select(['posts.*'])->selectSub(function ($q) {
            $q->from('likes')->selectRaw('COUNT(*)')->whereColumn('likes.post_id', 'posts.id');
        }, 'likes_count')->with(['categories','slugable','author'])->withCount(['comments' => fn($q) => $q->where('reference_type', Post::class)->where('status','published')]);

        if ($cursor) {
            $decoded = json_decode(base64_decode($cursor), true);
            if ($decoded) $query->where('id', '<', $decoded['id']);
            $items = $query->orderByDesc('id')->limit($perPage+1)->get();
            $hasMore = $items->count() > $perPage;
            $items = $hasMore ? $items->slice(0,$perPage) : $items;
            $nextCursor = $hasMore ? base64_encode(json_encode(['id' => $items->last()->id])) : null;
            return $this->httpResponse()->setData(MobilePostResource::collection($items))->setAdditional(['meta'=>['next_cursor'=>$nextCursor,'has_more'=>$hasMore]])->toApiResponse();
        }

        $posts = $query->paginate($perPage);
        return $this->httpResponse()->setData(MobilePostResource::collection($posts))->toApiResponse();
    }

    public function incrementView(Request $request, string $id)
    {
        if ($cached = $this->checkIdempotency($request)) {
            return $this->httpResponse()->setData($cached['data'] ?? $cached)->toApiResponse();
        }
        $post = Post::find($id);
        if (! $post) return $this->httpResponse()->setError()->setCode(404)->setMessage('Post not found');
        $user = $request->user();
        $cacheKey = $user ? "view_{$user->getKey()}_{$id}" : "view_ip_" . $request->ip() . "_{$id}";

        $shouldIncrement = false;
        if ($user) {
            $existing = DB::table('user_post_views')->where(['user_id'=>$user->getKey(),'post_id'=>$id])->first();
            if (! $existing) {
                $shouldIncrement = true;
                DB::table('user_post_views')->insert(['user_id'=>$user->getKey(),'post_id'=>$id,'status'=>'view','ip_address'=>$request->ip(),'created_at'=>now(),'updated_at'=>now()]);
            } elseif ($existing->status === 'viewed') {
                $shouldIncrement = true;
                DB::table('user_post_views')->where(['user_id'=>$user->getKey(),'post_id'=>$id])->update(['status'=>'view','updated_at'=>now()]);
            } else {
                // already view -> check 24h cache
                $shouldIncrement = ! Cache::has($cacheKey);
            }
        } else {
            $shouldIncrement = ! Cache::has($cacheKey);
        }

        if ($shouldIncrement) {
            $post->increment('views');
            Cache::put($cacheKey, true, 86400);
            // Bust feed caches (file driver: flush)
            try { Cache::flush(); } catch (\Exception $e) {}
        } elseif ($user && ! DB::table('user_post_views')->where(['user_id'=>$user->getKey(),'post_id'=>$id])->exists()) {
            DB::table('user_post_views')->updateOrInsert(['user_id'=>$user->getKey(),'post_id'=>$id],['status'=>'view','ip_address'=>$request->ip(),'updated_at'=>now(),'created_at'=>now()]);
        }

        $views = (int) $post->fresh()->views;
        $data = ['views'=>$views];
        $this->storeIdempotency($request, ['data'=>$data]);
        return $this->httpResponse()->setData($data)->setMessage('View counted')->toApiResponse();
    }

    public function markViewed(Request $request, string $id)
    {
        if ($cached = $this->checkIdempotency($request)) {
            return $this->httpResponse()->setData($cached['data'] ?? $cached)->toApiResponse();
        }
        $user = $request->user();
        $existing = DB::table('user_post_views')->where(['user_id'=>$user->getKey(),'post_id'=>$id])->first();
        if (! $existing) {
            DB::table('user_post_views')->insert(['user_id'=>$user->getKey(),'post_id'=>$id,'status'=>'viewed','ip_address'=>$request->ip(),'created_at'=>now(),'updated_at'=>now()]);
        }
        // if already view, do not downgrade to viewed
        $data = ['viewed'=>true];
        $this->storeIdempotency($request, ['data'=>$data]);
        return $this->httpResponse()->setData($data)->toApiResponse();
    }

    public function comments(Request $request, string $id)
    {
        $post = Post::find($id);
        if (! $post) return $this->httpResponse()->setError()->setCode(404)->setMessage('Post not found');
        $perPage = min($request->integer('per_page', 20), 50);
        $cursor = $request->input('cursor');
        $parentId = $request->integer('parent_id', 0);
        $query = Comment::where('reference_id',$id)->where('reference_type',Post::class)->where('status','published')->where('parent_id',$parentId)->with(['user'])->orderByDesc('id');
        if ($cursor) {
            $decoded = json_decode(base64_decode($cursor), true);
            if ($decoded) $query->where('id','<',$decoded['id']);
            $items = $query->limit($perPage+1)->get();
            $hasMore = $items->count() > $perPage;
            $items = $hasMore ? $items->slice(0,$perPage) : $items;
            $nextCursor = $hasMore ? base64_encode(json_encode(['id'=>$items->last()->id])) : null;
            return $this->httpResponse()->setData($items)->setAdditional(['meta'=>['next_cursor'=>$nextCursor,'has_more'=>$hasMore]])->toApiResponse();
        }
        $comments = $query->paginate($perPage);
        return $this->httpResponse()->setData($comments)->toApiResponse();
    }

    public function storeComment(Request $request, string $id)
    {
        if ($cached = $this->checkIdempotency($request)) {
            return $this->httpResponse()->setData($cached['data'] ?? $cached)->toApiResponse();
        }
        $user = $request->user();
        $post = Post::find($id);
        if (! $post) return $this->httpResponse()->setError()->setCode(404)->setMessage('Post not found');
        $validator = Validator::make($request->all(), [
            'comment' => ['required','string','max:1000'],
            'parent_id' => ['nullable','integer'],
        ]);
        if ($request->filled('parent_id') && (int) $request->input('parent_id') !== 0) {
            $exists = Comment::where('id', $request->input('parent_id'))->exists();
            if (! $exists) {
                return $this->httpResponse()->setError()->setCode(422)->setMessage('The selected parent id is invalid.');
            }
        }
        if ($validator->fails()) return $this->httpResponse()->setError()->setCode(422)->setMessage(implode(' ', $validator->errors()->all()));
        $comment = Comment::create([
            'comment' => $request->input('comment'),
            'reference_id' => $id,
            'reference_type' => Post::class,
            'ip_address' => $request->ip(),
            'user_id' => $user->getKey(),
            'user_type' => get_class($user),
            'status' => 'published',
            'parent_id' => $request->integer('parent_id',0),
        ]);
        $count = Comment::where('reference_id',$id)->where('reference_type',Post::class)->where('status','published')->count();
        // Bust detail cache
        Cache::forget('mobile_news_detail_'.md5((string)$post->slug));
        $data = $comment->toArray();
        $data['comments_count'] = $count;
        $this->storeIdempotency($request, ['data'=>$data]);
        return $this->httpResponse()->setData($data)->setAdditional(['comments_count'=>$count])->setMessage('Comment added')->toApiResponse();
    }

    public function syncEvents(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'events' => ['required','array','max:50'],
            'events.*.post_id' => ['required','integer','exists:posts,id'],
            'events.*.event_type' => ['required','string','in:impression,viewed,view,like,unlike,share,bookmark,comment'],
            'events.*.occurred_at' => ['required','date'],
            'events.*.idempotency_key' => ['required','string','max:64'],
        ]);
        if ($validator->fails()) return $this->httpResponse()->setError()->setCode(422)->setMessage(implode(' ', $validator->errors()->all()));

        $user = $request->user();
        $accepted = 0;
        foreach ($request->input('events') as $ev) {
            $key = $ev['idempotency_key'];
            if (DB::table('idempotency_keys')->where('idempotency_key',$key)->exists()) continue;
            // store idempotency
            DB::table('idempotency_keys')->insert(['idempotency_key'=>$key,'user_id'=>$user?->getKey(),'route'=>'mobile/events/batch','response_json'=>json_encode(['accepted'=>true]),'created_at'=>now()]);

            $postId = $ev['post_id'];
            $type = $ev['event_type'];
            $occurredAt = \Carbon\Carbon::parse($ev['occurred_at'])->format('Y-m-d H:i:s');
            if (in_array($type, ['viewed','view'])) {
                $existing = $user ? DB::table('user_post_views')->where(['user_id'=>$user->getKey(),'post_id'=>$postId])->first() : null;
                if ($type === 'view') {
                    if (! $existing) {
                        DB::table('user_post_views')->insert(['user_id'=>$user->getKey(),'post_id'=>$postId,'status'=>'view','ip_address'=>$request->ip(),'created_at'=>$occurredAt,'updated_at'=>now()]);
                        Post::where('id',$postId)->increment('views');
                    } elseif ($existing->status === 'viewed') {
                        DB::table('user_post_views')->where(['user_id'=>$user->getKey(),'post_id'=>$postId])->update(['status'=>'view','updated_at'=>now()]);
                        Post::where('id',$postId)->increment('views');
                    }
                } else { // viewed
                    if (! $existing) {
                        DB::table('user_post_views')->insert(['user_id'=>$user->getKey(),'post_id'=>$postId,'status'=>'viewed','ip_address'=>$request->ip(),'created_at'=>$occurredAt,'updated_at'=>now()]);
                    }
                }
            } elseif (in_array($type, ['like','unlike'])) {
                $isLike = $type === 'like';
                $exists = DB::table('likes')->where(['user_id'=>$user->getKey(),'post_id'=>$postId])->exists();
                if ($isLike && ! $exists) DB::table('likes')->insert(['user_id'=>$user->getKey(),'post_id'=>$postId,'created_at'=>now(),'updated_at'=>now()]);
                if (! $isLike && $exists) DB::table('likes')->where(['user_id'=>$user->getKey(),'post_id'=>$postId])->delete();
            }
            $accepted++;
        }
        try { Cache::flush(); } catch (\Exception $e) {}
        return $this->httpResponse()->setData(['accepted'=>$accepted])->toApiResponse();
    }
}
