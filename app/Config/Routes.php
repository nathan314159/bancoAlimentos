<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/register', 'register\RegisterController::index');
$routes->post('/register', 'register\RegisterController::create');
