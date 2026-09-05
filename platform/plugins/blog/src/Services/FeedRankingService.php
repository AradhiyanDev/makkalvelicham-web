<?php

namespace Botble\Blog\Services;

use Illuminate\Support\Facades\DB;

class FeedRankingService
{
    public function scoreQuery($query, ?int $userId = null)
    {
        $weights = config('feed.ranking', []);
        $freshnessHalfLife = $weights['freshness_half_life_hours'] ?? 24;
        $freshnessWeight = $weights['freshness_weight'] ?? 40;
        $popularityWeight = $weights['popularity_weight'] ?? 20;
        $engagementWeight = $weights['engagement_weight'] ?? 10;
        $viewedPenalty = $weights['viewed_penalty'] ?? 100;

        // Add computed score columns for ordering
        // Use raw SQL for performance: freshness exp(-TIMESTAMPDIFF(HOUR, created_at, NOW())/half_life)
        $query->selectRaw(
            "posts.*,
            (? * EXP(-TIMESTAMPDIFF(HOUR, posts.created_at, NOW()) / ?)) as freshness_score,
            (? * LOG(10, GREATEST(posts.views,1)+1)) as popularity_score,
            (? * (SELECT COUNT(*) FROM bb_comments WHERE bb_comments.reference_id = posts.id AND bb_comments.reference_type = 'Botble\\\\Blog\\\\Models\\\\Post' AND bb_comments.status='published')) as engagement_score"
            ,
            [$freshnessWeight, $freshnessHalfLife, $popularityWeight, $engagementWeight]
        );

        // Personalization placeholder: category_score would join user_category_preferences
        // For now 0, later: + category_weight if post category in user's top categories

        // If user, we will filter viewed via whereNotIn, but also penalize if still shown
        // Ranking order: score DESC, created_at DESC, id DESC
        $query->orderByDesc(DB::raw('(freshness_score + popularity_score + engagement_score)'));
        $query->orderByDesc('posts.created_at');
        $query->orderByDesc('posts.id');

        return $query;
    }

    public function categoryMap(): array
    {
        // Maps English filter names requested to Tamil DB names
        return [
            'All' => null,
            'India' => 14, // இந்தியா
            'Tamil Nadu' => 1, // தமிழகம்
            'Politics' => 13, // அரசியல்
            'Business' => 15, // வர்த்தகம்
            'Technology' => null, // no direct, fallback to search
            'Sports' => 5, // விளையாட்டு
            'Cinema' => 4, // சினிமா
            'World' => 3, // உலகம்
            'Lifestyle' => 25, // லைப்ஸ்டைல்
        ];
    }
}
