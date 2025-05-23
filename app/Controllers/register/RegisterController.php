<?php

namespace App\Controllers\register;

use App\Controllers\BaseController;

class RegisterController extends BaseController
{
    public function index()
    {
        return view('register/signup');
    }
}
