<?php

namespace App\Http\Controllers\Frontend\_Author;
use Session;
use Redirect;
use Cookie;
use App\DB;
use Carbon\Carbon;
use Razorpay\Api\Api;
use App\Models\Auth\User;
use App\Models\Transaction;
use Illuminate\Support\Facades\Input;
use App\Models\Payment;
use App\Models\Coupon;
use App\Models\Course;
use App\Models\Package;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AuthorCouponController extends Controller
{
   

	public function index(Course $course, Request $request)
    {
        if($course->user_id != $request->user()->id){
            return redirect(route('frontend.author.dashboard'))->withFlashDanger(trans('auth.general_error'));
        };

        $prices = collect(explode(',',config('site_settings.pricelist')));
        
      

        return view('_Author.course-pricing', compact('course', 'prices'));
    }
    
    public function fetchCoupons($course)
    {

        $coupons = Coupon::where('course_id', $course)->paginate(10);

       // dd($coupons);
        $quantity = 0;
        foreach($coupons as $c){
            $c->active ? $c->active=true : $c->active=false;  
            $c->finalPrice = round($c->course->price - (($c->percent/100)*$c->course->price), 1);
            $c->link = route('frontend.course.show', $c->course) . '?COUPON='.$c->code;
            $c->totalUsed = $c->payments->count(); 
            $quantity += $c->quantity;
            $c->exhausted = $c->payments->count() >= $c->quantity ? true:false;
        };
        
        if (isset($request->per_page)) {
            $per_page = $request->per_page;
        } else {
            $per_page = 10;
        }
        
        return [
            'pagination' => [
                'total' => $coupons->total(),
                'per_page' => $per_page,
                'current_page' => $coupons->currentPage(),
                'last_page' => $coupons->lastPage(),
                'next_page_url' => $coupons->nextPageUrl(),
                'prev_page_url' => $coupons->previousPageUrl(),
                'from' => $coupons->firstItem(),
                'to' => $coupons->lastItem(),
            ],
            'data' => $coupons->items(),
            'used_coupon_total' =>  $quantity,
        ];

        return response()->json($coupons, 200);
    }

    public function activate(Request $request, $id)
    {
        $coupon = Coupon::find($id);
        $request->status==true ? $coupon->active=false : $coupon->active=true; 
        $coupon->save();
        return response()->json($coupon, 200);
    }
    
    public function store(Request $request)
    {
        $course_id = $request->course_id;
        
        $this->validate($request, [
            'code' => 'required|alpha_dash|unique:coupons,code,NULL,id,course_id,' . $course_id,
            'percent' => 'required|numeric|max:100|min:100',
            'quantity' => 'required|numeric|min:1'
        ]);
        
        $coupon = new Coupon();
        $coupon->course_id = $request->course_id;
        $coupon->code = strToUpper($request->code);
        $coupon->percent = $request->percent;
        $coupon->quantity = $request->quantity;

        if($request->expires){
            $coupon->expires = date("Y-m-d",strtotime($request->expires));
        }
        
        $coupon->active = true;
        
        $coupon->save();
        
        return response()->json(null, 200);
        
    }
    public function generate_coupon(Request $request)
    { 
        $course_id = $request->course_id;
        $author_id = $request->user_id;
        $code = $course_id ." ". $author_id;
        $percent = 100;
        $quantity = 51;
        $effectiveDate = Carbon::now()->addMonths(6);
        $coupon = new Coupon();
        $coupon->course_id = $request->course_id;
        $coupon->code = strToUpper($code);
        $coupon->percent = $percent;
        $coupon->quantity =  $quantity;
        $coupon->expires = $effectiveDate;
        $coupon->active = true;
        
        $coupon->save();
        
        return response()->json(null, 200);  
       
        
    }
public function process(Request $request, Course $course)
    {
       
        $input = Input::all();
        $amount = $request->price;
         $api = new Api(config('services.razorpay.key'), config('services.razorpay.secret'));
        if($amount = 2000){

$payment = $api->payment->fetch($input['razorpay_payment_id1']);
$razor_id = $input['razorpay_payment_id1'];
        }
        else{
            $payment = $api->payment->fetch($input['razorpay_payment_id']);
            $razor_id = $input['razorpay_payment_id'];
        }
        
        //get API Configuration 
       
        
        //Fetch payment information by razorpay_payment_id
        
        
        if(count($input)  && !empty($razor_id)) {
            try {
                $response = $api->payment->fetch($razor_id)
                                ->capture(array('amount' => $payment['amount']));
                
                // save to database
              
              $payer = $request->user();
                
                
                // /************** Insert Payments ***************/
                // $payment = new PackagePayment();
                // $payment->payer_id = $payer->id;
                // $payment->payment_method = 'razorpay';
                // $payment->amount = $amount;
                // $payment->description = 'sale';
                // $payment->author_earning = 0;
                // $payment->affiliate_earning = 0;
                // $payment->payment_id = 'Package Sale RazorPay ID: ' . $response->id;
                // $payment->save();
                
                // $payer->packages()->create([
                //     'package_id' => $package->id,
                //     'validity' => $package->validity,
                //     'discount' => $package->discount,
                //     'amount_paid' => $amount,
                //     'payment_id' => $payment->id    
                // ]);
                
                return redirect()->back()->withFlashSuccess('Payment Processed Successfully. Thank you!');
                
            } catch (\Exception $e) {
                return  $e->getMessage();
                \Session::put('error', $e->getMessage());
                return redirect()->back();
            }
        }
    }
    
}
