<?php

namespace App\Models;


use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Model;

class PackageUser extends Model
{
    
    
    protected $fillable=[
        'package_id',
        'user_id',
        'number_of_courses',
        'number_used',
        'amount_paid',
        'payment_id',
        'validity', 
        'discount',
    ];
    
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    public function package()
    {
        return $this->belongsTo(Package::class);
    }
    
    public function payment()
    {
        return $this->belongsTo(Payment::class);
    }
    
    
}
