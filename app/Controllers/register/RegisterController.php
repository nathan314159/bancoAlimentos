<?php

namespace App\Controllers\register;

use App\Controllers\BaseController;

class RegisterController extends BaseController
{
    public function index()
    {
        return view('register/signup');
    }

    public function create()
    {
        helper(['form']);

        $rules = [
            'nombreUsuario'   => 'required|max_length[100]|is_unique[tbl_users.users_nombreUsuario]',
            'nombre'          => 'required|max_length[25]',
            'apellido'        => 'required|max_length[25]',
            'email'           => 'required|valid_email|max_length[100]|is_unique[tbl_users.users_email]',
            'cedula'          => 'required|max_length[25]|is_unique[tbl_users.users_cedula]',
            'telefono'        => 'required|max_length[25]',
            'fechaNacimiento' => 'required',
            'genero'          => 'required|in_list[1,2,3]',
            'password'        => 'required|min_length[6]',
            'repassword'      => 'required|matches[password]',
        ];

        if (!$this->validate($rules)) {
            log_message('debug', 'Validation failed. Errors: ' . $this->validator->listErrors());

            return redirect()->back()->withInput()->with("errors", $this->validator->listErrors());
        }
        
    }
}
