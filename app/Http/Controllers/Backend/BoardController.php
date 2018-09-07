<?php

namespace App\Http\Controllers\Backend;

use App\Models\Board;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BoardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //  $categories = Category::whereModel('App\Models\Course')->with('courses')->paginate(20);
        // $parentCategories = Category::whereNull('parent_id')->whereModel('App\Models\Course')->pluck('name', 'id')->prepend('Choose parent category is necessary','');

        // $catArray = Category::whereNull('parent_id')->whereModel('App\Models\Course')
        //                 ->orderBy('sortOrder', 'ASC')
        //                 ->with(['subCategories' => function($q){
        //                     $q->orderBy('sortOrder', 'ASC');    
        //                 }])->get();

        $boards = Board::orderBy('id', 'asc')->get();
       
        return view('backend.boards.index', compact('boards'));
        
         
     //   return view('backend.category.index', compact('categories', 'parentCategories', 'catArray'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
         $this->validate($request, [
            'name' => 'required',
            
        ]);
      
        $board = new Board();
        $board->name = strToUpper($request->name);
        $board->save();
       //  Alert::info("<strong>Warning!</strong> This is your message.");
        
       return redirect()->back();


    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $board = Board::find($id);
        $board->delete();
        return redirect()->back();
    }
}
