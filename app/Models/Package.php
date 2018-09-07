<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    
    
    protected $fillable=[
        'name', 'price', 'validity', 'slug', 'description', 'discount' 
    ];
    
    
    public function payments()
    {
        return $this->hasMany(PackageUser::class, 'package_id');
    }
    
    public function getRouteKeyName()
    {
        return 'slug';
    }
    
}
