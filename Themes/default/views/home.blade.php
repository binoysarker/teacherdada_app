@extends('layouts.master')

@section('title', app_name() . ' | ' . __('t.home'))

@section('after-styles')
    <link rel="stylesheet" type="text/css" href="{{ themes('css/home.css') }}"> 
@stop

@section('content')
     <div class="container-fluid no-padding" >
    <div class="konnect-carousel carousel-image carousel-image-pagination carousel-image-arrows flexslider fade-loading">
        <!--style=" background: url({{ themes('img/white-bg.jpg') }});   background-size: cover; background-position: 50%;"-->
  <ul class="slides">
    <!--Slider One-->
    <li class="item first-slider">
        <!--<img class="img-responsive fadeInUpBig delay-one-point-five-s animated" style="width: 100%;" src="{{ themes('img/slider1.jpg') }}" draggable="false">-->
      <div class="container">
        <div class="row pos-rel">
          <div class="col-sm-12 col-md-6 animate">
              <!--<div style="width: 50%;  margin: 0 auto;">-->
                  
             
            <h3 class="big fadeInDownBig animated">Access best Teachers and Tuition courses across the country for your Subjects. Learn at you own speed.</h3>
            <p class="normal fadeInUpBig delay-point-five-s animated" ></p>
            <a class="btn btn-bordered btn-white btn-lg fadeInRightBig delay-one-s animated" href="#"> Show more </a> </div>
          <!--<div class="col-md-6 animate pos-sta hidden-xs hidden-sm"> <img class="img-responsive img-right fadeInUpBig delay-one-point-five-s animated" alt="iPhone" src="{{ themes('img/1.jpg') }}" draggable="false"> </div>-->
         <!--</div>-->
        </div>
      </div>
    </li>
    
    <!--Slider Two-->
    <li class="item flex-active-slide" style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 2;">
        <img class="img-responsive fadeInUpBig delay-one-point-five-s animated slider-two" style="width: 100%;" src="{{ themes('img/slider2.jpg') }}" draggable="false">
      <!--<div class="container">-->
      <!--  <div class="row pos-rel">-->
      <!--    <div class="col-md-6 animate pos-sta hidden-xs hidden-sm"> <img class="img-responsive img-left fadeInUpBig animated" alt="Circle" src="{{ themes('img/student-2.png') }}" draggable="false"> </div>-->
      <!--    <div class="col-sm-12 col-md-6 animate">-->
      <!--      <h2 class="big fadeInUpBig delay-point-five-s animated">Based on Bootstrap</h2>-->
      <!--      <p class="normal fadeInDownBig delay-one-s animated">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris in tincidunt mauris. Etiam arcu enim, laoreet vitae orci vel, rutrum feugiat nibh. Integer feugiat ligula tellus, non pulvinar justo pharetra eu. Nullam vehicula lorem ut diam tincidunt sagittis. Morbi est ligula, posuere in laoreet ac, porta porttitor dui</p>-->
      <!--      <a class="btn btn-bordered btn-white btn-lg fadeInLeftBig delay-one-point-five-s animated" href="#"> Show more </a> </div>-->
      <!--  </div>-->
      <!--</div>-->
    </li>
    
    <!--Slider Three-->
    <li class="item" style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-image: url({{ themes('img/slider3.jpg') }});  background-repeat: no-repeat;  background-size: cover; padding: 0px 0px;">
        <!--<img class="img-responsive fadeInUpBig delay-one-point-five-s animated" style="width: 100%;" src="{{ themes('img/slider1.jpg') }}" draggable="false">-->
      <div class="container">
        <div class="row pos-rel">
          <div class="col-sm-12 col-md-6 animate tom-class">
              <!--<div style="width: 50%;  margin: 0 auto;">-->
                  
             
            <h1 class="my-custom-class fadeInDownBig">LEARN ANYTIME ANYWHERE</h1>
          
          <!--<div class="col-md-6 animate pos-sta hidden-xs hidden-sm"> <img class="img-responsive img-right fadeInUpBig delay-one-point-five-s animated" alt="iPhone" src="{{ themes('img/1.jpg') }}" draggable="false"> </div>-->
         <!--</div>-->
        </div>
      </div>
    </li>
   
  </ul>
{{-- <ol class="flex-control-nav flex-control-paging"><li><a class="">1</a></li><li><a class="flex-active">2</a></li><li><a class="">3</a></li></ol> --}}<ul class="flex-direction-nav"><li><a class="flex-prev" href="#"></a></li><li><a class="flex-next" href="#"></a></li></ul></div>
</div>

    			
<div class="container banner">
  <div class="row">
      <div class="col-md-12"> 
        <!--Services Heading-->
        <h2 class="section-heading">Why Us?</h2>
        <div class="template-space"></div>
      </div>
      	<div class="col-md-4">
    							<div class="feature-box text-center">
    								<i class="icon fa fa-graduation-cap"></i>
    								<h4>Experienced Trainers</h4>
    								<p>Teachers can upload and Earn from their content by making it available as paid subscriptions for all students. Teachers can provide free access to their own students of their study materials .</br> </br></br></p>
    								<i class="bg-icon fa fa-graduation-cap"></i>
    							</div>
    							<!-- /.feature-box -->
    						</div>
    						<!-- /.col-md-4 -->

    						<div class="col-md-4">
    							<div class="feature-box text-center">
    								<i class="icon fa fa-users"></i>
    								<h4>Students</h4>
    								<p>Access various courses across Subjects, Classes and Boards. These courses are designed to enable efficient & quick learning with in-depth explanations. View courses from multiple teachers for better perspective and preparation for your Exams.</p>
    								<i class="bg-icon fa fa-users"></i>
    							</div>
    							<!-- /.feature-box -->
    						</div>
    						<!-- /.col-md-4 -->

    						<div class="col-md-4">
    							<div class="feature-box text-center">
    								<i class="icon fa fa-window-restore"></i>
    								<h4>Easy to Use</h4>
    								<p>The platform is designed for easy and quick engagement for both Teachers and students. Students can track their progress while taking the courses. Teachers can convert their study materials into audio visual format by adding voice overs. </br> </br></p>
    								<i class="bg-icon fa fa-window-restore"></i>
    							</div>
    							<!-- /.feature-box -->
    						</div>
    <!--<div class="col-md-4 col-sm-12 col-xs-12">-->
    <!--  <div class="banner-bar"> -->
    <!--    <h3><img src="{{ themes('img/icons/classroom.png') }}" alt="icon" style="padding: 0 8px;" ><span>Experienced Trainers</span></h3>-->
    <!--    <p>Teachers can upload and Earn from their content by making it available as paid subscriptions for all students. Teachers can provide free access to their own students of their study materials . </br></br></p>-->
    <!--  </div>-->
    <!--</div>-->
    <!--<div class="col-md-4 col-sm-12 col-xs-12">-->
    <!--  <div class="banner-bar">-->
    <!--    <h3> <img src="{{ themes('img/icons/certificate.png') }}" alt="icon" style="padding: 0 8px;" ><span>Students</span></h3>-->
    <!--    <p>Access various courses across Subjects, Classes and Boards. These courses are designed to enable efficient & quick learning with in-depth explanations. View courses from multiple teachers for better perspective and preparation for your Exams.</p>-->
    <!--  </div>-->
    <!--</div>-->
    <!--<div class="col-md-4 col-sm-12 col-xs-12">-->
    <!--  <div class="banner-bar"> -->
    <!--    <h3><img src="{{ themes('img/icons/job-support.png') }}" alt="icon" style="padding: 0 8px;"><span>Easy to Use</span></h3>-->
    <!--    <p>The platform is designed for easy and quick engagement for both Teachers and students. Students can track their progress while taking the courses. Teachers can convert their study materials into audio visual format by adding voice overs. </p>-->
    <!--  </div>-->
    <!--</div>-->
  </div>
</div>



<section class=" bg-gray light-bg about" >
  <div class="container">
    <div class="row">
      <div class="col-md-12"> 
        <!--Services Heading-->
        <h2 class="section-heading">Who We Are?</h2>
        <div class="template-space"></div>
      </div>
      <div class="col-md-6 padding-20">
        <h2 class="para-heading">About Teacherdada</h2>
        <p>TeacherDada is a social platform to provide video tuition classes from Expert Teachers across Boards, States and Subjects.</p>
        <p>TeacherDada is a social platform to provide video tuition classes from Expert Teachers across Boards, States and Subjects.</p>
        <a class="service-box-button">View More</a> </div>
      <div class="col-md-6 border-video">
           <!--<img src="{{ themes('img/students.jpeg') }}" class="img-responsive img-hide-sm" alt="Company"> -->
           <iframe width="100%" height="315" src="https://www.youtube.com/embed/IQS_fG7dgVA" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
           
           
     </div>
    </div>
  </div>
</section>

<home inline-template :categories="{{$categories}}" v-cloak>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="tab-content">
                            <div id="course-list" class="text-centerx">
                                <div class="col-md-6 offset-md-3 text-center">
                                    <h2 class="section-heading">{{ __('t.browse-our-top-courses') }}</h2>
                                    <hr />
                                </div>
                                
                                <ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
                                    <li class="nav-item" v-for="cat in categories">
                                        <a class="nav-link" :class="{'active' : category.id == cat.id }" :id="'cattab-'+cat.id" 
                                            @click.prevent="fetchCourses(cat)" href="">
                                            @{{ cat.name }}
                                        </a>
                                    </li>
                                </ul>
                                <div class="tab-contentx pt-4">
                                    <div class="tab-pane">
                                        <div class="row">
                                            <div class="col-sm-6 col-thumb col-md-3" v-if="courses" v-for="course in courses">
                                                <transition-group name="fade" mode="out-in">
                                                    <course global_coupon="{{ !is_null($global_coupon) }}" :key="course.id" :course="course"></course>
                                                </transition-group>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                               
                               
                                
                            </div>
                            
                            
                        </div>
                    </div>   
                    
                    <!--<div class="col-md-6 offset-md-3 text-center">-->
                    <div class="col-md-12" style="float: right;">
                        <!--<hr />-->
                        
                        <a class="btn btn-outline-secondary" :href="'/courses?category='+category.slug">
                            {{ __('t.browse-courses-in') }} @{{ category.name }} <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                        </a>
                       {{-- 
                        <ul class="pager" v-if="courses.length > 0 && current_page < total_pages">
                            <li>
                                <a href="" rel="next" @click.prevent="fetchMoreCourses(cat_id)">
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </ul> --}}
                       
                        
                    </div>
                </div> 
            </div>
</section>
</home>



<section class="bg-gray light-bg trainers">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <h2 class="section-heading text-white">Our Talented Trainers</h2>
        <div class="template-space"></div>
      </div>
    </div>
    <div class="row"> 
         <div class="col-md-12" style="padding: 0px;">
    <div id="carouselExample" class="carousel slide" data-ride="carousel" data-interval="9000">
        <div class="carousel-inner b1 row w-100 mx-auto" role="listbox">
      <!--Team member 1-->
       @php
            $i = 1
        @endphp
        @foreach ($teachers as $datum)
             @if ($loop->first)
              <div class="col-md-3 col-sm-6 article-box  a1 carousel-item active">
               @else
                 <div class="col-md-3 a1 carousel-item article-box">
             @endif

     
        <article>
          <div class="team-box">
            <div class="img-box"> <a href="{{route('frontend.user', $datum->username)}}"><img src="{{ $datum->picture }}" alt="it's me Image"></a>
            </div>
            <div class="team-content-text"><a href="{{route('frontend.user', $datum->username)}}">
              <h4>{{$datum->name}}</h4></a>
              <div class="desc">{{$datum->tagline}}
              </div>
              <div class="team-more">
                @if($datum->web)
                                <a class="btn btn-info btn-sm" rel="publisher" href="{{$datum->web}}" target="_blank">
                                    <i class="fa fa-globe"></i>
                                </a>
                            @endif
                            @if($datum->twitter)
                                <a class="btn btn-info btn-twitter btn-sm" href="https://www.twitter.com/{{$datum->twitter}}" target="_blank">
                                    <i class="fa fa-twitter"></i>
                                </a>
                            @endif
                            @if($datum->github)
                                <a class="btn btn-info btn-sm" rel="publisher" href="https://www.github.com/{{$datum->github}}" target="_blank">
                                    <i class="fa fa-github"></i>
                                </a>
                            @endif
                            @if($datum->facebook)
                                <a class="btn btn-info btn-sm" rel="publisher" href="https://www.facebook.com/{{$datum->facebook}}" target="_blank">
                                    <i class="fa fa-facebook"></i>
                                </a>
                            @endif
                            @if($datum->linkedin)
                                <a class="btn btn-info btn-sm" rel="publisher" href="https://www.linkedin.com/{{$datum->linkedin}}" target="_blank">
                                    <i class="fa fa-linkedin"></i>
                                </a>
                            @endif
            </div>

          </div>
        
      </div>
      </article>
      @php
            $i++
        @endphp
 @endforeach
</div>
 <a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next text-faded" href="#carouselExample" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>

      </div>
    </div>
  </div>
</section>

<aside class="dark-bg review">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-white">
        <h2 class="section-heading text-dark">Student Reviews</h2>
        <div class="template-space"></div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12" data-wow-delay="0.2s">
          <div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
    {{-- <ol class="carousel-indicators">
     <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
     <li data-target="#carousel-example-1z" data-slide-to="1"></li>
     <li data-target="#carousel-example-1z" data-slide-to="2"></li>
    </ol> --}}
    <div class="carousel-inner" role="listbox">
     <div class="carousel-item active">
      
        <div class="testimonial4_slide"><center>
                    {{-- <img src="img/17076979_262399237545189_1002782277006000128_n.jpg" class="img-circle img-responsive" /> --}}
                    <blockquote>
                        <div class="col-md-8 col-md-offset-2 col-xs-12 testimonial-slider-color">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. !</p>
                    <h3>Someone Client</h3> </div>
                    </blockquote></center>
                    
                </div>

     </div>
     <div class="carousel-item">
       <div class="testimonial4_slide"><center>
                   {{--  <img src="img/155787040_d669d65c-.jpg" class="img-circle img-responsive" /> --}}
                    <blockquote>
                        <div class="col-md-8 col-md-offset-2 col-xs-12 testimonial-slider-color">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. !</p>
                    <h3>Someone Client</h3> </div>
                    </blockquote></center>
                </div>
     </div>
     <div class="carousel-item">
       <div class="testimonial4_slide">
                     <center>
                   {{--  <img src="img/Why-he-Chose-Holland.jpg" class="img-circle img-responsive" /> --}}
                   <blockquote>
                        <div class="col-md-8 col-md-offset-2 col-xs-12 testimonial-slider-color">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. !</p>
                    <h3>Someone Client</h3> </div>
                    </blockquote></center>
                </div>
     </div>
    </div>
    <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
     <span class="carousel-control-prev-icon" aria-hidden="true"></span>
     <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
     <span class="carousel-control-next-icon" aria-hidden="true"></span>
     <span class="sr-only">Next</span>
    </a>
   </div>
  </div>
 </div>
  </div>
</aside>


<!--<section class="light-bg">-->
<!--  <div class="container">-->
<!--    <div class="row">-->
<!--      <div class="col-md-12">-->
<!--        <h2 class="section-heading">EduCourse Stats</h2>-->
        <!--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec neque erat, ultrices cursus nisi at, hendrerit tristique.</p>-->
<!--        <div class="template-space"></div>-->
<!--      </div>-->
<!--      <div class="company-stats">-->
<!--        <div class="col-md-3 col-sm-6">-->
<!--          <div class="profile-box"> <img src="{{ themes('img/icons/tool.png') }}" alt="icon">-->
<!--          <h2><span>500+</span></h2>-->
<!--            <h4>professionals trained</h4>-->
<!--          </div>-->
<!--        </div>-->
<!--        <div class="col-md-3 col-sm-6">-->
<!--          <div class="profile-box"> <img src="{{ themes('img/icons/expert.png') }}" alt="icon">-->
<!--          <h2><span>10+</span></h2>-->
<!--            <h4>Years of Experience</h4>-->
<!--          </div>-->
<!--        </div>-->
<!--        <div class="col-md-3 col-sm-6">-->
<!--          <div class="profile-box"> <img src="{{ themes('img/icons/clients.png') }}" alt="icon">-->
<!--           <h2><span>15+</span></h2>-->
<!--            <h4>Companies Association</h4>-->
<!--          </div>-->
<!--        </div>-->
<!--        <div class="col-md-3 col-sm-6">-->
<!--          <div class="profile-box"> <img src="{{ themes('img/icons/success.png') }}" alt="icon">-->
<!--          <h2><span>99%</span></h2>-->
<!--            <h4>Job Guarantee</h4>-->
<!--          </div>-->
<!--        </div>-->
<!--      </div>-->
<!--    </div>-->
<!--  </div>-->
<!--</section>-->
























       {{--  <div class="carousel slide" data-ride="carousel" id="quote-carousel"> 
          <!-- Carousel Slides / Quotes -->
          <div class="carousel-inner text-center"> 
            <!--Testmonial One active-->
            <div class="item active">
              <blockquote>
                <div class="row">
                  <div class="col-md-8 col-md-offset-2 col-xs-12">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. !</p>
                    <small>Someone Client</small> </div>
                </div>
              </blockquote>
            </div>
            
            <!--Testmonial Two-->
            <div class="item">
              <blockquote>
                <div class="row">
                  <div class="col-md-8 col-md-offset-2 col-xs-12">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </p>
                    <small>Someone Client</small> </div>
                </div>
              </blockquote>
            </div>
            
            <!--Testmonial Three-->
            <div class="item">
              <blockquote>
                <div class="row">
                  <div class="col-md-8 col-md-offset-2 col-xs-12">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. .</p>
                    <small>Someone Client</small> </div>
                </div>
              </blockquote>
            </div>
          </div>
          
          <!-- Carousel Buttons Next/Prev --> 
          <a data-slide="prev" href="#quote-carousel" class="left carousel-control"><i class="fa fa-angle-left"></i></a> <a data-slide="next" href="#quote-carousel" class="right carousel-control"><i class="fa fa-angle-right"></i></a> 
          <!-- Bottom Carousel Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#quote-carousel" data-slide-to="0" class="active"></li>
            <li data-target="#quote-carousel" data-slide-to="1" class=""></li>
            <li data-target="#quote-carousel" data-slide-to="2" class=""></li>
          </ol>
        </div> --}}
      

    <!-- Jumbotron -->
    
   {{-- <div class="jumbotron jumbotron-fluid paral home-hero">
        <div class="cover">
             <div class="container-fluid hero-text">
             <div class="row">
                <div class="col-md-6  text-center" style="float: right;">
                    <div class="ed_video_section">
                    <div class="embed-responsive embed-responsive-16by9">
                        <div class="ed_video">
                            <img src="http://kamleshyadav.com/html/educo/educo/educo_default/images/content/v_bg.jpg" style="cursor:pointer" alt="1">
                            <div class="ed_img_overlay">
                                <a href="#"><i class="fa fa-chevron-right"></i></a>
                            </div>
                        </div>
                        <iframe width="100%" height="250px" src="https://www.youtube.com/embed/MxOZ6AfcUeU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    </div>
                </div>
              
              </div>

                <div class="col-md-6  text-center">
                <h1 class="display-3">{{ __('t.learn-new-skill') }}</h1>
                <p class="lead">
                    {{ __('t.hero-small-text') }}
                </p>
                
                <p class="leadx mt-5">
                    <a class="btn btn-warning btn-lg font-weight-bold" href="/register" role="button">
                        {{ __('t.get-started') }}   
                    </a>
                </p>
            </div>
              
            </div>
            </div>  --}}
         {{--   <div class="container-fluid">
         <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12">
                <div class="ed_video_section">
                    <div class="embed-responsive embed-responsive-16by9">
                        
                        <iframe width="100%" height="250px" src="https://www.youtube.com/embed/MxOZ6AfcUeU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12">
                <div class="ed_video_section_discription">
                    <h4 style="text-align: left;"> {{ __('t.learn-new-skill') }} </h4>
                    <p style="text-align: left;">   {{ __('t.hero-small-text') }} </p>
                    <span>
                     <a style="text-align: left;" class="btn ed_btn ed_orange font-weight-bold" href="/register" role="button">
                        {{ __('t.get-started') }}   
                    </a>
                    </span>
                </div>
            </div>
        </div>
    </div>
        </div> 
    </div> --}}
    {{-- <div class="why-choose-area  section-space-default">                
                <div class="container">
                    <div class="col-md-12  text-center">
                                    <h3>What TeacherDada Does?</h3>
                                    <hr />
                                    <span><center> TeacherDada.com’ is an online education networking portal between Professional Teachers and Students for easy and affective Teaching. </center> </span>
                                </div>
                    
                </div>
                <div class="container">
                    <div class="row padding_ver">
                         <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="why-choose-box">
                                <a href="#"><i class="fa fa-user" aria-hidden="true"></i></a>
                                <h3><a href="#">Teachers</a></h3>
                                <p>For Teachers ‘TeacherDada.com’ acts as a networking platform to Reach and Teach a large base of students through uploaded ‘Video Lecture Contents’ and course materials at a pre-agreed price point. Teachers can also share their own materials free to a specific number of students if they desire.</p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="why-choose-box">
                                <a href="#"><i class="fa fa-users" aria-hidden="true"></i></a>
                                <h3><a href="#">Students</a></h3>
                                <p>For Students ‘TeacherDada.com’ provides access to a wide range of Lecture Video  Study Materials by Subjects at a very low price point for fast and effective learning.</p>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div> --}}
    <!-- HOW IT WORKS -->
   


    </home>
@endsection

@push('after-scripts')
    
    <script type="text/javascript" src="{{ themes('js/jquery.flexslider.min.js') }}"></script>
    <script type="text/javascript" src="{{ themes('js/konnect-slider.js') }}"></script>
    {{-- <script type="text/javascript" src="{{ themes('js/default.js') }}"></script> --}}
    
    <script type="text/javascript">
       
       $("[data-toggle=popover]").each(function(i, obj) {
            $(this).popover({
                html: true,
                trigger: "hover",
                animation: true,
                content: function() {
                    var id = $(this).attr('id')
                    return $('#popover-course-' + id).html();
                }
            })
           
       });
        
        $(document).ready(function(){
            
            setTimeout(function(){
                $('#loading').fadeOut('fast');
                //$('#course-list').removeClass('d-none');
                $('#course-list').fadeIn('slow');    
            }, 500)
        });
      
        
        
    </script>
    <script type="text/javascript">
  
$('#carouselExample').on('slide.bs.carousel', function (e) {

  
    var $e = $(e.relatedTarget);
    var idx = $e.index();
    var itemsPerSlide = 4;
    var totalItems = $('.a1.carousel-item').length;
    
    if (idx >= totalItems-(itemsPerSlide-1)) {
        var it = itemsPerSlide - (totalItems - idx);
        for (var i=0; i<it; i++) {
            // append slides to end
            if (e.direction=="left") {
                $('.a1.carousel-item').eq(i).appendTo('.b1.carousel-inner');
            }
            else {
                $('.a1.carousel-item').eq(0).appendTo('.carousel-inner');
            }
        }
    }
});


  $('#carouselExample').carousel({ 
                interval: 2000
        });


  
</script>
@endpush
