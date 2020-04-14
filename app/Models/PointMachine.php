<?php

namespace App\Models;


class PointMachine extends Model
{
    //
    protected $table = 'point_machine';
    protected $guarded = [];

    public function point()
    {
        return $this->belongsTo(Point::class, 'point_id', 'id');
    }
}
