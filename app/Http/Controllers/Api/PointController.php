<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\SearchPointRequest;
use App\Models\Point;
use Illuminate\Http\Request;

class PointController extends Controller
{

    public function index(SearchPointRequest $request)
    {
        $search = $request->input('search');
        $points = Point::query()
            ->where('status', 1)
            ->when($search, function ($query) use ($search) {
                $query->where('name', 'like', '%' . $search . '%');
            })
            ->select(['id','name', 'address', 'lat','lng'])
            ->get();
        $total = count($points);
        return response()->json(apiResponse(200, 'success', compact('points', 'total')));
    }
}
