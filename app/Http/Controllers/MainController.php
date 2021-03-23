<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;

use App\Models\Quotes;
use App\Models\User;
use App\Models\Slider;
use App\Models\Activities_user;
use App\Models\Preferences_user;
class MainController extends Controller
{

    public  function login() {
        return view('auth.login');
    }
    public  function register() {
        return view('auth.register');
    }
    public  function save(Request $request) {
        $request->validate(
            [
                'name' => 'required',
                'email' => 'required|email|unique:users',
                'password' => 'required|min:5',
            ]
        );
        try {
            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->password = hash::make($request->password);
            $user->save();
            return redirect('/login');
        } catch (Exception $e) {
            return array("error"=>$e->getMessage());
        }

    }

    public  function check(Request $request) {
        $request->validate(
            [
                'email' => 'required|email',
                'password' => 'required|min:5',
            ]
        );

        $user = User::where('email','=',$request->email)->first();

        if(!$user) {
            return back()->with('fail','No se encuentra');
        }else {
            if(Hash::check($request->password,$user->password)) {
                $request->session()->put('LoggedUser',$user->id);
                return redirect('/dashboard');
            }else {
                return back()->with('fail','Contraseña erronia');
            }
        }
    }

    public  function dashboard() {
        $data = ['User' => User::where('id','=',session('LoggedUser'))->first(),'Activities' => $this->get_activity_user(session('LoggedUser'))];
        return view('dashboard',$data);
    }

    public function logout() {
        if(session()->has('LoggedUser')) {
            session()->pull('LoggedUser');
            return redirect('/');
        }
    }

    public function home() {
        $this->get_quote();
        $data = [
            'quote' => $this->get_quote_in_local(),
            'sliders' =>$this->get_sliders()
        ];
        return view('welcome',$data);
    }

    public function save_quote($data) {
        $pref = Quotes::where('id_quote','=',$data['id'])->first();
        if(!$pref) {
            try {
                $quote = new Quotes();
                $quote->id_quote = $data['id'];
                $quote->quote = $data['quote'];
                $quote->author = $data['author'];
                $quote->title = $data['title'];
                $quote->background = $data['background'];
                $quote->date_show = $data['date'];
                $quote->numero_expos = 1;
                $quote->save();
            } catch (Exception $e) {
                return array("error"=>$e->getMessage());
            }
        }
    }

    private function get_quote_in_local() {
        $data = Quotes::all()->random(1)->first();
        $data->numero_expos = $data->numero_expos+1;
        $data->save();
        return $data;
    }

    private function get_quote() {
        try {
        $response = Http::withHeaders([
            'X-TheySaidSo-Api-Secret' => 'oxis',
        ])->get('https://quotes.rest/qod');
        $data = $response['contents']['quotes'][0];
        $this->save_quote($data);
        return $data;
            }catch (\Exception $e) {
            return 'error';
        }
    }

    private function get_sliders() {
        $data = Slider::all();
        return $data;
    }

    //Api

    public function get_user($name) {
        //
        try {

            $user = User::where('name','=',$name)->first();

            if ($user) {
                $response['data'] = $user;
                $response['message'] = "Busqueda exitosa";
                $response['success'] = true;
            }
            else {
                $response['data'] = null;
                $response['message'] = "No se consigue usuarios con el nombre => $name";
                $response['success'] = false;
            }

        } catch (\Exception $e) {
            $response['message'] = $e->getMessage();
            $response['success'] = false;
        }
        return response()->json($response);

    }

    public function update_wallpaper(Request $request) {
        $user = User::where('id','=',$request->user_id)->first();
        $wallpaper = $request->url_wallpaper;
        $preference = $this->save_preference($user,$wallpaper);
        $activity = $this->save_activty($user,$wallpaper,$preference);
        return $activity;
    }

    public function list_quotes() {
        $quotes = Quotes::all();
        foreach ($quotes as $item) {
            $quote = Quotes::find($item->id);
            $quote->numero_expos = $quote->numero_expos+1;
            $quote->save();
        }
        return response()->json($quotes);
    }

    private function save_preference($user,$wallpaper)  {
        $pref = Preferences_user::where('id_user','=',$user->id)->first();
        if(!$pref) {
            $preference = new Preferences_user();
            $preference->name = $user->name;
            $preference->cellphone = $user->id;
            $preference->screen_url = $wallpaper;
            $preference->id_user = $user->id;
            $preference->save();
            return $preference;
        } else {
            $pref->screen_url = $wallpaper;
            $pref->save();
            return $pref;
        }
    }
    private function save_activty($user,$wallpaper,$preference)  {
        $activity = new Activities_user();
        $activity->action = $preference->id;
        $activity->screen_url = $wallpaper;
        $activity->user_id = $user->id;
        $activity->save();
        return $activity;
    }
    private function get_activity_user($user_id) {
        $activities = Activities_user::where('user_id','=',$user_id)->get();
        return $activities;
    }
}
