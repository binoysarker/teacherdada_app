<?php

namespace App\Models;

use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $fillable = [
    	'user_id', 'coupon_id', 
    	'course_id', 'payment_method', 
    	'user_package_id',
    	'amount','description','author_earning',
    	'affiliate_earning','payment_id',
    	'referred_by', 'transaction_id', 'validity', 'discount'
    ];
    
    public function course()
    {
        return $this->belongsTo(Course::class);
    }
    
    public function packages()
    {
        return $this->hasOne(PackageUser::class);
    }
    
    public function user()
    {
        return $this->belongsTo(User::class, 'payer_id');
    }
    
    public function coupon()
    {
        return $this->belongsTo(Coupon::class);
    }
    
    public function transaction()
    {
        return $this->belongsTo(Transaction::class);
    }
}
