@extends('layouts.master')
@section('title', app_name() . ' | ' . $course->title)
@section('after-styles')
<link rel="stylesheet" type="text/css" href="{{themes('css/pricing-coupon.css')}}">
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
@stop
@section('content')
@include('includes._title_header', ['title' => $course->title])
<section class="content-area bg-gray pt-5 pb-5">
    <div class="container">
     <div class="row mb-4">
       <div class="col-md-3">
          @include('includes._author_course_sidebar')
       </div>
        <div class="col-md-9">
         <div class="card border-info">
           <div class="card-body" style="min-height:250px;">
             <h4 class="text-info mb-4">{{__('t.pricing-and-coupons')}}</h4>
              <author-coupons :course_id="{{$course->id}}" inline-template v-cloak><div>
               <div class="row mb-12">
                  <div class="col">
                    <span class="text-success pull-right">
                      @{{ saveStatus }}
                     </span></div> 
               </div>
               <div class="row mb-12">
                <div class="col" style="margin-bottom: 20px;">
                 <form class="form-inline" @submit.prevent="updatePrice">
                  <select class="form-control ui dropdown col-md-5" id="dropdown" v-model="course.level" >
                    <option value>{{__('t.choose-level')}}</option>
                    <option value="beginner">{{__('t.beginner-level')}}</option>
                    <option value="intermediate">{{__('t.intermediate-level')}}</option>
                    <option value="advanced">{{__('t.advanced-level')}}</option>
                 </select>
                                            
              <!-- Add a @change event to the select box so that a Vuejs function is called to fetch the new price depending on the selection -->
                <select class="form-control ui dropdown col-md-5  pull-right" id="dropdown2" @change="fetchNewPrice()" v-model="course.duration">
                    <option value>{{__('t.choose-total-course-duration')}}</option>
                    <option value="1">{{__('t.30min-60min')}}</option>
                    <option value="2">{{__('t.60min-120min')}}</option>
                    <option value="3">{{__('t.120min-240min')}}</option>
                    <option value="4">{{__('t.240min+')}}</option>
                </select>

                <div style="padding-left: 0px !important;" class="col-md-12">
                                              {{--   <h4> Course Fees Details: </h4> --}}
                 </hr>
                <table border="1" style="width:100%">
                 <thead>
                 </thead>
                 <tbody>
                 <tr>
                 <td> Course level</td><td  style="text-transform:capitalize; ">
                                                                @{{ course.level }}</td>
                                                        </tr>
                 <tr>
                 <td>Course Duration</td>
                 <td>
                 <div v-if="course.duration === '1'">{{__('t.30min-60min')}} </div>
                 <div v-else-if="course.duration === '2'"> {{__('t.60min-120min')}} </div> 
                 <div v-else-if="course.duration === '3'"> {{__('t.120min-240min')}} </div>
                 <div v-else> {{__('t.240min+')}} </div></td>
                 </tr><br>                                
                 <tr>
                                                            
                   {{-- <td>-</td> --}}
                 {{--  <td>@{{ basefees }}</td> --}}
                </tr></tbody>
                <tfoot><tr>
                <td>Admin Fees (12.5%)</td><td v-if="adminfees"> ₹@{{ adminfees }}</td>
                <td v-else> ₹@{{ course.price*12.5/100 }} </td></tr>
                <tr> <td>Tax (18%)</td><td v-if="taxfees">₹@{{ taxfees }}</td>
                <td v-else>₹@{{ course.price*18/100 }} </td> </tr>
                <tr> <th>Grand Total</th> <td>₹<input type="text" style="border: none; background-color: #fff;" v-model="totalprice" id="inlineFormCustomSelectPref" disabled></td> </tr></tfoot> </table></div>
               <div class="col-md-12 clearfix">
               <button type="submit" style="margin: 20px;" class="btn btn-info pull-right">{{__('t.save')}}</button> </div>
               </form><hr />
                                    
                                    {{--   <div class="col-12 clearfix" v-if="showCreateForm">
                                        <button class="btn btn-info pull-right" :disabled="savedCoursePrice > 0 && course.approved==1 && course.publisheds==1 ? null:'disabled'" @click.prevent="showCreateForm=true">
                                        {{__('t.create-new-coupon')}}
                                        <div v-for="coupon in coupons">
                                            @{{coupon.totalUsed}}
                                        </div>
                                        </button>
                                    </div> --}}
               <div class="row">
                <div class="col-md-12">
                 <p><strong>Note : </strong> You can generate coupons only after your course is reviewed by admin.</p> 
                </div>
               </div>
                                
            <div class="col-md-4" style="float: left;">
             
            <button class="btn btn-info" :disabled="savedCoursePrice > 0 && total<50 && course.approved==1  && course.published==1 ? null:'disabled'" @click.prevent="submit1" >{{__('t.generate-free-coupon')}}</button>
            </form> </div> 

            <div class="col-md-4" style="float: left;">                      
               <button class="btn btn-info" :disabled="savedCoursePrice > 0 && course.approved==1 && course.published==1 ? null:'disabled'" @click.prevent="showModal1=true">  {{__('t.buy_coupon')}} </button> 
             </div>                    
                                        
                                        
              <!-- Trigger the modal with a button -->
               {{--   <div class="col-3" style="float: left;"> <button class="btn btn-info  " :disabled="savedCoursePrice > 0 && total<51 && course.approved==1  && course.published==1 ? null:'disabled'" @click.prevent="showCreateForm=true">
                                        {{__('t.create-coupon')}}
                                        </button>
             </div> --}}
            

          {{--   <div class="clearfix"></div> --}}
            <form @submit.prevent="createCoupon()" class="form-horizontal" v-if="showCreateForm">
             <div class="form-row mb-4">
              <div class="col-6">
               <label for="code">{{__('t.code')}}</label>
                 <input type="text" class="form-control" id="code"
                                                :class="{ 'is-invalid': form.errors.has('code') }" v-model="form.code">
                                                <has-error :form="form" field="code"></has-error>
              </div>
                                            
             <div class="col-6">
              <label for="code">{{__('t.discount-percent')}}</label>
                <vue-slider ref="slider"
                                                :max=100
                                                v-model="form.percent"
                                                tooltip="hover"
                                                height=20
                                                :interval=5
                                                :formatter="form.percent+'% OFF'">
                </vue-slider>
                 {{__('t.new-price')}}:
                 <b>
                 @if(config('site_settings.site_currency_format') == 'front')
                                                {{config('site_settings.site_currency_symbol')}}@{{(course.price - (course.price * (form.percent/100))).toFixed(2) }}
                 @else
                    @{{(course.price - (course.price * (form.percent/100))).toFixed(2) }}{{config('site_settings.site_currency_symbol')}}
                @endif
                    </b>
                    <has-error :form="form" field="percent"></has-error>
             </div>
             </div>
             <div class="form-row">
               <div class="col-6">
                <label for="code">{{__('t.number-of-coupons')}}</label>
                  <input type="number" name="quantity" class="form-control"
                                                :class="{ 'is-invalid': form.errors.has('quantity') }" v-model="form.quantity" />
                                                <has-error :form="form" field="quantity"></has-error>
                                            </div>
                                            
                  <div class="col-6">  <label for="code">{{__('t.expiry-date-optional')}}</label>
                    <datepicker v-model="form.expires"
                                                placeholder="Optional"
                                                input-class="form-control"
                                                format="yyyy-MM-dd">
                                                </datepicker>
                  </div> </div>
                                        
                 <div class="form-row mt-4">
                 <div class="col-12">
                   <span class="pull-right">
                    <a href="#" @click.prevent="showCreateForm=false">{{__('t.cancel')}}</a>
                    <button type="submit" class="btn btn-success">{{__('t.save')}}</button></span></div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            
             <div class="row">
                <div class="col-md-12">
             <div class="table-responsive" v-if="savedCoursePrice > 0 && course.approved==1 && course.published==1">
             <table class="table table-striped table-sm">
              <thead>
                                            <th>{{__('t.code')}}</th>
                                            <th>{{__('t.link')}}</th>
                                            <th>{{__('t.percent-off')}}</th>
                                            <th>{{__('t.final-price')}}</th>
                                            <th>{{__('t.quantity')}}</th>
                                            <th>{{__('t.quantity-remaining')}}</th>
                                            <th>{{__('t.expires')}}</th>
                                            <th>{{__('t.status')}}</th>
                                        </thead>
                                        <tbody>
                                            <tr v-for="coupon in coupons">
                                                <td>@{{coupon.code}}</td>
                                                <td>
                                                    <button @click.prevent="getLink(coupon.link)" :disabled="coupon.exhausted ? 'disabled':null" class="btn btn-success btn-sm">
                                                    {{__('t.get-link')}}
                                                    </button>
                                                </td>
                                                <td>@{{coupon.percent}}%</td>
                                                <td>
                                                    @if(config('site_settings.site_currency_format') == 'front')
                                                    {{config('site_settings.site_currency_symbol')}}@{{coupon.finalPrice }}
                                                    @else
                                                    @{{coupon.finalPrice }}{{config('site_settings.site_currency_symbol')}}
                                                    @endif
                                                    
                                                </td>
                                                <td>@{{coupon.quantity}}</td>
                                                <td>@{{coupon.quantity - coupon.totalUsed}}</td>
                                                <td>@{{coupon.expires}}</td>
                                                <td v-if="coupon.active">Active</td>
                                                <td v-else>
                                                    Inactive 
                                                    
                                                   {{--  <button :class="coupon.active ? 'btn btn-sm btn-success':'btn btn-sm btn-danger'" @click.prevent="toggleActive(coupon.id, coupon.active)">
                                                    @{{ coupon.active ? 'Active' : 'Inactive' }}
                                                    </button> --}}
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                </div>
                            </div>
                        </div>
                            
                            <vodal :show="showModal"
                            animation="flip"
                            @hide="showModal=false"
                            :width="800"
                            :height="150"
                            :close-button=false
                            :duration="301">
                            <div class="card bg-light">
                                <div class="card-header">
                                    {{__('t.copy-coupon-link')}}
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="couponLink" :value="couponLink">
                                            <span class="input-group-addon">
                                                <a href="#" @click.prevent="copyToClipboard()">
                                                    <i class="fa fa-clipboard"></i>
                                                </a>
                                            </span>
                                        </div>
                                        <small class="text-success">@{{copyStatus}}</small>
                                    </div>
                                </div>
                                <div class="card-footer clearfix">
                                    <button class="btn btn-danger btn-sm pull-right" @click="showModal = false">{{__('t.close')}}</button>
                                </div>
                                
                            </div>
                            </vodal>
                            <vodal :show="showModal1"
                            animation="flip"
                            @hide="showModal1=false"
                            :width="750"
                            :close-button=false
                            :duration="301">
                            
                            <div class="card-body bg-light" style="padding: 1.25rem 1.25rem 1.25rem; padding-bottom: 5px !important;">
                                <center><h2>Please Select coupon</h2></center>
                                
                                @if(config('site_settings.payment_enable_pay_with_razorpay'))
                 
                    <div class="container">
                    <div class="row">
                     
                        <div class="col-md-12">
                       
                                
                                <razorpay-form-coupon inline-template id="{{$course->id}}" price="500" inline-template>

                                   
                                    <div>
                                        <form method="POST" id="razorpayform-{{$course->id}}" 
                                            action="{{ route('frontend.author.course.price-and-promotions.process', $course) }}">
                                            {{ csrf_field() }}
                                            <div class="col-md-6">
                                                <input type="hidden" name="razorpay_payment_id" value="" id="razorpay_payment_id-{{$course->id}}">
                                                <input type="hidden" name="package" value="{{ $course->id }}">
                                                <input type="hidden" class="amount" name="amount" :value="price">
                                            </div>
                                            



                                            <div class="form-group">
                                               
                                                    <button id="razorpay-btn-{{$course->id}}" type="submit" class="btn btn-secondary btn-lg btn-block" style="background-color: #17a2b8;">
                                                        <i class="fa fa-money"></i> {{ __('t.buy-20-coupons') }}
                                                    </button>
                                            
                                            </div>
                                        </form>
                                    </div>
                                </ razorpay-form-coupon>

                                <razorpay-form-coupon1 inline-template id="{{$course->id}}" price="2000" inline-template>
                                   <div>
                                        <form method="POST" id="razorpayform-{{$course->id}}1" 
                                            action="{{ route('frontend.author.course.price-and-promotions.process', $course) }}">
                                            {{ csrf_field() }}
                                            <div class="col-md-6">
                                                <input type="hidden" name="razorpay_payment_id1" value="" id="razorpay_payment_id-{{$course->id}}">
                                                <input type="hidden" name="package" value="{{ $course->id }}">
                                                <input type="hidden" class="amount" name="amount" :value="price">
                                            </div>
                                            



                                            <div class="form-group">
                                               
                                                    <button id="razorpay-btn-{{$course->id}}1" type="submit" class="btn btn-secondary btn-lg btn-block" style="background-color: #17a2b8;">
                                                        <i class="fa fa-money"></i> {{ __('t.buy-100-coupons') }}
                                                    </button>
                                            
                                            </div>
                                        </form>
                                    </div>
                                </razorpay-form-coupon1>
                            </div>
                        </div>
                    </div>



                   
                </div>
            </div>
   
        @endif
         </div>
                            {{-- <div class="card-footer clearfix">
                                <button class="btn btn-danger btn-sm pull-right" @click="showModal1 = false">{{__('t.close')}}</button>
                            </div> --}}
                            </vodal>
                            
                        </div>


                    </author-coupons> 
    
                </div>
            </div>
            
            
        </div>
    </div>
    
</div>



</section>
@endsection
