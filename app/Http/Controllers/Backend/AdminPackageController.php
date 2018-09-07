<?php


namespace App\Http\Controllers\Backend;


use App\Models\Package;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AdminPackageController extends Controller
{
    
    
    public function index()
    {
        
        $packages = Package::orderBy('price', 'asc')->get();
        return view('backend.packages.index', compact('packages'));
    }
    
    
    public function edit(Package $package)
    {
        return view('backend.packages.edit', compact('package'));
    }
    
    
    public function update(Request $request, Package $package)
    {

        $this->validate($request, [
            'name' => 'required',
            'price' => 'required',
            'description' => 'required',
            'discount' => 'required|numeric|min:1',
            // 'number_of_courses' => 'required|numeric|min:1',
        ]);
        
        $package->name = $request->name;
        $package->price = $request->price;
        $package->slug = str_slug($request->name);
        $package->discount = $request->discount;
        $package->validity = $request->validity;
        $package->description = $request->description;
        $package->save();
        
        return redirect()->back();
    }
    
    
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'price' => 'required',
            'description' => 'required',
            'discount' => 'required|numeric|min:1',
            
        ]);
        
        $package = new Package();
        $package->name = $request->name;
        $package->price = $request->price;
        $package->slug = str_slug($request->name);
        $package->description = $request->description;
        $package->discount = $request->discount;
        $package->validity = $request->validity;
        $package->save();
        
        return redirect()->back();
    }
    
    
    public function destroy(Package $package)
    {

        $package->delete();
        return redirect()->back();
        
    }
    
}
