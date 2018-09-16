@extends ('backend.layouts.app')

@section ('title', __('t.course-packages'))

@push('after-styles')

@endpush

@section('breadcrumb-links', '')

@section('content')


<div class="card">
    <div class="card-header">
        <i class="fa fa-align-justify"></i>
        <strong>{{__('t.course-packages')}}</strong>
        <small class="text-muted">{{__('t.manage-course-packages')}}</small>
        
        <div class="btn-toolbar float-right" role="toolbar" data-toggle="tooltip" title="{{ __('t.add-new') }}">
            <a href="#" class="btn btn-sm btn-success ml-1" data-backdrop="static" data-keyboard="false" data-toggle="modal" data-target="#createPackageModal" ><i class="fa fa-plus-circle"></i></a>
        </div><!--btn-toolbar-->
    </div><!--card-header-->
    <div class="card-body">
        
        <div class="row">
            @foreach($packages as $package)
                <div class="col-sm-6 col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="h3 m-0 mb-2 text-primary">
                                {{ $package->name }}
                            </div>
                            <div class="h4 m-0 mb-2">
                                {{ Gabs::currency($package->price) }}
                            </div>
                            <div class="font-weight-bold h5 text-muted">
                                {{ $package->discount }} {{ str_plural(__('% Discount'), $package->discount) }}
                            </div>
                            <small class="text-muted">{{ $package->description }}</small>
                            <small class="text-muted">{{ $package->validity }}</small>
                            <div class="progress progress-xs my-3">
                                <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            @if($package->payments->count() == 0)
                                <a href="{{route('admin.packages.delete', $package)}}" class="text-danger">{{ __('t.delete') }}</a>
                            @else
                                <span class="badge badge-secondary">
                                    {{$package->payments->count() }} {{ __('t.purchased') }}
                                </span>
                            @endif
                            <a href="{{route('admin.packages.edit', $package)}}" class="pull-right edit">{{ __('t.edit') }}</a>
                            
                        </div>
                    </div>
                </div>
            @endforeach
            
        </div>
    </div>  

</div>



@endsection

@section('modals')

    <!-- Modal -->
    <div class="modal fade" id="createPackageModal" tabindex="-1" role="dialog" aria-labelledby="CreatePackage" aria-hidden="true">
        <div class="modal-dialog modal-success" role="document">
            {!! Form::open(['route' => ['admin.packages.store'], 'method'=>'POST', 'class' => 'form-horizontal create-category-form']) !!}
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">{{__('t.create-package')}}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
                        <div class="form-group">
                            {!! Form::label("price", __('t.price')) !!}
                            {!! Form::number("price", null, ['class'=>'form-control', 'min' => '1', 'required']) !!}
                            @if ($errors->has('price'))
                                <div class="text-danger"><small>{{ $errors->first('price') }}</small></div>
                            @endif
                        </div>
                         <div class="form-group">
                          {!! Form::label("validity", __('t.validity')) !!}
                        <input type="date" class="form-control" name="validity" min="2018-05-02">
                       </div>
                        <div class="form-group">
                            {!! Form::label("Discount", __('t.discount')) !!}
                            {!! Form::number("discount", null, ['class'=>'form-control', 'min' => '1', 'required']) !!}
                            @if ($errors->has('discount'))
                                <div class="text-danger"><small>{{ $errors->first('discount') }}</small></div>
                            @endif
                        </div>
                        
                        <div class="form-group">
                            {!! Form::label("description", __('t.description')) !!}
                            {!! Form::textarea("description", null, ['class'=>'form-control', 'rows' => '3', 'required']) !!}
                            @if ($errors->has('description'))
                                <div class="text-danger"><small>{{ $errors->first('description') }}</small></div>
                            @endif
                        </div>
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">{{ __('t.close') }}</button>
                        <button type="submit" class="btn btn-primary">{{ __('t.create') }}</button>
                    </div>
                </div>
            {!! Form::close() !!}
        </div>
    </div>
    
    <!-- Edit category Modal -->
    <div class="modal fade" id="editPackageModal" tabindex="-1" role="dialog" aria-labelledby="EditPackage" aria-hidden="true">
        <div class="modal-dialog modal-success" role="document">
        
        </div>
    </div>

    <script>
        $(document).ready(function($){
            $('.edit').click(function(e){
				$('#editPackageModal').modal('show', {backdrop: 'static'});
				e.preventDefault();
				href = $(this).attr('href');
				$.ajax({
					url: href,
					success: function(response){
						$('#editPackageModal .modal-dialog').html(response);
					}
				});
			});
        });
			
	</script>
	
	
	
	
	
	
	<!----------- nestable ---------->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/nestable2/1.6.0/jquery.nestable.min.js"></script>
    
    <script type="text/javascript">
        jQuery(document).ready(function($){
            $('.dd').nestable({ 
                 maxDepth: 2
            }).nestable('collapseAll');
            
            
            $('.dd').on('change', function() {
                //console.log($('.dd').nestable('serialize'));
                
                $.post('/api/admin/videos/categories/sort_order', {
                    _token : $('#_token').val(),
                    sortOrder : JSON.stringify($('.dd').nestable('serialize'))
                }, function(data){
                    console.log(data)
                })
            });
           
           
            // expand menu 
            $('#nestable-menu').on('click', function(e) {
                var target = $(e.target),
                    action = target.data('action');
                if(action === 'expand-all') {
                    $('.dd').nestable('expandAll');
                }
                if(action === 'collapse-all') {
                    $('.dd').nestable('collapseAll');
                }
            });
           
           
           
           
        });
    </script>
	

@stop