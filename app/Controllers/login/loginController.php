<?php

namespace App\Controllers\login;

use App\Models\Users;
use App\Controllers\BaseController;


class LoginController extends BaseController
{
    protected $users;

    public function __construct()
    {
        $this->users = new Users();
    }

    public function loginView()
    {
        echo view('layout/header.php');
        echo view('login/body.php');
    }

    public function verifyUser(){
        
    }
}
