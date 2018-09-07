<?php

namespace App\Filters\Course;
use App\Models\Board;
use App\Filters\FilterAbstract;
use Illuminate\Database\Eloquent\Builder;

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

          $board = Board::where('name', $value)->first();
        
        if($board->id){
            return $builder->whereHas('board', function($q) use ($value){
                $q->where('name', $value);
            });
        } else {
            return $builder->whereHas('boaerd', function($q) use ($board){
                $q->where('id', $board->id);
            });    
        }


      //  return $builder->where('board', $value);
    }
}
