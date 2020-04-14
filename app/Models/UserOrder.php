<?php


namespace App\Models;

class UserOrder extends Model
{
    protected $table = 'user_orders';
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function point()
    {
        return $this->hasOne(Point::class,'point_id', 'id');
    }

    public function machine()
    {
        return $this->hasOne(PointMachine::class, 'point_machine_id', 'id');
    }
}
