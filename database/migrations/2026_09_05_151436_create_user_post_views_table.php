<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('user_post_views', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable()->index();
            $table->unsignedBigInteger('post_id')->index();
            $table->string('ip_address', 45)->nullable();
            $table->timestamps();

            $table->unique(['user_id', 'post_id']);
            $table->index(['post_id', 'created_at']);
        });

        // Add index for featured filter speed
        Schema::table('posts', function (Blueprint $table): void {
            if (! Schema::hasColumn('posts', 'is_featured')) {
                return;
            }
            try {
                $table->index('is_featured');
            } catch (Exception $e) {
            }
        });

        // Add index for views sorting
        Schema::table('posts', function (Blueprint $table): void {
            try {
                $table->index('views');
            } catch (Exception $e) {
            }
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('user_post_views');
    }
};
