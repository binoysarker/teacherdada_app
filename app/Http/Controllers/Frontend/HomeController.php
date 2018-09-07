<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Certificate;
use App\Models\Course;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Auth\User;
use Illuminate\Support\Facades\Auth;

/**
 * Class HomeController.
 */
class HomeController extends Controller
{

    public function index(Request $request)
    {
        
        // $x = str_replace("{{name}}", "Alvaro", $request->body);
        
        
        
        
        
        if(auth()->check()){
            return redirect(route('frontend.courses'));
        } else {
            
            $categories = Category::whereNull('parent_id')->whereHas('subCategories', function($q){
                $q->whereHas('courses');
            })->withCount('subcategoryCourses as subcount')
                ->orderBy('subcount', 'asc')->get();

            $courses = Course::where(['approved' => true, 'published' => true])
                ->with(['category'])
                ->filter($request)->paginate(12);
           $teachers = User::whereHas(
                     'roles', function($q){
                        $q->where('name', 'author');
                        }
                        )->get();
            
            return view('home', compact('courses', 'categories', 'teachers'));
        }
        
    }
    
    
    public function fetchCourses(Request $request)
    {
        
        $courses = Course::with(['author', 'category'])->where('published', true)->where('approved', true)->whereHas('category', function($q) use ($request){
            $q->where('parent_id', $request->category);
        })->withCount('students')
            ->orderBy('students_count', 'desc')->paginate(8);
        
        foreach($courses as $c){
            $c->formatted_price = \Gabs::currency($c->price);
            $c->formatted_final_price = \Gabs::currency($c->final_price);
            $c->total_reviews = $c->reviews->count();
            $c->formated_updated_at = $c->updated_at->format('m/Y');
        }
        
        return response()->json($courses, 200);
    }
    
    
    
    public function verifyCertificate(Request $request)
    {
        return view('verification.verify-certificate');
    }
    
    
    public function verify(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email',
            'username' => 'required',
            'certificate_number' => 'required'
        ]);
        
        $certificate = Certificate::join('users', 'certificates.user_id', '=', 'users.id')
                        ->where('certificates.certificate_no', $request->certificate_number)
                        ->where('users.username', $request->username)
                        ->where('users.email', $request->email)
                        ->first();
                        
        if(!is_null($certificate)){
            $data = [
                'status' => 'success',
                'awarded_to' => $certificate->user->name,
                'certificate_number' => $certificate->certificate_no,
                'course' => $certificate->course_title . '-' . $certificate->course->subtitle,
                'course_author' => $certificate->course->author->name,
                'date_obtained' => $certificate->created_at->format('F d, Y')
            ];
        } else {
            $data = [
                'status' => 'not-found'    
            ];
        }
        
        return response()->json($data, 200);
        
    }
    
    
}
















