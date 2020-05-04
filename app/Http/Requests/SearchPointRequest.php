<?php

namespace App\Http\Requests;


class SearchPointRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'search' => ['filled', 'max:100']
        ];
    }
}
