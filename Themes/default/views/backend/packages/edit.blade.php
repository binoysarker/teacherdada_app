<!-- Modal -->
{!! Form::model($package, ['route' => ['admin.packages.update', $package], 'method'=>'PUT', 'class' => 'form-horizontal editPackageForm']) !!}
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">{{ __('t.edit-package') }}</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="{{ __('t.close') }}">
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
            {{--  <div class="form-group">
                        {!! Form::label('validity',  __('t.validity')) !!}
                        {!! Form::date('validity', date($client->date_of_birth), ['class' => 'form-control']) !!}

                </div>  --}}
             <div class="form-group">
                          {!! Form::label("validity", __('t.validity')) !!}
                        <input type="date" class="form-control" name="validity" value="{{ $package->validity }}" min="2018-05-02">
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
            <button type="submit" class="btn btn-primary">{{ __('t.update') }}</button>
        </div>
    </div>
{!! Form::close() !!}
