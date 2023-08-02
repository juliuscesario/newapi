<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use App\Models\PII_Data;

class PIIController extends Controller
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
     * _get_all_pii method
     *
     * @param  Request $request
     * @return _returnresponse;
     */
    public function _get_all_pii(Request $request)
    {
        //TOKEN CHECKING
        $token = $request->Authorization;;
        if (empty($token)) {
            return response($this->_returnresponse('Invalid header', array()), 401);
        }
        if ($token != $this->token) {
            return response($this->_returnresponse('Invalid token', array()), 401);
        }
        //END OF TOKEN CHECKING

        $PIIData = PII_Data::all();
        return response($this->_returnresponse('Success Retrieve Data', $PIIData), 200);
    }
}
