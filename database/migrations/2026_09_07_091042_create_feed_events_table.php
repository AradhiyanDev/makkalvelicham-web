<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (! Schema::hasTable('feed_events')) {
            Schema::create('feed_events', function (Blueprint $table): void {
                $table->id();
                $table->unsignedBigInteger('user_id')->nullable()->index();
                $table->unsignedBigInteger('post_id')->index();
                $table->string('event_type', 30)->index(); // impression, engaged_view, deep_read, skip, like, unlike, view, viewed, share, bookmark, comment
                $table->timestamp('occurred_at')->index();
                $table->string('idempotency_key', 64)->unique();
                $table->timestamps();
                $table->index(['user_id', 'occurred_at']);
                $table->index(['post_id', 'event_type']);
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('feed_events');
    }
};
