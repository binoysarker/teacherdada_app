<?php

namespace App\Http\Composers;

use App\Models\Post;
use App\Models\Coupon;
use App\Models\Category;
use Illuminate\View\View;
use App\Filters\Course\CourseFilters;

/**
 * Class GlobalComposer.
 */
class GlobalComposer
{
    /**
     * Bind data to the view.
     *
     * @param View $view
     *
     * @return void
     */
    public function compose(View $view)
    {
        $view->with('logged_in_user', auth()->user());
        
        
        $view->with('logged_in_user', auth()->user());
        
        $view->with([
            'mappings' => CourseFilters::mappings()
        ]);
        
       // $view->with('global_course_categories', Category::whereNull('parent_id')
       //          ->whereModel('App\Models\Course')->with('subCategories')->get());
        
        $view->with('global_course_categories', Category::whereNull('parent_id')->whereModel('App\Models\Course')
                        ->orderBy('sortOrder', 'ASC')
                        ->with(['subCategories.subCategories' => function($q){
                            $q->orderBy('sortOrder', 'ASC');    
                        }])->get());
         $view->with('global_post_categories', Category::whereNull('parent_id')
                ->whereModel('App\Models\Post')
                ->where('slug', '!=', 'site-pages')->with('subCategories')->get());
        
        $view->with('global_coupon', Coupon::where(['sitewide' => true, 'active' => true])
                ->where('expires', '>=', \Carbon\Carbon::now())->first());
        
        $view->with('footer_pages', Post::withTranslation()
                        ->whereHas('category', function ($q) {
                            $q->where('slug', 'site-pages');
                        })
                        ->where('published', true)->get());
    }
}
