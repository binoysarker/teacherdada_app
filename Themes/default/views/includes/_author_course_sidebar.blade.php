<div class="create-course-sidebar">
    <ul class="list-bar">
        <a href="{{route('frontend.author.course.edit', $course)}}">
            <li class="{{ active_class(Active::checkUriPattern('*edit')) }}">
                <span class="count">
                    <i class="fa fa-check"></i>
                </span> {{ __('t.course-landing-page') }}
            </li>
        </a> 
        <a href="{{route('frontend.author.course.curriculum', $course)}}">
            <li class="{{ active_class(Active::checkUriPattern('*curriculum*')) }}">
                <span class="count">
                    <i class="fa fa-check"></i>
                </span> {{ __('t.course-curriculum') }}
            </li>
        </a>
        
        <a href="{{route('frontend.author.course.pricing', $course)}}">
            <li class="{{ active_class(Active::checkUriPattern('*price-and-promotion*')) }}">
                <span class="count">
                    <i class="fa fa-check"></i>
                </span> {{ __('t.pricing-and-coupons') }}
            </li>
        </a>
        
        @if($course->approvals->count())
            <a href="{{route('frontend.author.course.approval', $course)}}">
                <li class="{{ active_class(Active::checkUriPattern('*admin-approval')) }}">
                    <span class="count">
                        <i class="fa fa-check"></i>
                    </span> {{ __('t.admin-review-notes') }}
                </li>
            </a>
        @endif
        
        <!--
        <a href="#">
            <li>
                <span class="count">
                    <i class="fa fa-check"></i>
                </span> Course Settings
            </li>
        </a>
        -->
        
        @if(!$course->published && !$course->approved)
            <a href="{{route('frontend.author.submit.review', $course)}}"
                data-method="get"
                data-trans-button-cancel="Cancel"
                data-trans-button-confirm="Yes, Submit"
                data-trans-title="Sure you're ready for admin review?"
                class="btn btn-block btn-success text-white"> {{ __('t.submit-for-review') }}
            </a>
        @elseif(!$course->published && $course->approved)
            <a href="{{route('frontend.author.submit.review', $course)}}"
                data-method="get"
                data-trans-button-cancel="Cancel"
                data-trans-button-confirm="Yes, Publish"
                data-trans-title="This will send your course live"
                class="btn btn-block btn-success text-white"> {{ __('t.publish-course') }}
            </a>
        @else
            <a href="{{route('frontend.author.announcements', $course)}}">
                <li class="{{ active_class(Active::checkUriPattern('*announcements*')) }}">
                    <span class="count">
                        <i class="fa fa-check"></i>
                    </span> {{ __('t.announcements') }}
                </li>
            </a>
            
            @if($course->approved)
                <a href="{{route('frontend.author.submit.review', $course)}}"
                    data-method="get"
                    data-trans-button-cancel="{{__('t.cancel')}}"
                    data-trans-button-confirm="{{__('t.yes-delete')}}"
                    data-trans-title="{{__('t.are-you-sure')}}"
                    class="btn btn-block btn-info text-white">{{ __('t.unpublish-course') }}
                </a>
            @endif
		@endif
		
        @if($course->published && !$course->approved)
			<button type="submit" class="btn btn-block btn-warning disabled">{{ __('t.under-review') }}</button>
        @endif
        
        @if($course->canBeDeleted())
		    <a href="{{ route('frontend.author.course.destroy', $course) }}"
                 data-method="delete"
                 data-trans-button-cancel="{{__('t.cancel')}}"
                 data-trans-button-confirm="{{__('t.yes')}}"
                 data-trans-title="{{__('t.are-you-sure')}}"
                 class="btn btn-block btn-danger text-white"><i class="fa fa-trash"></i> {{ __('t.delete-course') }}
             </a>
        @endif


        
        
        
        
    </ul>
</div>