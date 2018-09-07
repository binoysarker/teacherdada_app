<?php

namespace App\Http\Controllers\Frontend;

use Session;
use Redirect;
use Cookie;
use Carbon\Carbon;
use Razorpay\Api\Api;
use App\Models\Course;
use App\Models\Coupon;
use App\Models\Package;
use App\Models\PackageUser;
use App\Models\Auth\User;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Models\Payment as PackagePayment;
use App\Http\Controllers\Controller;

class PackageController extends Controller
{
    
    public function index()
    {
        
        $packages = Package::orderBy('price')->get();
        return view('packages.index', compact('packages'));
    }
    
    
    public function process(Request $request, Package $package)
    {  
        $input = Input::all();
        $amount = $package->price;
        
        //get API Configuration 
        $api = new Api(config('services.razorpay.key'), config('services.razorpay.secret'));
        
        //Fetch payment information by razorpay_payment_id
        $payment = $api->payment->fetch($input['razorpay_payment_id']);
        
        if(count($input)  && !empty($input['razorpay_payment_id'])) {
            try {
                $response = $api->payment->fetch($input['razorpay_payment_id'])
                                ->capture(array('amount' => $payment['amount']));
                
                // save to database
                
                $payer = $request->user();
                
                
                /************** Insert Payments ***************/
                $payment = new PackagePayment();
                $payment->payer_id = $payer->id;
                $payment->payment_method = 'razorpay';
                $payment->amount = $amount;
                $payment->description = 'sale';
                $payment->author_earning = 0;
                $payment->affiliate_earning = 0;
                $payment->payment_id = 'Package Sale RazorPay ID: ' . $response->id;
                $payment->save();
                
                $payer->packages()->create([
                    'package_id' => $package->id,
                    'validity' => $package->validity,
                    'discount' => $package->discount,
                    'amount_paid' => $amount,
                    'payment_id' => $payment->id    
                ]);
                
                return redirect()->back()->withFlashSuccess('Payment Processed Successfully. Thank you!');
                
            } catch (\Exception $e) {
                return  $e->getMessage();
                \Session::put('error', $e->getMessage());
                return redirect()->back();
            }
        }
    }
    
    
    
}















