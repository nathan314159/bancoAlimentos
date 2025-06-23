<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
//Main route
$routes->get('/', 'Principal::index');
$routes->get('/demoMain', 'Principal::demoMain');
//Dashboard
$routes->post('/verifyUser', 'Principal::verifyUser');
$routes->post('/enterUser', 'Principal::enterUser');
$routes->get('/logout', 'Principal::logout');
//Routes for create users - main
$routes->get('/createAccountView', 'Principal::createAccountView');
$routes->post('/create', 'register\RegisterController::create');

$routes->get('/formDatosGenerales', 'datos_generales\DatosGeneralesLoginController::index');
$routes->post('/insertDatosGenerales', 'datos_generales\DatosGeneralesLoginController::create');

$routes->post('/registerUser', 'Principal::insertUser');