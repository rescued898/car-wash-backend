<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserAddressRequest;
use App\Models\UserAddress;
use Illuminate\Http\Request;

class UserAddressController extends Controller
{
    //
    public function store(UserAddressRequest $request)
    {
        $request->user()->addresses()->create($request->only([
            'province',
            'city',
            'district',
            'address',
            'zip',
            'contact_name',
            'contact_phone',
        ]));
        return apiResponse();
    }
    public function update(UserAddressRequest $request, UserAddress $userAddress)
    {
        $this->authorize('own', $userAddress);
        $result = $userAddress->update($request->only([
            'province',
            'city',
            'district',
            'address',
            'zip',
            'contact_name',
            'contact_phone',
        ]));
        if (!$result) return apiResponse(500, 'failed');
        return apiResponse();
    }

    public function destroy(UserAddress $userAddress)
    {
        $this->authorize('own', $userAddress);
        $userAddress->delete();

        // 把之前的 redirect 改成返回空数组
        return response()->json(apiResponse());
    }

}
