<?php

namespace Botble\SocialLogin\Http\Controllers\API;

use Botble\Api\Http\Controllers\BaseApiController;
use Botble\SocialLogin\Facades\SocialService;
use Botble\SocialLogin\Services\SocialLoginService;
use Carbon\Carbon;
use Exception;
use Google_Client;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use Laravel\Socialite\Two\User as SocialiteUser;
use Throwable;

class GoogleLoginController extends BaseApiController
{
    public function __construct(protected SocialLoginService $socialLoginService)
    {
    }

    /**
     * Google login
     *
     * @group Social Login
     *
     * @bodyParam identityToken string required The Google identity token received from Google Sign-In.
     * @bodyParam guard string optional The guard to use for authentication (default: web).
     *
     * @response 200 {
     *   "error": false,
     *   "data": {
     *     "token": "1|abc123def456...",
     *     "user": {
     *       "id": 1,
     *       "name": "John Doe",
     *       "email": "john@example.com"
     *     }
     *   },
     *   "message": "Login successful"
     * }
     *
     * @response 400 {
     *   "error": true,
     *   "message": "Invalid Google token"
     * }
     *
     * @response 400 {
     *   "error": true,
     *   "message": "Google authentication is not properly configured"
     * }
     */
    public function login(Request $request)
    {
        $identityTokenPreview = $request->input('identityToken')
            ? substr((string) $request->input('identityToken'), 0, 24) . '... (len=' . strlen((string) $request->input('identityToken')) . ')'
            : 'MISSING';
        $guardInput = $request->input('guard', 'web');

        logger()->info('[GoogleLogin] Incoming request', [
            'guard' => $guardInput,
            'identityToken_preview' => $identityTokenPreview,
            'ip' => $request->ip(),
        ]);

        try {
            $request->validate([
                'identityToken' => ['required', 'string'],
                'guard' => ['string', 'nullable'],
            ]);

            $identityToken = $request->input('identityToken');
            $guard = $request->input('guard', 'web');

            $clientId = SocialService::setting('google_app_id');
            $clientSecret = SocialService::setting('google_app_secret');

            if (! $clientId || ! $clientSecret) {
                logger()->error('[GoogleLogin] Missing Google config', [
                    'has_client_id' => ! empty($clientId),
                    'has_client_secret' => ! empty($clientSecret),
                    'client_id_preview' => $clientId ? substr($clientId, 0, 12) . '...' : 'MISSING',
                    'guard' => $guard,
                ]);

                return $this->httpResponse()
                    ->setError()
                    ->setMessage(__('Google authentication is not properly configured'))
                    ->toApiResponse();
            }

            logger()->info('[GoogleLogin] Verifying token', [
                'guard' => $guard,
                'client_id_preview' => substr($clientId, 0, 16) . '...',
                'identityToken_preview' => substr($identityToken, 0, 24) . '...',
                'identityToken_len' => strlen($identityToken),
            ]);

            $googleUserData = $this->verifyGoogleToken($identityToken, $clientId);

            if (! $googleUserData) {
                logger()->error('[GoogleLogin] Token verification returned null', [
                    'guard' => $guard,
                    'client_id_preview' => substr($clientId, 0, 16) . '...',
                    'identityToken_preview' => substr($identityToken, 0, 24) . '... (len=' . strlen($identityToken) . ')',
                    'hint' => 'Check aud mismatch (Flutter serverClientId vs backend google_app_id), expired token, or wrong Google project.',
                ]);

                return $this->httpResponse()
                    ->setError()
                    ->setMessage(__('Invalid Google token'))
                    ->toApiResponse();
            }

            logger()->info('[GoogleLogin] Token verified', [
                'email' => $googleUserData['email'] ?? 'MISSING',
                'sub_preview' => isset($googleUserData['sub']) ? substr((string) $googleUserData['sub'], 0, 8) . '...' : 'MISSING',
                'aud' => $googleUserData['aud'] ?? null,
                'iss' => $googleUserData['iss'] ?? null,
                'exp' => $googleUserData['exp'] ?? null,
                'guard' => $guard,
            ]);

            $email = $googleUserData['email'] ?? null;
            $googleId = $googleUserData['sub'] ?? null;

            if (! $email || ! $googleId) {
                logger()->error('[GoogleLogin] Token missing email/sub', [
                    'keys' => array_keys($googleUserData),
                    'guard' => $guard,
                ]);

                return $this->httpResponse()
                    ->setError()
                    ->setMessage(__('Cannot login, no email or Google ID provided!'))
                    ->toApiResponse();
            }

            $providerData = SocialService::supportedModules()[$guard] ?? null;

            if (! $providerData) {
                logger()->error('[GoogleLogin] Invalid guard configuration', [
                    'guard' => $guard,
                    'supported_guards' => array_keys(SocialService::supportedModules()),
                ]);

                return $this->httpResponse()
                    ->setError()
                    ->setMessage(__('Invalid guard configuration'))
                    ->toApiResponse();
            }

            $model = new $providerData['model']();

            $account = $this->socialLoginService->findUserByEmail($email, $model::class);
            $socialLoginUser = $this->socialLoginService->findUserByProvider('google', $googleId);

            logger()->info('[GoogleLogin] Account lookup', [
                'guard' => $guard,
                'model' => $model::class,
                'found_by_email' => (bool) $account,
                'found_by_provider' => (bool) $socialLoginUser,
            ]);

            if ($socialLoginUser && ! $account) {
                $account = $socialLoginUser->user;
            }

            if (! $account) {
                logger()->info('[GoogleLogin] Creating new account', [
                    'email' => $email,
                    'guard' => $guard,
                    'model' => $model::class,
                ]);

                $data = [
                    'name' => $googleUserData['name'] ?? $googleUserData['given_name'] ?? $email,
                    'email' => $email,
                    'password' => Hash::make(Str::random(36)),
                ];

                // The 'social_login_before_saving_account' filter expects a
                // Socialite-style user object (getName()/getEmail()/...), NOT a
                // plain stdClass — passing (object) $payload fatals with
                // "Call to undefined method stdClass::getName()" (HTTP 500).
                $oAuthUser = (new SocialiteUser)->map([
                    'id' => $googleId,
                    'name' => $googleUserData['name'] ?? $googleUserData['given_name'] ?? $email,
                    'email' => $email,
                    'avatar' => $googleUserData['picture'] ?? null,
                ]);
                $oAuthUser->setRaw($googleUserData);

                $data = apply_filters('social_login_before_saving_account', $data, $oAuthUser, $providerData);

                logger()->info('[GoogleLogin] Filter applied, saving account', [
                    'email' => $email,
                    'data_keys' => array_keys($data),
                    'guard' => $guard,
                ]);

                $account = $model;
                $account->fill($data);
                $account->confirmed_at = Carbon::now();
                $account->save();

                logger()->info('[GoogleLogin] Account saved', [
                    'user_id' => $account->getKey(),
                    'email' => $account->email,
                    'guard' => $guard,
                ]);

                event(new Registered($account));
            }

            $socialLoginData = $this->socialLoginService->createSocialLoginData([
                'provider' => 'google',
                'id' => $googleId,
                'token' => $identityToken,
                'refresh_token' => null,
                'expires_in' => null,
                'name' => $googleUserData['name'] ?? $googleUserData['given_name'] ?? $account->name,
                'email' => $email,
                'avatar' => $googleUserData['picture'] ?? null,
            ]);

            // Use the new method that handles duplicates properly
            $this->socialLoginService->createOrUpdateSocialLogin($account, $socialLoginData);

            $token = $account->createToken('google-login')->plainTextToken;

            logger()->info('[GoogleLogin] Login success', [
                'user_id' => $account->getKey(),
                'email' => $account->email,
                'guard' => $guard,
            ]);

            return $this->httpResponse()
                ->setData([
                    'token' => $token,
                    'user' => [
                        'id' => $account->getKey(),
                        'name' => $account->name,
                        'email' => $account->email,
                    ],
                ])
                ->setMessage(__('Login successful'))
                ->toApiResponse();

        } catch (ValidationException $e) {
            logger()->error('[GoogleLogin] Validation error', [
                'errors' => $e->errors(),
                'message' => $e->getMessage(),
                'guard' => $guardInput,
                'identityToken_preview' => $identityTokenPreview,
            ]);

            return $this->httpResponse()
                ->setError()
                ->setMessage($e->getMessage())
                ->withInput()
                ->toApiResponse();
        } catch (Throwable $e) {
            // NOTE: Throwable (not just Exception) — PHP Errors such as
            // "Call to undefined method" otherwise escape as an HTML 500
            // with no [GoogleLogin] log context.
            logger()->error('[GoogleLogin] Unhandled throw: ' . $e->getMessage(), [
                'throw_class' => get_class($e),
                'file' => $e->getFile(),
                'line' => $e->getLine(),
                'trace' => $e->getTraceAsString(),
                'guard' => $guardInput ?? null,
                'identityToken_preview' => $identityTokenPreview,
            ]);

            return $this->httpResponse()
                ->setError()
                ->setMessage(__('Google token invalid'))
                ->toApiResponse();
        }
    }

    protected function verifyGoogleToken(string $identityToken, string $clientId): ?array
    {
        try {
            $client = new Google_Client(['client_id' => $clientId]);

            $payload = $client->verifyIdToken($identityToken);

            if (! $payload) {
                // Decode WITHOUT verification to log WHY it failed (aud mismatch is #1 cause)
                $unverified = $this->decodeTokenPreview($identityToken);
                logger()->error('[GoogleLogin] verifyIdToken returned false/null', [
                    'expected_client_id' => substr($clientId, 0, 20) . '...',
                    'token_aud' => $unverified['aud'] ?? 'UNKNOWN',
                    'token_iss' => $unverified['iss'] ?? 'UNKNOWN',
                    'token_exp' => $unverified['exp'] ?? 'UNKNOWN',
                    'now' => time(),
                    'aud_match' => isset($unverified['aud']) ? ($unverified['aud'] === $clientId ? 'YES' : 'NO') : 'UNKNOWN',
                    'token_preview' => substr($identityToken, 0, 24) . '...',
                ]);

                return null;
            }

            return $payload;

        } catch (Throwable $e) {
            logger()->error('[GoogleLogin] Token verification throw: ' . $e->getMessage(), [
                'throw_class' => get_class($e),
                'file' => $e->getFile(),
                'line' => $e->getLine(),
                'trace' => $e->getTraceAsString(),
                'expected_client_id_preview' => substr($clientId, 0, 20) . '...',
                'token_preview' => substr($identityToken, 0, 24) . '...',
            ]);

            return null;
        }
    }

    protected function decodeTokenPreview(string $identityToken): array
    {
        try {
            $parts = explode('.', $identityToken);
            if (count($parts) < 2) {
                return [];
            }
            $json = base64_decode(strtr($parts[1], '-_', '+/'));

            return (array) json_decode((string) $json, true);
        } catch (Exception $e) {
            return [];
        }
    }
}
