<?php

namespace App\Http\Controllers;

use App\Kickstarter;
use Illuminate\Http\Request;

class KickstarterController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Kickstarter::limit(1000)->get();
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
        $kickstarter = Kickstarter::create($request->all());

        return $kickstarter;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Kickstarter  $kickstarter
     * @return \Illuminate\Http\Response
     */
    public function show(Kickstarter $kickstarter)
    {
        return $kickstarter;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Kickstarter  $kickstarter
     * @return \Illuminate\Http\Response
     */
    public function edit(Kickstarter $kickstarter)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Kickstarter  $kickstarter
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Kickstarter $kickstarter)
    {
        $kickstarter->fill($request->all());
        $kickstarter->save();

        return $kickstarter;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Kickstarter  $kickstarter
     * @return \Illuminate\Http\Response
     */
    public function destroy(Kickstarter $kickstarter)
    {
        $kickstarter->delete();
        return 'resource deleted';
    }
}
