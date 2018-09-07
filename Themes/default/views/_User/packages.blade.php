@extends('layouts.master')

@section('title', app_name() . ' | ' . __('t.my-packages'))

@section('content')
    
    
    @include('includes._title_header', ['title' => __('t.my-packages')])
    
    <section class="content-area bg-gray pt-2 pb-2 mt-5">
        <div class="container">
            <div class="row mb-4">
                <div class="col-12 mb-5">
                    <div id="myTabContent" class="card card-body border-top-0">
                        <div class="tab-content">
                            <hr />
                            @if($packages->count())
                            <table class="table table-sm table-striped">
                                <thead>
                                    <th>{{__('t.name')}}</th>
                                    <th>{{__('t.date')}}</th>
                                    <th>{{__('t.price')}}</th>
                                    <th>{{__('t.discount')}}</th>
                                    <th>{{__('t.total-package-amount')}}</th>
                                    <th>{{__('t.validity')}}</th>
                                   {{--  <th>{{__('t.course-buy')}}</th> --}}
                                    <th>{{__('t.balance-left')}}</th>
                                </thead>
                                <tbody>
                                    @foreach($packages as $package)
                                         <tr>
                                            <td>{{$package->package->name}}</td>
                                            <td>{{$package->created_at->toFormattedDateString()}}</td>
                                            <td>{{Gabs::currency($package->amount_paid)}}</td>
                                            <td>{{$package->discount}}%</td>
                                            <td>{{Gabs::currency($package->amount_paid + ($package->amount_paid*$package->discount/100))}}</td>
                                            <td>{{$package->validity}}</td>
                                            <td>{{$package->number_of_courses - $package->number_used}}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                               
                            </table>
                            
                            {!! $packages->links() !!}
                            
                            @else
                                <p>{{__('t.no-packages-yet')}}</p>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

