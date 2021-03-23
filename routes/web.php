<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'App\Http\Controllers\MainController@home')->name('home');


Route::get('/login', 'App\Http\Controllers\MainController@login')->name('login');
Route::get('/register', 'App\Http\Controllers\MainController@register')->name('register');
Route::post('/save', 'App\Http\Controllers\MainController@save')->name('save_user');
Route::post('/check', 'App\Http\Controllers\MainController@check')->name('check');

Route::get('/dashboard', 'App\Http\Controllers\MainController@dashboard')->name('dashboard');

Route::get('/logout', 'App\Http\Controllers\MainController@logout')->name('logout');
