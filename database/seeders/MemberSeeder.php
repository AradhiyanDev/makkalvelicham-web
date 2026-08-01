<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Models\Post;
use Botble\Member\Models\Member;
use Botble\Member\Models\MemberActivityLog;
use Botble\Slug\Models\Slug;
use Faker\Factory;
use Illuminate\Support\Str;

class MemberSeeder extends BaseSeeder
{
    public function run(): void
    {
        $faker = Factory::create();
        $files = $this->uploadFiles('members');

        $this->truncateTables();

        $member = $this->createMember('John', 'Smith', 'admin@thesky9.com', '12345678', $faker);
        $this->createSlug($member);

        for ($i = 0; $i < 5; $i++) {
            $member = $this->createMember($faker->firstName, $faker->lastName, $faker->email, '12345678', $faker);
            $this->createSlug($member);
        }

        $this->updatePostAuthors($faker);

        $postIds = [1, 2, 3];
    }

    private function truncateTables(): void
    {
        Member::truncate();
        MemberActivityLog::truncate();
        Slug::where('reference_type', Member::class)->delete();
    }

    private function createMember($firstName, $lastName, $email, $password, $faker)
    {
        $files = $this->uploadFiles('members');
        $member = Member::create([
            'first_name' => $firstName,
            'last_name' => $lastName,
            'email' => $email,
            'password' => bcrypt($password),
            'dob' => $faker->dateTime,
            'phone' => $faker->phoneNumber,
            'description' => $faker->realText(100),
            'avatar_id' => $files[$faker->numberBetween(0, 4)]['data']->id,
            'confirmed_at' => now(),
        ]);

        return $member;
    }

    private function createSlug($member): void
    {
        Slug::create([
            'reference_type' => Member::class,
            'reference_id' => $member->id,
            'key' => Str::slug($member->name),
            'prefix' => 'author',
        ]);
    }

    private function updatePostAuthors($faker): void
    {
        foreach (Post::get() as $post) {
            $post->author_id = $faker->numberBetween(1, 5);
            $post->author_type = Member::class;
            $post->save();
        }
    }

}
