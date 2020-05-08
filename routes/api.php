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

Route::prefix('v1')
    ->namespace('Api')
    // ->middleware('change-locale')
    ->name('api.v1.')
    ->group(function () {
        Route::middleware('throttle:' . config('api.rate_limits.sign'))
            ->group(function () {
                // 图片验证码
                Route::post('captcha', 'CaptchaController@store')
                    ->name('captcha.store');
                // 短信验证码
                Route::post('verificationCodes', 'VerificationCodesController@store')
                    ->name('verificationCodes.store');
                // 用户注册
                Route::post('user', 'UserController@store')
                    ->name('users.store');

                // 登录
                Route::post('login', 'LoginController@login')
                    ->name('authorization.refresh');;
                // 刷新token
                Route::put('refresh', 'LoginController@refresh')
                    ->name('authorization.refresh');
                // 删除token
                Route::delete('logout', 'LoginController@logout')
                    ->name('authorization.logout');
            });

        Route::middleware('throttle:' . config('api.rate_limits.access'))
            ->group(function () {
                // 某个用户的详情
                Route::get('user/{user}', 'UserController@show')
                    ->name('user.show');
                // 获取所有洗车点坐标
                Route::get('/', 'PointController@index')
                    ->name('point.index');


                Route::middleware('auth:api')->group(function() {
                    // 当前登录用户信息
                    Route::get('user', 'UserController@me')
                        ->name('user.show');
                    // 编辑登录用户信息
                    Route::patch('user', 'UserController@update')
                        ->name('user.update');

                    // 查看历史订单
                    Route::patch('user', 'OrderController@index')
                        ->name('order.index');

                    // 测试路由
                    Route::get('test', 'UserController@index')
                        ->name('user.index');

                });
            });
    });
