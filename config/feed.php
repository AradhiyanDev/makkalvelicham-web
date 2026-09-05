<?php

return [
    // Phase2 ranking weights - tunable without code change, later ML
    'ranking' => [
        'freshness_half_life_hours' => 24, // exp(-hours / half_life)
        'freshness_weight' => 40,
        'popularity_weight' => 20, // log(views+1)
        'category_weight' => 15,
        'engagement_weight' => 10, // comments_count
        'viewed_penalty' => 100,
        'skipped_penalty' => 50,
    ],
    // Feed types
    'feeds' => ['latest', 'for_you'],
];
