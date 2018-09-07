@extends ('backend.layouts.app')

@section ('title', __('t.board'))

@section('breadcrumb-links', '')

@section('content')
<div class="card">
    <div class="card-header">
        <i class="fa fa-align-justify"></i>
        <strong>{{__('t.board')}}</strong>
        <small class="text-muted">{{__('t.manage_board')}}</small>
        
        <div class="btn-toolbar float-right"  role="toolbar" data-toggle="tooltip" title="{{__('t.create-new')}}">
        <a href="#" class="btn btn-sm btn-success ml-1" data-toggle="modal" data-target="#myModal" >
                <i class="fa fa-plus-circle"></i>
            </a></div>

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
                            <th>{{__('t.id')}}</th>
                            <th>{{__('t.name')}}</th>
                           {{--  <th>{{__('t.board_created_at')}}</th>
                            <th>{{__('t.board_updated_at')}}</th> --}}
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                           @foreach($boards as $board)
                                <tr>
                                    <td>{{ $board->id }}</td>
                                    <td>{{ $board->name }}</td>
                                  
                                    <td>
                                                <a href="{{ route('admin.board.destroy', $board) }}"
                                                     data-method="delete"
                                                     data-trans-button-cancel="{{__('t.cancel')}}"
                                                     data-trans-button-confirm="{{__('t.delete')}}"
                                                     data-trans-title="{{__('t.are-you-sure')}}"
                                                     class="btn btn-sm btn-danger text-white">
                                                    {{__('t.delete')}}
                                                </a>
                                               
                                           
                                    </td> 
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

@section('modals')

    <!-- Modal -->
    <div class="modal fade" id="createCouponModal" tabindex="-1" role="dialog" aria-labelledby="CreateCoupon" aria-hidden="true">
        <div class="modal-dialog modal-success" role="document">
            
        </div>
    </div>
    <!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      
      <div class="modal-body">
     {!! Form::open(['route' => ['admin.board.store'], 'method'=>'POST', 'class' => 'form-horizontal create-coupon-form']) !!}
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">{{__('t.create-coupon')}}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="">
                      <span aria-hidden="true">&times;</span>
                    </button>
                    </div>
                    <div class="modal-body">
                        {{ csrf_field() }}
                        <div class="form-group">
                            {!! Form::label("name", __('t.name')) !!}
                            {!! Form::text("name", null, ['class'=>'form-control', 'required']) !!}
                             @if ($errors->has('name'))
                                <div class="text-danger"><small>{{ $errors->first('name') }}</small></div>
                            @endif
                        </div>
                        
                        
                        
                       
                        
                        {{ csrf_field() }}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">{{__('t.close')}}</button>
                        <button type="submit" id="create-coupon-submit" class="btn btn-primary">{{__('t.create')}}</button>
                    </div>
                </div>
            {!! Form::close() !!}
      </div>
      
      </div>
    </div>

  </div>
</div>
   <script>
       

   </script>
@stop