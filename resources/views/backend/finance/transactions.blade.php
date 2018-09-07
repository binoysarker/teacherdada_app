@extends ('backend.layouts.app')

@section ('title', __('t.transactions'))

@section('breadcrumb-links', '')
@push('after-styles')
    <style type="text/css">
        .modal-backdrop.show {
     opacity: 0; 
    display: none;
}

</style>
  <script type="text/javascript">
        $('body').removeClass('modal-open');
$('.modal-backdrop').remove();
    </script> 
@endpush
@section('content')


<transaction-list inline-template v-cloak>
    <div class="card">
        <div class="card-header">
            <i class="fa fa-align-justify"></i>
            <strong>{{__('t.transactions')}}</strong>
            <small class="text-muted">{{__('t.all-system-transactions')}}</small>
            
        </div><!--card-header-->
        <div class="card-body">
    
            <div class="row mt-4">
                <div class="col">
                    
                    <vue-good-table
                            :columns="columns"
                            :rows="rows"
                            :paginate="true"
                            :lineNumbers="true"
                            :defaultSortBy="{field: 'status_code', type: 'asc'}"
                            styleClass="table table-stripped table-bordered condensed"/>
                    
                    
                   
                    {{-- <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>UUID#</th>
                                    <th>{{__('t.date')}}</th>
                                    <th>{{__('t.user')}}</th>
                                    <th>{{__('t.description')}}</th>
                                    <th>{{__('t.long-description')}}</th>
                                    <th>{{__('t.amount')}} ($)</th>
                                    <th>{{__('t.type')}}</th>
                                    <th>{{__('t.action')}}</th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach ($transactions as $transaction)
                                <tr>
                                    <td>{{ $transaction->uuid }}</td>
                                    <td>{{ $transaction->created_at->format('m-d-Y') }}</td>
                                    <td>{{ $transaction->user->name }}</td>
                                    <td>{{ $transaction->description }}</td>
                                    <td>{{ $transaction->long_description }}</td>
                                    <td>{{ $transaction->amount }}</td>
                                    <td>
                                        @if($transaction->type == 'credit')
                                            <span class="fa fa-plus-circle text-success"></span>
                                            {{ $transaction->type }}
                                        @else 
                                            <span class="fa fa-minus-circle text-danger"></span>
                                            {{ $transaction->type }}
                                        @endif
                                        
                                    </td>
                                     <td><a :href="'/admin/course/courses/'+props.row.slug+'/details'" class="btn btn-sm btn-primary">
                                   <i class="fa fa-eye" data-toggle="tooltip" data-placement="top" title="{{__('t.details')}}"></i> 
                                </a></td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    --}}
                    
                    
                </div><!--col-->
            </div><!--row-->
            
        </div><!--card-body-->
    </div><!--card-->
</transaction-list>
{{-- @php
    var_dump($transactions);
@endphp --}}


@foreach ($transactions as $element)
@php
 
// dd($element);
@endphp
<div id="myModal{{ $element->uuid }}" class="modal fade" role="dialog" style="margin-top: 30px;">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: rgb(77, 189, 116);">
        <a href="/" class="smallogo modal-title">
            <img src="{{ config('site_settings.site_logo') }}" alt="">
        </a> 
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        
      </div>
      <div class="modal-body">
       <div class="container">
      <div class="col-md-12 text-center">
        <br />
        <br />

       Note: All the terms and condition by <a href="http://teacherdada.com/" target="_blank"> teacherdada.com</a>
        <br />
        <br />
    </div>
        <div class="row color-invoice">
      <div class="col-md-12">
        #Sr. No: <?= $element->uuid; ?>
        <div class="row">
          <div class="col-lg-7 col-md-7 col-sm-7">
            <h1>INVOICE</h1>
            <br />
            <strong>Email : </strong> info@teacherdada.com
            <br />
            <strong>Call : </strong> +91-xxxx-xx-xxxx
          </div>
          <div class="col-lg-5 col-md-5 col-sm-5">

            <h2>   Teacher Dada LLC</h2> 789/89 , Lane Set , New York,
            <br> Pin- 90-89-78-00,
            <br> United States.

          </div>
        </div>
        <hr />
        <div class="row">
            
          <div class="col-lg-7 col-md-7 col-sm-7">
           
                
               
            <h3>Client Details : </h3>
            <h5></h5> 789/90 , Lane Here, New York,
            <br /> United States
          </div>
          <div class="col-lg-5 col-md-5 col-sm-5">
            <h3>Client Contact :</h3> Mob: +91-xxxx-xx-xxxx
            <br> email: info@teacherdada.com
          </div>
        
        </div>
        <hr />
        <div class="row">
          <div class="col-lg-6 col-md-6 col-sm-6">
            <strong>ITEM DESCRIPTION & DETAILS :</strong>
          </div>
        </div>
        <hr />
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="table-responsive">
              <table class="table table-striped table-bordered">
                <thead>
                  <tr>
                    <th>S. No.</th>
                    <th>Perticulars</th>
                    <th>Quantity.</th>
                    <th>Unit Price</th>
                    {{-- <th>Sub Total</th> --}}
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><?= $element->id; ?></td>
                    <td><?= $element->description; ?></td>
                    <td><?= $element->uuid; ?></td>
                    <td>Rs. <?= $element->amount; ?></td>
                    {{-- <td>5000 USD</td> --}}
                  </tr>
                  
                </tbody>
              </table>
            </div>
            <hr>
            <div>
              <h4>  Total : Rs.<?= $element->amount; ?>  </h4>
            </div>
            <hr>
            <div>
              <h4>  Taxes : Rs. <?= $element->amount*18/100; ?> Rs. ( 18 % on Total Bill ) </h4>
            </div>
            <hr>
            <div>
              <h3>  Bill Amount : <?= $element->amount + $element->amount*18/100; ?> </h3>
            </div>
            <hr />
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <strong> Important: </strong>
            <ol>
              <li>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.

              </li>
              <li>
                Nulla eros eros, laoreet non pretium sit amet, efficitur eu magna.
              </li>
              <li>
                Curabitur efficitur vitae massa quis molestie. Ut quis porttitor justo, sed euismod tortor.
              </li>
            </ol>
          </div>
        </div>
        <hr />
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <a href="#" class="btn btn-success btn-sm">Print Invoice</a>    
            <a href="#" class="btn btn-info btn-sm">Download In Pdf</a>
          </div>
        </div>
        
        <hr>
        <div class="row">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
@endforeach
    

@endsection

@push('after-scripts')
@endpush