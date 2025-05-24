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
            return redirect()->back()->withInput()->with("errors", $this->validator->listErrors());
        }

        // $userModel = new UserModel();
        // $post = $this->request->getPost(['nombreUsuario', 'nombre', 'apellido', 'email', 'cedula', 'telefono', 'fechaNacimiento', 'genero', 'password']);
        // $token = bin2hex(random_bytes(20));

        // $userModel->insert([
        //     'nombreUsuario' => $post['nombreUsuario'],
        //     'nombre' => $post['nombre'],
        //     'apellido' => $post['apellido'],
        //     'email' => $post['email'],
        //     'telefono' => $post['telefono'],
        //     'fechaNacimiento' => $post['fechaNacimiento'],
        //     'genero' => $post['genero'],
        //     'password' => password_hash($post['password'], PASSWORD_DEFAULT),
        //     'users_estado' => 0,
        //     'users_activation_token' => $token,
        // ]);
    }
}
