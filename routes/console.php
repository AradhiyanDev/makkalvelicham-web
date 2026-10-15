<?php

use Botble\Api\Models\DeviceToken;
use Botble\Api\Models\PushNotification;
use Botble\Api\Services\PushNotificationService;
use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote')->hourly();

Artisan::command('push:test {token} {--title=Test push} {--body=Hello from Makkal Velicham}', function (PushNotificationService $push, string $token) {
    $notification = PushNotification::create([
        'title' => $this->option('title'),
        'message' => $this->option('body'),
        'type' => 'test',
        'target_type' => 'test',
        'target_value' => 'push:test',
        'status' => 'sending',
    ]);

    $device = new DeviceToken(['token' => $token, 'platform' => 'android']);

    $result = $push->sendToDeviceTokens(collect([$device]), [
        'title' => $notification->title,
        'message' => $notification->message,
        'type' => 'test',
    ], $notification);

    if ($result['success'] ?? false) {
        $this->info('Sent! ' . ($result['message'] ?? ''));
    } else {
        $this->error('Failed: ' . ($result['message'] ?? 'unknown'));
    }
})->purpose('Send a test push to one FCM token');
