<?php

namespace App\Http\Controllers;

use App\KickstarterProject;
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
        return KickstarterProject::paginate(10);
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\KickstarterProject  $kickstarterProject
     * @return \Illuminate\Http\Response
     */
    public function show(KickstarterProject $kickstarterProject)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\KickstarterProject  $kickstarterProject
     * @return \Illuminate\Http\Response
     */
    public function edit(KickstarterProject $kickstarterProject)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\KickstarterProject  $kickstarterProject
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, KickstarterProject $kickstarterProject)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\KickstarterProject  $kickstarterProject
     * @return \Illuminate\Http\Response
     */
    public function destroy(KickstarterProject $kickstarterProject)
    {
        //
    }
}
