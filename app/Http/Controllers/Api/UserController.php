<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserRequest;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;

class UserController extends Controller
{
    //
    public function index()
    {
        $id = Auth::user()->id;
    }

    //注册用户
    public function store(UserRequest $request)
    {
        $verifyData = Cache::get($request->verification_key);

        if (!$verifyData) {
            abort(403, '验证码已失效');
        }

        if (!hash_equals($verifyData['code'], $request->verification_code)) {
            // 返回401
            throw new AuthenticationException('验证码错误');
        }

        $user = User::create([
            'name' => $request->name,
            'phone' => $verifyData['phone'],
            'password' => $request->password,
        ]);

        // 清除验证码缓存
        Cache::forget($request->verification_key);
        UserResource::withoutWrapping();
        return apiResponse( 200, 'success', (new UserResource($user))->showSensitiveFields());
    }

    // 获取自己的信息
    public function me(Request $request)
    {
        UserResource::withoutWrapping();
        return apiResponse( 200, 'success', (new UserResource($request->user()))->showSensitiveFields() );
    }

}
