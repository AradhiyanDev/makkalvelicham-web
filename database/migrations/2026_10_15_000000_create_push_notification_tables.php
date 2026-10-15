<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (! Schema::hasTable('device_tokens')) {
            Schema::create('device_tokens', function (Blueprint $table) {
                $table->id();
                $table->string('token')->unique();
                $table->string('platform')->nullable();
                $table->string('app_version')->nullable();
                $table->string('device_id')->nullable();
                $table->string('user_type')->nullable();
                $table->unsignedBigInteger('user_id')->nullable();
                $table->boolean('is_active')->default(true);
                $table->timestamp('last_used_at')->nullable();
                $table->timestamps();

                $table->index(['user_type', 'user_id']);
                $table->index(['platform', 'is_active']);
                $table->index(['is_active']);
            });
        }

        if (! Schema::hasTable('push_notifications')) {
            Schema::create('push_notifications', function (Blueprint $table) {
                $table->id();
                $table->string('title');
                $table->text('message');
                $table->string('type')->default('general');
                $table->string('target_type')->nullable();
                $table->string('target_value')->nullable();
                $table->string('action_url')->nullable();
                $table->string('image_url')->nullable();
                $table->json('data')->nullable();
                $table->string('status')->default('sent');
                $table->integer('sent_count')->default(0);
                $table->integer('failed_count')->default(0);
                $table->integer('delivered_count')->default(0);
                $table->integer('read_count')->default(0);
                $table->timestamp('scheduled_at')->nullable();
                $table->timestamp('sent_at')->nullable();
                $table->unsignedBigInteger('created_by')->nullable();
                $table->timestamps();

                $table->index(['type', 'created_at']);
                $table->index(['status', 'scheduled_at']);
            });
        }

        if (! Schema::hasTable('push_notification_recipients')) {
            Schema::create('push_notification_recipients', function (Blueprint $table) {
                $table->id();
                $table->unsignedBigInteger('push_notification_id');
                $table->string('user_type', 50)->nullable();
                $table->unsignedBigInteger('user_id')->nullable();
                $table->string('device_token')->nullable();
                $table->string('platform', 20)->nullable();
                $table->string('status', 20)->default('sent');
                $table->timestamp('sent_at')->nullable();
                $table->timestamp('delivered_at')->nullable();
                $table->timestamp('read_at')->nullable();
                $table->timestamp('clicked_at')->nullable();
                $table->json('fcm_response')->nullable();
                $table->string('error_message')->nullable();
                $table->timestamps();

                $table->index(['push_notification_id', 'user_type', 'user_id'], 'pnr_notification_user_index');
                $table->index(['status'], 'pnr_status_index');
            });
        } elseif (DB::getDriverName() === 'mysql') {
            // Guest pushes have no user — allow NULLs on legacy installs.
            DB::statement('ALTER TABLE `push_notification_recipients` MODIFY `user_type` varchar(50) NULL');
            DB::statement('ALTER TABLE `push_notification_recipients` MODIFY `user_id` bigint unsigned NULL');
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('push_notification_recipients');
        Schema::dropIfExists('push_notifications');
        Schema::dropIfExists('device_tokens');
    }
};
