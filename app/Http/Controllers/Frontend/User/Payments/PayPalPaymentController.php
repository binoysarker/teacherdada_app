<?php

namespace App\Http\Controllers\Frontend\User\Payments;

use URL;
use Auth;
use Input;
use Cookie;
use Session;
use Redirect;
use App\Models\Coupon;
use App\Models\Course;
use Illuminate\Http\Request;
use App\Models\Auth\User;
use App\Http\Controllers\Controller;
use App\Models\Payment as CoursePayment;

/** All Paypal Details class **/
use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Api\Amount;
use PayPal\Api\Details;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\RedirectUrls;
use PayPal\Api\ExecutePayment;
use PayPal\Api\PaymentExecution;
use PayPal\Api\Transaction;

class PayPalPaymentController extends Controller
{
    private $_api_context;
    
    public function __construct()
    {

        $paypal_conf = \Config::get('paypal');
        $this->_api_context = new ApiContext(new OAuthTokenCredential($paypal_conf['client_id'], $paypal_conf['secret']));
        $this->_api_context->setConfig($paypal_conf['settings']);
    }
    
    
    public function charge(Request $request)
    {
 
        $course = Course::find($request->course);
        
        $coupon = Coupon::where('code', $request->coupon)
            ->where(function($q) use ($course) {
                $q->where('course_id', $course->id)
                  ->orWhere('sitewide', true);
            })->first();
        //dd($coupon);
        
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
        
        
        $payer = new Payer();
        $payer->setPaymentMethod('paypal');
        $item_1 = new Item();
        $item_1->setName($course->title) // name of the item or course here
            ->setCurrency(config('site_settings.site_currency_code'))
            ->setQuantity(1)
            ->setPrice($request->amount);
            
        $item_list = new ItemList();
        $item_list->setItems(array($item_1));
        $amount = new Amount();
        $amount->setCurrency(config('site_settings.site_currency_code'))
            ->setTotal($request->amount);
        $transaction = new Transaction();
        $transaction->setAmount($amount)
            ->setItemList($item_list)
            ->setDescription('Course purchase: ' . $course->title);
        $redirect_urls = new RedirectUrls();
        $redirect_urls->setReturnUrl(URL::route('frontend.course.charge.paypal.status'))
            ->setCancelUrl(URL::route('frontend.course.charge.paypal.status'));
        $payment = new Payment();
        $payment->setIntent('Sale')
            ->setPayer($payer)
            ->setRedirectUrls($redirect_urls)
            ->setTransactions(array($transaction));
        try {
            $payment->create($this->_api_context);
        } catch (\PayPal\Exception\PPConnectionException $ex) {
            if (\Config::get('app.debug')) {
                \Session::put('error', 'Connection Timeout');
                return Redirect::route('frontend.user.course.checkout', $course); // check route
            } else {
                \Session::put('error', 'An error was encountered while processing your payment. Please try again');
                return Redirect::route('frontend.user.course.checkout', $course); // check route
            }
        }
        
        foreach($payment->getLinks() as $link) {
            if($link->getRel() == 'approval_url') {
                $redirect_url = $link->getHref();
                break;
            }
        }
        /** add payment ID to session **/
        Session::put('paypal_payment_id', $payment->getId());
        Session::put('course_id', $course->id);
        Session::put('amount', $request->amount);
        Session::put('coupon', $request->coupon);
        
        if(isset($redirect_url)) {
            return Redirect::away($redirect_url);
        }
        
        \Session::put('error', 'An error was encountered while processing your payment. Please try again');
        return Redirect::route('frontend.user.course.checkout', $course); // check route
    }
    
    
    
    public function paymentStatus(Request $request)
    {
        /** Get the payment ID before session clear **/
        
        $course = Course::find(Session::get('course_id'));
        $amount = Session::get('amount');
        
        $coupon = Coupon::where('code', Session::get('coupon'))
            ->where(function($q) use ($course) {
                $q->where('course_id', $course->id)
                  ->orWhere('sitewide', true);
            })->first();
            

        $payment_id = Session::get('paypal_payment_id');
        
        /** clear the session payment ID **/
        Session::forget('paypal_payment_id');
        Session::forget('amount');
        Session::forget('coupon');
        Session::forget('course_id');
        
        if (empty($request->PayerID) || empty($request->token)) {
            \Session::put('error', 'Payment failed. Please try again.');
            return Redirect::route('frontend.user.course.checkout', $course); // check url
        }
        
        $payment = Payment::get($payment_id, $this->_api_context);
        
        $execution = new PaymentExecution();
        $execution->setPayerId($request->PayerID);
        
        $result = $payment->execute($execution, $this->_api_context);

        if ($result->getState() == 'approved') { 
            $author = $course->author;
            
            $affid = $request->cookie('EDUCORE_AFFID');
            $referee = User::where('affiliate_id', $affid)->first();
            $payer = $request->user();
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
            $payment->course_id = $course->id;
            $payment->payer_id = $payer->id;
            if(!is_null($referee) && config('site_settings.site_enable_affiliate') == 1){
            	$payment->referred_by = $referee->id;
            }
            if($coupon){
            	$payment->coupon_id = $coupon->id;
            }
            $payment->payment_method = 'paypal';
            $payment->amount = $amount;
            $payment->description = 'sale';
            $payment->author_earning = $authorEarning;
            $payment->affiliate_earning = $affiliateEarning;
            $payment->payment_id = $payment_id;
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
