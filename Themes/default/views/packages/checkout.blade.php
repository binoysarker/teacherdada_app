@extends('layouts.master')

@section('title', app_name() . " | " . $package->name )

@section('after-styles')

@stop

@section('content')
    
    
    @include('includes._title_header', ['title' => $package->name ])
    
    <!-- HOW IT WORKS -->
    <section class="pt-5 bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mb-4 box-shadow p-0 text-center bg-light">
                        <div class="card-body">
                            xxxx
                        </div>
                    </div>
                </div>

            </div> 
        </div>
    </section>

@endsection

@push('after-scripts')

 
@endpush
