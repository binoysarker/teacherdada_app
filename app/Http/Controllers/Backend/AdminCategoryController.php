<?php

namespace App\Http\Controllers\Backend;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AdminCategoryController extends Controller
{

     // Course Categories
    public function index()
    {
        // get categories
        $categories = Category::whereModel('App\Models\Course')->with('courses')->paginate(20);
        // get parentCategories
       // dd($categories);
        $parentCategories = Category::whereNull('parent_id')->whereNull('sub_parent_id')->whereModel('App\Models\Course')->pluck('name', 'id')->prepend('Choose parent category is necessary','');
       // dd($parentCategories);
       $subparentCategories = Category::whereNotNull('parent_id')->whereNull('sub_parent_id')->whereModel('App\Models\Course')->pluck('name', 'id')->prepend('Choose Sub parent category is necessary','');
       // dd($subparentCategories);
        $catArray = Category::whereNull('parent_id')->whereModel('App\Models\Course')
                        ->orderBy('sortOrder', 'ASC')
                        ->with(['subCategories.subCategories' => function($q){
                            $q->orderBy('sortOrder', 'ASC');
                        }])->get();
                   //  return dd($catArray);
        // dd($catArray);
       // var_dump($catArray);
       return view('backend.category.index', compact('categories', 'parentCategories', 'catArray', 'subparentCategories'));
    }

    public function edit(Category $category)
    {
        $parentCategories = Category::whereNull('parent_id')->whereModel('App\Models\Course')->pluck('name', 'id')->prepend('Choose parent category is necessary','');
        return view('backend.category.edit', compact('category', 'parentCategories'));
    }

    public function update(Request $request, Category $category)
    {

        $this->validate($request, [
            'name' => 'required|unique:categories,name,'.$category->id
        ]);
        $category->name = $request->name;
        $category->slug = str_slug($request->name);
        $category->color = $request->color;
        $category->parent_id = $request->parent_category;
        $category->save();

        return redirect()->back();
    }


    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required:categories,name',
        ]);

        $category = new Category();
        $category->name = $request->name;
        $category->slug = str_slug($request->name);
        $category->color = $request->color;
        $category->model = 'App\Models\Course';

        if($request->sub_parent_category) {
          $category->parent_id = $request->sub_parent_category;
        }
        else {
             $category->parent_id = $request->parent_category;
        }

        $category->sub_parent_id = $request->parent_category;
        $category->save();

        return redirect()->back();
    }

    public function destroy(Category $category)
    {
        if(config('settings.enable_demo')){
            return back()->withFlashDanger('Not allowed in Demo mode');
        }

        $category->delete();
        return redirect()->back();
    }



    public function orderCategories(Request $request)
    {

        $category_order = json_decode($request->sortOrder);
        $video_categories = Category::whereModel('App\Models\Course')->get();
        $order = 1;
        var_dump($category_order);
        foreach($category_order as $category_level_1):
            $level1 = Category::find($category_level_1->id);

            if($level1->id){
                $level1->sortOrder = $order;
                $level1->parent_id = NULL;
                $level1->save();
                $order += 1;
            }

            if(isset($category_level_1->children)):

                $children_level_1 = $category_level_1->children;

                foreach($children_level_1 as $category_level_2):

                    $level2 = Category::find($category_level_2->id);
                    if($level2->id){
                        $level2->sortOrder = $order;
                        $level2->parent_id = $level1->id;
                        $level2->save();
                        $order += 1;
                    }

                endforeach;

            endif;

        endforeach;

        return 1;

    }
}
