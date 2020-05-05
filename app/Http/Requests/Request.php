<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class Request extends FormRequest
{
    const AUTH_TRUE = true;
    const AUTH_FALSE = false;
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return self::AUTH_TRUE;
    }

    public function failedValidation($validator)
    {
        $error= $validator->errors()->first();
        throw new HttpResponseException(response()->json(apiExceptionResponse(400, $error)));
    }
}
