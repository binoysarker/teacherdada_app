<?php

namespace App\Http\Controllers\Frontend\User\Payments;

use Cookie;
use Session;
use Carbon\Carbon;
use App\Models\Course;
use App\Models\Coupon;
use App\Models\Transaction;
use App\Models\Auth\User;
use App\Models\Payment as CoursePayment;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class StripePaymentController extends Controller
{
    
    
    public function charge(Request $request)
    {
        
        $course = Course::find($request->course);
        
        $coupon = Coupon::where('code', $request->coupon)
            ->where(function($q) use ($course) {
                $q->where('course_id', $course->id)
                  ->orWhere('sitewide', true);
            })->first();

        if(!is_null($coupon)){
            $expected_amount = (float)($course->price - ($course->price * ($coupon->percent/100)));
    	    
    	    $expected_amount = number_format((int)$expected_amount ,2,'.','');
    	    $sent_amount = number_format((int)$request->amount,2,'.','');
    	    
    	    
            if($sent_amount != $expected_amount){
                return redirect(route('frontend.user.course.checkout', $course))->withFlashDanger('The price submitted does not match the course price. Purchase declined!');
            }
        } else {
            if($request->amount != $course->price){
                return redirect(route('frontend.user.course.checkout', $course))->withFlashDanger('The price submitted does not match the course price. Purchase declined!');
            }
        }
        
        \Stripe\Stripe::setApiKey(config('services.stripe.secret'));

        $token = $request->token;
        
        $charge = \Stripe\Charge::create(array(
            "amount" => $request->amount * 100,
            "currency" => config('site_settings.site_currency_code'),
            "description" => "Purchase by >> " . $request->user()->email . " <<",
            "source" => $token,
        ));
        
        if ($charge) {
            
            $author = $course->author;
            
            $affid = $request->cookie('EDUCORE_AFFID');
            $referee = User::where('affiliate_id', $affid)->first();
            
            $payer = $request->user();
            $amount = $request->amount;
            $organicPercent = $author->commission_pct ? $author->commission_pct : config('site_settings.earning_organic_sales_percentage')/100;
            $promoPercent = config('site_settings.earning_promo_sales_percentage')/100;
            $affiliatePercent = config('site_settings.earning_affiliate_sales_percentage')/100;
            
            
            /**************** Calculate Earnings **********/
            if(!is_null($referee) && config('site_settings.site_enable_affiliate') == 1){
                $affiliateEarning = $amount*$affiliatePercent;
                $amountLeft = $amount - $affiliateEarning;
                
                if(!is_null($coupon) && $coupon->sitewide == false){
                    $authorEarning = $amountLeft * $promoPercent;
                } else {
                    $authorEarning = $amountLeft * $organicPercent;
                }
                
            } else {
                $affiliateEarning = 0;
                
                if(!is_null($coupon && $coupon->sitewide == false)){
                    $authorEarning = $amount * $promoPercent;
                } else {
                    $authorEarning = $amount * $organicPercent;
                }
                
            }
            
            
            /************** Insert Payments ***************/
            $payment = new CoursePayment();
            
            $payment->course_id = $request->course;
            $payment->payer_id = $payer->id;
            
            if(!is_null($referee) && config('site_settings.site_enable_affiliate') == 1){
                $payment->referred_by = $referee->id;
            }
            if(!is_null($coupon)){
                $payment->coupon_id = $coupon->id;
            }
            $payment->payment_method = 'stripe';
            $payment->amount = $request->amount;
            $payment->description = 'sale';
            $payment->author_earning = $authorEarning;
            $payment->affiliate_earning = $affiliateEarning;
            $payment->payment_id = 'Expires: ' . $request->input('expiry-month') . '/' . $request->input('expiry-year');
            $payment->save();
            
            // enroll the student
            $course->students()->attach($payer->id);
            
            // insert transaction for author
            $transaction = $author->transactions()->create([
                'uuid' => 2431000 + time() + random_int(99, 2000),
                'type' => 'credit',
                'description' => 'Sale',
                'long_description' => 'Sale of '. $course->title,
                'amount' => $payment->author_earning
            ]);
            
            $payment->transaction_id = $transaction->id;
            $payment->save();
            
            // insert transaction for affiliate if it exists
            if(!is_null($referee) && config('site_settings.site_enable_affiliate') == 1){
                $transaction = $referee->transactions()->create([
                    'uuid' => 2431000 + time() + random_int(99, 2000),
                    'type' => 'credit',
                    'description' => 'Affiliate Program',
                    'long_description' => 'Earnings from Affiliate promotion of "'. $course->title . '"',
                    'amount' => $affiliateEarning
                ]);
            }
            
            \Session::put('success', 'Payment Processed Successfully. Thank you!');
            return redirect()->route('frontend.course.show', $course);
        } else {
            \Session::put('error', 'Error processing payment. Please try again.');
            return redirect(route('frontend.user.course.checkout', $course));
        }
    }
    
}
