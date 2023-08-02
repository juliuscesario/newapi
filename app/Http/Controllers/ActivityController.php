<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use App\Models\Activities;

class ActivityController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->token = 'g89sng091bsg673bd0jmjost';
    }

    /**
     * _Returnresponse method for all data
     *
     * @param  string $message array $arr
     * @return \Illuminate\Http\Response|\Laravel\Lumen\Http\ResponseFactory
     */
    private function _returnresponse($message, $arr)
    {
        $data = array(
            'message' => $message,
            'data' => $arr
        );
        return ($data);
    }

    /**
     * _get_all_activity method
     *
     * @param  Request $requests    
     * @return _returnresponse;
     */
    public function _get_all_activity(Request $request)
    {
        //TOKEN CHECKING
        $token = $request->Authorization;
        //$token = $request->header('Authorization');
        if (empty($token)) {
            return response($this->_returnresponse('Invalid header', array()), 401);
        }
        if ($token != $this->token) {
            return response($this->_returnresponse('Invalid token', array()), 401);
        }
        //END OF TOKEN CHECKING

        $ActivityData = Activities::all();
        return response($this->_returnresponse('Success Retrieve Data', $ActivityData), 200);
    }
}
