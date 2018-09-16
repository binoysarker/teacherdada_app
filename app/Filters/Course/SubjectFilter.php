<?php

namespace App\Filters\Course;
use App\Filters\FilterAbstract;
use Illuminate\Database\Eloquent\Builder;
use App\Models\Category;

class SubjectFilter extends FilterAbstract
{
    
    /**
     * Filter by course language of instruction.
     *
     * @param  string $language
     * @return Illuminate\Database\Eloquent\Builder
     */
   

    public function filter(Builder $builder, $value)
    {

        // $subject = Category::where('slug', $value)->first();
        // return $subject;
        return $builder->whereHas('subjects', function($q){
            $q->whereNotNull('subjects');
        });
        // else {
        //     return $builder->whereHas('category', function($q) use ($subject){
        //         $q->where('id', $subject->id);
        //     });    
        // }


      //  return $builder->where('subject', $value);
    }
}
