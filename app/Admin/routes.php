<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('admin.home');
    $router->resource('package-coupons', 'PackageCouponController');
    $router->resource('points', 'PointController');
    $router->resource('users', 'UserController');
    $router->resource('user-orders', 'UserOrderController');
    $router->resource('point-machines', 'PointMachineController');
});
