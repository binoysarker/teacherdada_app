<?php

namespace App\Http\Controllers\Frontend\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\RegisterRequest;
use App\Helpers\Frontend\Auth\Socialite;
use App\Events\Frontend\Auth\UserRegistered;
use Illuminate\Foundation\Auth\RegistersUsers;
use App\Repositories\Frontend\Auth\UserRepository;

/**
 * Class RegisterController.
 */
class RegisterController extends Controller
{
    use RegistersUsers;

    /**
     * @var UserRepository
     */
    protected $userRepository;

    /**
     * RegisterController constructor.
     *
     * @param UserRepository $userRepository
     */
    public function __construct(UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    /**
     * Where to redirect users after login.
     *
     * @return string
     */
    public function redirectPath()
    {
        return route(home_route());
    }

    /**
     * Show the application registration form.
     *
     * @return \Illuminate\Http\Response
     */
    public function showRegistrationForm()
    {
        $countries = \Countries::all()->pluck('name.common', 'cca2');
        $boards = \DB::table('board')->get();
      return view('_Auth.register', compact('countries', 'boards'))
           ->withSocialiteLinks((new Socialite)->getSocialLinks());
        return view('_Auth.register', compact('countries'))
            ->withSocialiteLinks((new Socialite)->getSocialLinks());
    }
     public function showRegistrationFormforteacher()
    {
        // $countries = \Countries::all()->pluck('name.common', 'cca2');
      
      return view('_Auth.register-teacher')
           ->withSocialiteLinks((new Socialite)->getSocialLinks());
            
    }


    /**
     * @param RegisterRequest $request
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function register(RegisterRequest $request)
    {
        
        // $country = \Countries::where('cca2', $request->country)->first();
        // if($country){
        //     $country_name = $country->name->common;
        // } else {
        //     $country_name = $request->country;
        // }
       //  $country_name = "India"
        $user = $this->userRepository->create($request->only('username', 'first_name', 'last_name', 'email',  'board', 'qualification','specialization', 'password'));
        
        setting()->set('show_profile_in_search', true, $user->id);
        setting()->set('notify_when_mentioned', true, $user->id);
        setting()->set('notify_when_question_responded', true, $user->id);
        setting()->set('notify_when_new_announcement',  true, $user->id);
        setting()->set('notify_when_answer_marked_as_correct', true, $user->id);
        setting()->set('notify_when_followed_question_is_answered', true, $user->id);
        setting()->set('notify_when_question_i_am_following_responded', true, $user->id);
        setting()->set('notify_when_my_question_is_marked_as_answered', true, $user->id);
        setting()->set('notify_when_course_is_reviewed', true, $user->id);
        setting()->set('send_me_helpful_resources', true, $user->id);
        setting()->set('notify_when_new_question_in_my_course', true, $user->id);
        setting()->save($user->id);
        
        $user->affiliate_id = rand(1011, 221500)*rand(3,100)+rand(3,100);
        $user->country = "India";
        $user->country_code = "+91";
        $user->save();
        
        // If the user must confirm their email or their account requires approval,
        // create the account but don't log them in.
        if (config('access.users.confirm_email') || config('access.users.requires_approval')) {
            event(new UserRegistered($user));

            return redirect($this->redirectPath())->withFlashSuccess(
                config('access.users.requires_approval') ?
                    __('exceptions.frontend.auth.confirmation.created_pending') :
                    __('exceptions.frontend.auth.confirmation.created_confirm')
            );
        } else {
            auth()->login($user);

            event(new UserRegistered($user));

            return redirect($this->redirectPath());
        }
    }

    public function register_as_teacher(RegisterRequest $request)
    {
        
        // $country = \Countries::where('cca2', $request->country)->first();
        // if($country){
        //     $country_name = $country->name->common;
        // } else {
        //     $country_name = $request->country;
        // }
       //  $country_name = "India"
        $user = $this->userRepository->create($request->only('username', 'first_name', 'last_name', 'email',  'board', 'qualification','specialization', 'password'));
        
        setting()->set('show_profile_in_search', true, $user->id);
        setting()->set('notify_when_mentioned', true, $user->id);
        setting()->set('notify_when_question_responded', true, $user->id);
        setting()->set('notify_when_new_announcement',  true, $user->id);
        setting()->set('notify_when_answer_marked_as_correct', true, $user->id);
        setting()->set('notify_when_followed_question_is_answered', true, $user->id);
        setting()->set('notify_when_question_i_am_following_responded', true, $user->id);
        setting()->set('notify_when_my_question_is_marked_as_answered', true, $user->id);
        setting()->set('notify_when_course_is_reviewed', true, $user->id);
        setting()->set('send_me_helpful_resources', true, $user->id);
        setting()->set('notify_when_new_question_in_my_course', true, $user->id);
        setting()->save($user->id);
        $user->affiliate_id = rand(1011, 221500)*rand(3,100)+rand(3,100);
        $user->country = "India";
        $user->country_code = "+91";
        // try to change the teacher role to
        $user->assignRole('author');
        $user->removeRole('user');
        $user->save();
        // dd($user);
        // If the user must confirm their email or their account requires approval,
        // create the account but don't log them in.
        if (config('access.users.confirm_email') || config('access.users.requires_approval')) {
            event(new UserRegistered($user));

            return redirect($this->redirectPath())->withFlashSuccess(
                config('access.users.requires_approval') ?
                    __('exceptions.frontend.auth.confirmation.created_pending_under_admin') :
                    __('exceptions.frontend.auth.confirmation.created_pending_via_admin')
            );
        } else {
            auth()->login($user);

            event(new UserRegistered($user));

            return redirect($this->redirectPath());
        }
    }
}
