<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
//$routes->get('/', 'Home::index');
$routes->get('/register', 'register\RegisterController::index');
$routes->post('/create', 'register\RegisterController::create');
$routes->get('/loginView', 'login\LoginController::loginView');
$routes->post('/verifyUser', 'login\LoginController::verifyUser');

$routes->get('/formDatosGenerales', 'datos_generales\DatosGeneralesLoginController::index');
$routes->post('/insertDatosGenerales', 'datos_generales\DatosGeneralesLoginController::create');