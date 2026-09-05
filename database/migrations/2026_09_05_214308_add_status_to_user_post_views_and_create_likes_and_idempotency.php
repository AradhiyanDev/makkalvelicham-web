<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Add status to user_post_views for viewed->view state machine
        Schema::table('user_post_views', function (Blueprint $table): void {
            if (! Schema::hasColumn('user_post_views', 'status')) {
                $table->string('status', 20)->default('viewed')->after('post_id'); // viewed | view
                $table->index('status');
            }
            if (! Schema::hasColumn('user_post_views', 'event_type')) {
                $table->string('event_type', 30)->nullable()->after('status');
            }
        });

        // Likes table for idempotent like/unlike (replaces favorite_posts JSON dual)
        if (! Schema::hasTable('likes')) {
            Schema::create('likes', function (Blueprint $table): void {
                $table->id();
                $table->unsignedBigInteger('user_id')->index();
                $table->unsignedBigInteger('post_id')->index();
                $table->timestamps();
                $table->unique(['user_id', 'post_id']);
                $table->index(['post_id', 'created_at']);
            });
        }

        // Idempotency keys for safe retries
        if (! Schema::hasTable('idempotency_keys')) {
            Schema::create('idempotency_keys', function (Blueprint $table): void {
                $table->id();
                $table->string('idempotency_key', 64)->unique();
                $table->unsignedBigInteger('user_id')->nullable()->index();
                $table->string('route', 191)->index();
                $table->json('response_json')->nullable();
                $table->timestamp('created_at')->useCurrent();
                $table->index(['created_at']);
            });
        }
    }

    public function down(): void
    {
        Schema::table('user_post_views', function (Blueprint $table): void {
            if (Schema::hasColumn('user_post_views', 'status')) {
                $table->dropColumn(['status', 'event_type']);
            }
        });
        Schema::dropIfExists('likes');
        Schema::dropIfExists('idempotency_keys');
    }
};
