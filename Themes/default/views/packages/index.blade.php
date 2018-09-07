@extends('layouts.master')

@section('title', app_name() . " | " . __('t.subscription-packages') )

@section('after-styles')
    <script src="https://checkout.razorpay.com/v1/checkout.js">
    </script>
    
@stop

@section('content')
    
    
    @include('includes._title_header', ['title' => trans('t.subscription-packages') ])
    
    <!-- HOW IT WORKS -->
    <section class="pt-5 bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-md-1 offset-md-1"></div>
                @foreach($packages as $package)

                    <div class="col-md-4">
                        <div class="card mb-4 box-shadow p-0 text-center bg-light">
                            <div class="card-header bg-info text-white">
                                <h4 class="my-0 font-weight-bold">
                                    {{ $package->name }}
                                </h4>
                            </div>
                            <div class="card-body">
                                <h3 class="card-title pricing-card-title mb-4">
                                    <small class="text-muted text-uppercase h5">
                                        Pay <br/>
                                         {{ Gabs::currency($package->price) }}
                                    </small> 
                                   <br/> Get <br/> {{ Gabs::currency($package->price+ $package->price*($package->discount/100)) }} ( {{ $package->discount }} %)
                                    
                                </h3>
                                <p style="min-height:1rem;">
                                    {!! $package->description !!}
                                </p>
                                
                                <razorpay-form-package inline-template id="{{$package->id}}" price="{{$package->price}}" desc="{{$package->name}}" inline-template>
                                    <div>
                                        <form method="POST" id="razorpayform-{{$package->id}}" 
                                            action="{{ route('frontend.package.process', $package) }}">
                                            {{ csrf_field() }}
                                            <div class="col-md-6">
                                                <input type="hidden" name="razorpay_payment_id" value="" id="razorpay_payment_id-{{$package->id}}">
                                            	<input type="hidden" name="package" value="{{ $package->id }}">
                				      			<input type="hidden" class="amount" name="amount" :value="price">
                                            </div>
                                            <div class="form-group">
                                                @auth
                    	                            <button id="razorpay-btn-{{$package->id}}" type="submit" class="btn btn-secondary btn-lg btn-block">
                    	                                <i class="fa fa-money"></i> {{ __('t.buy-this-bundle') }}
                	                                </button>
            	                                @else
            	                                    <a href="/login" class="btn btn-secondary btn-lg btn-block">
                    	                                <i class="fa fa-lock"></i> {{ __('t.login-to-buy') }}
                	                                </a>
            	                                @endif
                	                        </div>
                                        </form>
                                    </div>
                                </razorpay-form-package>

                                        
                     
                            </div>
                        </div>
                    </div>
                @endforeach
                  
            </div> 
        </div>

    </section>

@endsection

@push('after-scripts')

 
@endpush
