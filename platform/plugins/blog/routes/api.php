<?php

use Illuminate\Support\Facades\Route;

Route::group([
    'middleware' => 'api',
    'prefix' => 'api/v1',
    'namespace' => 'Botble\Blog\Http\Controllers\API',
], function (): void {
    Route::get('search', 'PostController@getSearch');
    Route::get('posts', 'PostController@index');
    Route::get('categories', 'CategoryController@index');
    Route::get('tags', 'TagController@index');

    Route::get('posts/filters', 'PostController@getFilters');
    Route::get('posts/{slug}', 'PostController@findBySlug');
    Route::get('categories/filters', 'CategoryController@getFilters');
    Route::get('categories/{slug}', 'CategoryController@findBySlug');

    // Mobile optimized - fast cached lightweight
    Route::get('mobile/news/new-count', 'MobileNewsController@newCount');
    Route::get('mobile/news', 'MobileNewsController@index');
    Route::get('mobile/news/{slug}', 'MobileNewsController@show');
    Route::post('mobile/posts/{id}/view', 'MobileNewsController@incrementView');
    Route::post('mobile/posts/{id}/viewed', 'MobileNewsController@markViewed')->middleware('auth:sanctum');
    Route::post('mobile/posts/{id}/like', 'MobileNewsController@toggleLike')->middleware('auth:sanctum');
    Route::get('mobile/posts/liked', 'MobileNewsController@likedPosts')->middleware('auth:sanctum');
    Route::get('mobile/posts/{id}/comments', 'MobileNewsController@comments');
    Route::post('mobile/posts/{id}/comments', 'MobileNewsController@storeComment')->middleware('auth:sanctum');
    Route::post('mobile/events/batch', 'MobileNewsController@syncEvents')->middleware('auth:sanctum');
});
