<?php
 
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
   protected $fillable=['name', 'parent_id', 'model', 'slug', 'sortOrder','sub_parent_id'];
    
    
    public function parentCategory()
    {
        return $this->belongsTo(self::class, 'parent_id');
    }
     // public function subParentCategory()
     // {
     //    return $this->belongsTo(self::class, 'parent_id', 'sub_parent_id');
       
     // //  return $this->hasMany( 'parent_id');
     // }
    
    public function subCategories()
    {
        return $this->hasMany(self::class, 'parent_id')->with('subCategories');
    }
    
    public function courses()
    {
        return $this->hasMany(Course::class);
    }
    
    public function posts()
    {
        return $this->hasMany(Post::class);
    }
    
    public function subcategoryCourses()
    {
        return $this->hasManyThrough(Course::class, Category::class, 'parent_id', 'category_id');
    }
    
    
    public function getRouteKeyName()
    {
        return 'slug';
    }
}
