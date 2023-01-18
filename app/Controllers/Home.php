<?php

namespace App\Controllers;

use App\Models\DiskonModel;

class Home extends BaseController
{
  public function __construct(){
    helper('form');
    $this->diskon = new DiskonModel();
  }
  public function index()
  {
    $diskons = $this->diskon->where('aktif', 1)->findAll();
    return view('home', [
      'diskons' => $diskons
    ]);
  }

  public function contact()
    {
        return view('contact');
    }
}
