@extends ('backend.layouts.app')

@section ('title', __('t.certificates'))


@section('breadcrumb-links', '')

@section('content')
<div class="card">
    <div class="card-header">
        <i class="fa fa-align-justify"></i>
        <strong>{{__('t.certificates')}}</strong>
      {{--   <small class="text-muted">{{__('t.manage_board')}}</small> --}}
        
       

       {{--  <div class="btn-toolbar float-right" role="toolbar" data-toggle="tooltip" title="{{__('t.create-new')}}">
            <a href="#" class="btn btn-sm btn-success ml-1" data-backdrop="static" data-keyboard="false" data-toggle="modal" data-target="#createCouponModal" >
                <i class="fa fa-plus-circle"></i>
            </a>
        </div><!--btn-toolbar--> --}}
    </div><!--card-header-->
    <div class="card-body">

        <div class="row mt-4">
            <div class="col">
                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                        <tr>
                            <th>{{__('t.course')}}</th>
                            <th>{{__('t.name')}}</th>
                             <th>{{__('t.date-completed')}}</th>
                            
                           {{--  <th>{{__('t.board_created_at')}}</th>
                            <th>{{__('t.board_updated_at')}}</th> --}}
                           
                        </tr>
                        </thead>
                        <tbody>
                           {{--  @php
                                dd($certificates);
                            @endphp --}}
                           @foreach($certificates as $certificate)
                                <tr>
                                    <td>{{ $certificate->course_title }}</td>
                                    <td>{{ $certificate->user->first_name }} {{ $certificate->user->last_name }}</td>
                                    <td>{{ date('F d, Y', strtotime($certificate->created_at))}}</td>
                                   
                                  
                                    {{--  <td>{{ $board->created_at }}</td>
                                    <td>{{ $board->updated_at }}</td> --}}
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div><!--col-->
        </div><!--row-->
        <div class="row">
            <div class="col-7">
                <div class="float-left">
                    
                </div>
            </div><!--col-->

            <div class="col-5">
                <div class="float-right">
                    
                </div>
            </div><!--col-->
            
            
            
            
        </div><!--row-->
    </div><!--card-body-->
</div><!--card-->

@endsection











{{-- 
@extends ('backend.layouts.app')

@section ('title', __('t.certificates'))


@section('breadcrumb-links', '')

@section('content')
   <section class="content-area bg-gray pt-2 pb-2">
        <div class="container">
            <div class="row mb-4">
                <div class="col-12 mb-5">
                    
                    <div id="myTabContent" class="card card-body border-top-0 p-4">
                        <div class="tab-content">
                            <div id="enrolled-courses" class="tab-pane fade show active" role="tabpanel">
                                <div class="row">
                                    @if($certificates->count())
                                        <table class="table table-sm table-hover table-striped">
                                            <thead>
                                                <th>{{ __('t.course') }}</th>
                                                <th>{{ __('t.date-completed') }}</th>
                                                <th></th>
                                            </thead>
                                            <tbody>
                                                @foreach($certificates as $certificate)
                                                    <tr>
                                                        <td>{{$certificate->course_title}}</td>
                                                        <td>{{ date('F d, Y', strtotime($certificate->created_at))}}</td>
                                                        <td>
                                                            <a href="{{route('frontend.user.certificate.download', $certificate->created_at)}}" class="btn btn-outline-info btn-sm">
                                                                {{ __('t.download') }}
                                                            </a>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    @else
                                        <div class="col-md-12 text-center">
                                            <p>
                                                 {{__('t.no-certificates')}}
                                            </p>
                                        </div>
                                    @endif 
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@stop

 --}}

















