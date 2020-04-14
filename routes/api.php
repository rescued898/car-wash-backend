<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('test', function (){
    return 123;
});

Route::prefix('v1')
    ->namespace('Api')
    ->middleware('change-locale')
    ->name('api.v1.')
    ->group(function () {
        Route::post('login', 'LoginController@login');
        Route::middleware('throttle:' . config('api.rate_limits.sign'))
            ->group(function () {

            });

        Route::middleware('throttle:' . config('api.rate_limits.access'))
            ->group(function () {

                Route::middleware('auth:api')->group(function() {

                });
            });
    });
