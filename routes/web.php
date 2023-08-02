<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->get('/province', 'RegistrationController@_get_province');
$router->post('/registration', 'RegistrationController@_register_consumer');
$router->get('/all_pii', 'PIIController@_get_all_pii');
$router->get('/all_activity', 'ActivityController@_get_all_activity');
$router->post('/activity', 'RegistrationController@_register_activity');
