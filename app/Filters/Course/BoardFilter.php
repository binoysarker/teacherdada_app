<?php

namespace App\Filters\Course;
use App\Models\Board;
use App\Filters\FilterAbstract;
use Illuminate\Database\Eloquent\Builder;
use App\Models\Category;

class BoardFilter extends FilterAbstract
{
    
    /**
     * Filter by course language of instruction.
     *
     * @param  string $language
     * @return Illuminate\Database\Eloquent\Builder
     */
   

    public function filter(Builder $builder, $value)
    {

        $board = Category::where('slug', $value)->first();
        // $categories = Category::where('parent_id', $category)->get();
        if($board->parent_id){
            return $builder->whereHas('category', function($q) use ($value,$board){
                $q->where(['slug'=> $value,'parent_id' => $board->parent_id]);
            });
        } 
        // else {
        //     return $builder->whereHas('category', function($q) use ($board){
        //         $q->where('id', $board->id);
        //     });    
        // }


      //  return $builder->where('board', $value);
    }
}
