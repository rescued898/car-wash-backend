<?php


namespace App\Models;


class Point extends Model
{
    protected $table = 'point';
    protected $guarded = [];

    public function machines()
    {
        return $this->hasMany(PointMachine::class, 'point_id', 'id');
    }
}
