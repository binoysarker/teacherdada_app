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

class PayWithPackageController extends Controller
{
    
    
    public function charge(Request $request)
    {
        
        
        $course = Course::find($request->course);
        $package = $request->user()->packages()
                    ->where('id', $request->package)
                    ->where('validity', '>', strtotime('1 year ago'))->first();
                    
        if(is_null($package)){
            return redirect(route('frontend.user.course.checkout', $course))
                    ->withFlashDanger('You do not have suffient balance for purchase this courses or left for this subscription package!');
        }

        
        // now complete the purchase
        $author = $course->author;
        $payer = $request->user();
        
        $organicPercent = config('site_settings.earning_organic_sales_percentage')/100;
        
        $cost_per_course = $course->price;
        
        /************** Insert Payments ***************/
        $payment = new CoursePayment();
        $payment->course_id = $request->course;
        $payment->payer_id = $payer->id;

        $payment->payment_method = 'subscription package';
        $payment->amount = $cost_per_course;
        $payment->description = 'sale';
        $payment->author_earning = $cost_per_course*$organicPercent;
        
        $payment->affiliate_earning = 0;
        $payment->payment_id = 'Course purchased with subscription package ' . $package->package->name;
        $payment->user_package_id = $package->id;
        $payment->save();

        
        // reduce the number of courses available for the subscription package
        $package->number_used = ($package->amount_paid + ($package->amount_paid*$package->discount/100))- $cost_per_course;
        $package->save();
        
        
        // enroll the student
        $course->students()->attach($payer->id);
      
        $author_transaction = $author->transactions()->create([
            'uuid' => 2431000 + time() + random_int(99, 2000),
            'type' => 'credit',
            'description' => 'Sale',
            'long_description' => 'Sale of '. $course->title,
            'amount' => $payment->author_earning
        ]);
        
        $payment->transaction_id = $author_transaction->id;
        $payment->save();
        
        return redirect()->route('frontend.course.show', $course);
    }
    
    
}
