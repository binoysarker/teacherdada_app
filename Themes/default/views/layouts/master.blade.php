<!doctype html>
<html lang="{{ config('app.locale') }}">
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta name="csrf-token" content="{{ csrf_token() }}"/>
        <meta name="description" content="@yield('description', config('site_settings.site_description'))">
        <meta name="keywords" content="{{config('site_settings.site_keywords') }}">
       <title>
          {{--   @yield('title', app_name()) 
            Teachers Dada --}}
             @yield('title', app_name())
        </title>
        
        <link rel="icon" href="{{ config('site_settings.site_favicon') }}" type="image/x-icon" />
        <!-- Fonts -->
        <!--<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">-->
        <!--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        <!-- Styles -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" 
            integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/components/dropdown.css" 
            integrity="sha256-oHVjtDR88wm5TXH//azD2YQvMCwDRfP09hAW/RsgGnw=" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/components/transition.min.css" />
        <link rel="stylesheet" href="https://cdn.rawgit.com/tonystar/bootstrap-float-label/v4.0.0/dist/bootstrap-float-label.min.css" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" 
            integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        
        
        <!-- styles loaded from the specific theme -->
        <link rel="stylesheet" href="{{ themes('css/overrides.css') }}" media="all" />
        <link rel="stylesheet" href="{{ themes('css/fox.css') }}" media="all" />
        <link rel="stylesheet" href="{{ themes('css/app.css') }}">
        <link rel="stylesheet" href="{{ themes('css/nav.css') }}" media="all" />
        <link rel="stylesheet" href="{{ themes('css/nav-demo.css') }}" media="all" />
        <link rel="stylesheet" href="{{ themes('css/themes-green.css') }}" media="all" />
        <link rel="stylesheet" href="{{ themes('css/animate.css') }}" media="all" />
     
        
        <link rel="stylesheet" href="/css/typeahead.css" media="all" />
        <link rel="stylesheet" href="/css/jquery-sticky-alert.css" media="all" />
        
        <link rel="stylesheet" href="/public/css/frontend.css" media="all" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" />
        
        <script>
            window.Laravel = <?php echo json_encode([
                'csrfToken' => csrf_token(),
            ]); ?>
        </script>
        
        <script>
            //See https://laracasts.com/discuss/channels/vue/use-trans-in-vuejs
            window.trans = @php
                // copy all translations from /resources/lang/CURRENT_LOCALE/* to global JS variable
                $lang_files = File::files(resource_path() . '/lang/' . App::getLocale());
                $trans = [];
                foreach ($lang_files as $f) {
                    $filename = pathinfo($f)['filename'];
                    $trans[$filename] = trans($filename);
                }
                //$trans['adminlte_lang_message'] = trans('adminlte_lang::message');
                echo json_encode($trans);
            @endphp
            
            window.stg = @php
                $settinigs = [
                    'video_allow_upload' => config('site_settings.video_allow_upload'),
                    'video_allow_youtube' => config('site_settings.video_allow_youtube'),
                    'video_allow_vimeo' => config('site_settings.video_allow_vimeo'),
                    'vms' => config('site_settings.video_max_size'),
                    'enable_demo' => config('settings.enable_demo'),
                    'site_name' => config('site_settings.site_name'),
                    'img' => config('site_settings.site_logo'),
                    'rzk' => config('services.razorpay.key'),
                ];
                
                echo json_encode($settinigs);
            @endphp
        </script>
        
        
        @yield('after-styles')

    </head>
    
    
    
    <body>
        @include('includes.partials.ga')
        
        <div class="wsmenucontainer clearfix">
            <div id="app">
                <!-- START THEME-SPECIFIC LAYOUTS HERE -->
                
                <div id="main" class="main clearfix">
                    <div id="alert-container" class="text-center mb-0 d-none d-sm-block" role="alert"></div>
                    
                    <div class="alert-messages">
                        @include('includes.partials.messages')
                    </div>
                    
                    @include('includes.partials.logged-in-as')
                    
                    <!-- Navigation -->
                    @include('includes.navigation')
                  
                    <!-- Content -->
                    @yield('content')
                
                </div><!--/ End Main -->
                
            </div> 
          @if(Auth::guest())
<aside class="dark-bg aside-cta professor" style="padding: 70px 0;">
  <div class="container text-center">
    <div class="row">
      <div class="col-sm-12 col-xs-12">
        <h3 class="margin-10 text-white cta-heading">Are you a teacher? Do you want to design a course on Teacherdada?</h3>
        <a class="template-button" href="{{route('frontend.auth.register-teacher')}}" target="_blank"> <i class="fa fa-angle-double-right" aria-hidden="true"></i> {{ __('t.become-a-teacher') }}</a>
         </div>
    </div>
  </div>
</aside>

   @endif
 <footer class="footer">
    			<div class="container top-container">
    				<div class="row">
    					<div class="col-md-6 col-sm-12 footer-center">
    						<h6>About Us</h6>
    						<img src="{{config('site_settings.site_logo')}}" alt="" class="img-responsive logo-change logo-small-120">
          <p class="text-white footer-about-p">{{ __('t.footer-text', ['site' => config('site_settings.site_name')])}} </p>
    					
    					</div>
    					<!-- /.col-md-4 -->

    					<!--<div class="col-md-3 col-sm-6">-->
    					<!--	<h6>Contact Us</h6>-->
    						
    					<!--	<p class="text-white"><i class="ion-ios-location"></i> A902, Brighton, East Sussex, England.</p>-->
    					<!--	<p class="text-white"><i class="ion-email"></i> support@themesease.com</p>-->
    					<!--	<p class="text-white"><i class="ion-ios-telephone"></i> +1 (123) 456-7890</p>-->
    					<!--</div>-->
    					<!-- /.col-md-4 col-sm-6 -->
                         	<div class="col-md-3 col-sm-6 footer-center">
    						<h6>Quick Links</h6>
    					<ul>
            @foreach($footer_pages as $f_page)
                                    <li><i class="fa  fa-angle-right"></i>
                                        <a class="text-white" href="{{ route('frontend.page.show', $f_page->slug) }}">
                                            {{ $f_page->title }}
                                        </a>
                                    </li>
            @endforeach
            {{-- <li class="list-inline-item">
                                    <a class="text-white" href="{{ route('frontend.blog') }}">
                                        {{ __('t.blog') }}
                                    </a>
                                </li> --}}
                                <li><i class="fa  fa-angle-right"></i>
                                    <a class="text-white" href="/contact">
                                        {{ __('t.contact-us') }}
                                    </a>
                                </li>
                                <li><i class="fa  fa-angle-right"></i>
                                    <a class="text-white" href="{{ route('frontend.verify.certificate') }}">
                                        {{ __('t.verify-certificate') }}
                                    </a>
                                </li>
          </ul>
    					
    					</div>
    					<div class="col-md-3 col-sm-6 footer-center">
    						<h6>Follow Us</h6>
    						<ul class="list-inline">
                                @if(config('site_settings.footer_twitter'))
                                    <li class="list-inline-item">
                                        <a href="https://twitter.com/{{config('site_settings.footer_twitter')}}" target="_blank" class="ico-social text-white">
                                        <i class="fa fa-twitter"></i></a>
                                    </li>
                                @endif
                                @if(config('site_settings.footer_facebook'))
                                    <li class="list-inline-item">
                                        <a href="https://facebook.com/{{config('site_settings.footer_facebook')}}" target="_blank" class="ico-social text-white">
                                        <i class="fa fa-facebook"></i></a>
                                    </li>
                                @endif
                                @if(config('site_settings.footer_instagram'))
                                    <li class="list-inline-item">
                                        <a href="https://instagram.com/{{config('site_settings.footer_instagram')}}" target="_blank" class="ico-social text-white">
                                        <i class="fa fa-instagram"></i></a>
                                    </li>
                                @endif
                            </ul>
    					
    					</div>
    					<!-- /.col-md-4 col-sm-6 -->
    				</div>
    				<!-- /.row -->
    			</div>
    			<!-- /.container -->

    			<div class="footer-bottom">
    				<div class="container">
    					<div class="row">
    						<p class="col-sm-6 text-white"> © {{ config('site_settings.site_name') }} - {{ __('t.all-right-reserved') }} - {{ \Carbon\Carbon::now()->year }} </p>
    						<div class="col-sm-6 text-right">
    							<a href="#" class="text-white" >Developed by <a href="http://smarts3.in" target="_blank">Simplified Software Solutions India</a>
    						</div>
    					</div>
    					<!-- /.row -->
    				</div>
    				<!-- /.container -->
    			</div>
    			<!-- /.footer-bottom -->
    		</footer>


         
            <!-- Begin Footer -->
            
           
              
                    
                        
                       {{--  <div class="col-md-12 mb-4">
            				<ul class="list-inline">
            				    @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
                                    <li class="list-inline-item">
    	        			            <a class="link-footer lang {{app()->getLocale() == $localeCode ? 'active' : '' }}" rel="alternate" hreflang="{{ $localeCode }}" 
    	        			                href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}">
    	        			                <img src="/img/flags/{{$localeCode}}.svg" width="12" class="rounded-circle" />  --}}
    	        			                {{-- $properties['name'] --}}
    	        			              {{--   {{ __('menus.language-picker.langs.'.$localeCode) }}
            			                </a>
            			            </li>
                                @endforeach
                                
            				</ul>
            			</div> --}}
            			
            			
            			
            			
            			
            			
            			
                               
            		
            
            
            <!--/ End Footer -->
                
                
                
            
            
            <!-- Scripts -->
            @stack('before-scripts')
            <script src="/js/frontend.js"></script>
            <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
              
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
            
            <script src="{{ themes('js/nav.js') }}"></script>
           
            <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/components/dropdown.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/components/transition.min.js"></script> 
            <script src="/js/typeahead.js"></script>
          {{--   <script src="/js/jquery-sticky-alert.js"></script> --}}
            {{-- <script src="/js/multiselect.js"></script>   --}}
            
            <script>
                // fadeout notification bar
                $(document).ready(function() {
            		setTimeout(function() {
            			$('.alert-messages').fadeOut("slow", function(){
            				$(this).remove();
            			})
            		}, 4500);
                });
                
                
                $('.ui.dropdown').dropdown();
                
                $('body').on('mouseenter mouseleave','.dropdown',function(e){
                  var _d=$(e.target).closest('.dropdown');_d.addClass('show');
                  setTimeout(function(){
                    _d[_d.is(':hover')?'addClass':'removeClass']('show');
                  },300);
                });
                
                $(function () {
                  $('[data-toggle="tooltip"]').tooltip()
                })
                
                



             

            </script>
               
           

<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
            <!-- Search autocomplete-->
            </script>

 <script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}

</script>
<script type="text/javascript">
                   
                    $('li a').on('click', function(){
    $('li a').removeClass('active');
    $(this).addClass('active');
});
                </script>
 <script type="text/javascript">
        	    // courses
                var courses = new Bloodhound({
                    datumTokenizer: Bloodhound.tokenizers.whitespace('q'),
                    queryTokenizer: Bloodhound.tokenizers.whitespace,
                    remote: {
                        url: '/api/search/courses?search=%QUERY%',
                        wildcard: '%QUERY%',
                        cache:false
                    },
                    
                });
                
                // authors
                var authors = new Bloodhound({
                    datumTokenizer: Bloodhound.tokenizers.whitespace('q'),
                    queryTokenizer: Bloodhound.tokenizers.whitespace,
                    remote: {
                        url: '/api/search/authors?search=%QUERY%',
                        wildcard: '%QUERY%',
                        cache:false
                    },
                    
                });
                
                $('.main-search-field').typeahead('destroy');
                
                $('.main-search-field').typeahead(
                    {
                        hint: false,
                        highlight: true,
                        minLength: 1
                    }, 
                    {
                        name: 'courses',
                        display: 'title',
                        //limit: 6,
                        source: courses,
                        templates: {
                            header: '<h5 class="result-title">{{__("t.courses")}}</h5>',
                            suggestion: function(el){
                                return  '<a href="/course/'+el.slug + '">' +
                                            '<div class="tt-suggestion tt-selectable media">'+
                                                '<div class="pull-left">' +
                                                        '<img src="'+el.cover_image+'" class="media-object img-rounded mr-2" style="width:40px">'+
                                                '</div>'+
                                                '<div class="media-body">'+
                                                    '<h4 class="media-heading">'+el.title+'</h4>'+
                                                    '<p class="desc">'+el.subtitle+'</p>'+
                                                '</div>'+
                                            '</div>' +
                                        '</a>'
                            }
            
                        },
                        
                    },
                   
                    {
                        name: 'authors',
                        display: 'name',
                        //limit: 4,
                        source: authors,
                        templates: {
                            header: '<h5 class="result-title">{{__("t.authors")}}</h5>',
                            suggestion: function(el){
                                 return '<a href="/user/'+el.username + '">' +
                                            '<div class="tt-suggestion tt-selectable media">'+
                                                '<div class="pull-left">' +
                                                    '<img src="'+el.picture+'" class="media-object img-rounded mr-2" style="width:40px">'+
                                                '</div>'+
                                                '<div class="media-body">'+
                                                    '<h4 class="media-heading">'+el.name+'</h4>'+
                                                    '<p class="desc">'+el.tagline+'</p>'+
                                                '</div>'+
                                            '</div>'+
                                        '</a>'
                            }
                        }
                    }
                );
                
        	</script>
            
        	
        	@if(!is_null($global_coupon))
        	    <script type="text/javascript">
        	        // notification bar
                    $(document).ready(function() {
                    	$('#alert-container').stickyalert({
                    		barColor: '#330200', // alert background color
                    		barFontColor: '#FFF', // text font color
                    		barFontSize: '1rem', // text font size
                    		barText: 'Get <span class="font-weight-bold text-warning">{{$global_coupon->percent}}% OFF</span> all courses. Offer ends <span class="font-weight-bold text-warning">{{ $global_coupon->expires->format("d-F-Y") }}.</span> Browse our Library now.', // the text to display, linked with barTextLink
                    		barTextLink: "{{route('frontend.courses')}}", // url for anchor
                    		cookieRememberDays: '1', // in days
                    		displayDelay: '0' // in milliseconds, 3 second default
                    	});
                    });
        	    </script>
                
        	@endif
            
            @stack('after-scripts')
            @include('includes.partials.ga')
        </div>
    </body>
</html>
