<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use App\Models\PII_Data;
use App\Models\Activities;

class RegistrationController extends Controller
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
     * _Register_Activity method
     *
     * @param  Request $request
     * @return _returnresponse;
     */
    public function _register_activity(Request $request)
    {
        //TOKEN CHECKING
        $token = $request->header('Authorization');
        if (empty($token)) {
            return response($this->_returnresponse('Invalid header', array()), 401);
        }
        if ($token != $this->token) {
            return response($this->_returnresponse('Invalid token', array()), 401);
        }
        //END OF TOKEN CHECKING

        //INIT DATA
        $activity = $request->activity;
        $event = $request->event;
        $Activity_Insert = new Activities();
        $Activity_Insert->event = $event;
        $Activity_Insert->browser = $request->browser;
        $Activity_Insert->platform = $request->platform;
        $Activity_Insert->ipAddress = $request->ipAddress;
        $Activity_Insert->activity = $activity;

        $ActivityStatus = $Activity_Insert->save();
        return response($this->_returnresponse('success', array('data' => $ActivityStatus)), 200);
    }

    /**
     * _Register_Consumer method
     *
     * @param  Request $request
     * @return _returnresponse;
     */
    public function _register_consumer(Request $request)
    {
        //TOKEN CHECKING
        $token = $request->header('Authorization');
        if (empty($token)) {
            return response($this->_returnresponse('Invalid header', array()), 401);
        }
        if ($token != $this->token) {
            return response($this->_returnresponse('Invalid token', array()), 401);
        }
        //END OF TOKEN CHECKING

        //INIT DATA
        $name = $request->name;
        $phone = $request->phone;
        $phone = preg_replace('/^0/', '62', $phone);
        $phone = str_replace('+', '', $phone);
        $instagram = $request->instagram;
        $school = $request->school;
        // $email = $request->email;
        $city = $request->city;
        if (isset($request->dob)) {
            $dob = $request->dob;
            $dob = date("Y-m-d", $this->createTimestamp($dob));
        }
        // $additional_data = $request->additional_data;
        $event = $request->event;
        $lomba = $request->lomba;
        // END OF INIT DATA
        // VALIDATION START HERE
        $checking = false;
        // CHECK DATA
        // $customer_check = PII_Data::select('id')->where('phone', $phone)->first();
        // $event_id = Event::select('id', 'double_regis')->where('event_id', $event)->first();
        // VALIDATE DATA
        // if (!empty($customer_check)) {
        //     $checking = true;
        //     $final_check = Event_Activity::select('id')->where(array('event_id' => $event_id->id, 'pii_id' => $customer_check->id))->first();
        //     if (!empty($final_check) && $event_id->double_regis == FALSE) {
        //         return response($this->_returnresponse('Already Registered', array('code' => '99')), 200);
        //     }
        // }
        if (preg_match('~[0-9]+~', $name)) {
            return response($this->_returnresponse('Invalid Name', array('code' => '01')), 200);
        }
        if (!is_numeric($phone)) {
            return response($this->_returnresponse('Invalid Phone', array('code' => '02')), 200);
        }
        // if (!empty($email)) {
        //     if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        //         return response($this->_returnresponse('Invalid Email', array('code' => '03')), 200);
        //     }
        // }
        // if (is_array($additional_data)) {
        //     foreach ($additional_data as $addData) {
        //         if ($addData['required'] == true) {
        //             if ($addData['value'] == null || empty($addData['value'])) {
        //                 return response($this->_returnresponse('Invalid ' . $addData['column'], array('code' => '05')), 200);
        //             }
        //         }
        //     }
        // }
        // if (empty($event_id)) {
        //     return response($this->_returnresponse('Invalid event data', array('code' => '06')), 200);
        // }
        // END OF VALIDATION
        // INSERT PII DATABASE

        $PII_Insert = new PII_Data();
        $PII_Insert->name = $name;
        $PII_Insert->phone = $phone;
        $PII_Insert->school = $school;
        $PII_Insert->instagram = $instagram;
        $PII_Insert->lomba = $lomba;
        $PII_Insert->event = $event;
        // $PII_Insert->email = $email;
        $PII_Insert->city = $city;
        if (isset($request->dob)) {
            $PII_Insert->dob = $dob;
        }
        $PIIStatus = $PII_Insert->save();
        return response($this->_returnresponse('success', array('data' => $PIIStatus)), 200);

        // INSERT DOUBLE REGIS
        // if ($event_id->double_regis == TRUE) {
        //     if ($checking == true) {
        //         $customer_uuid = PII_Data::select('pii_uuid')->where('phone', $phone)->first();
        //         $PII_Insert->pii_uuid = $customer_uuid->pii_uuid;
        //         $PIIStatus = $PII_Insert->save();
        //         $consumer_id = $PII_Insert->id;
        //     } else {
        //         $PIIStatus = $PII_Insert->save();
        //         $consumer_id = $PII_Insert->id;
        //     }
        // } else {
        //     $PIIStatus = $PII_Insert->save();
        //     $consumer_id = $PII_Insert->id;
        // }

        // INSERT ADDITIONAL DATA INTO PII_
        // if (is_array($additional_data)) {
        //     foreach ($additional_data as $addData) {
        //         $AdditionalData_Insert = new Additional_Data();
        //         $AdditionalData_Insert->pii_id = $consumer_id;
        //         $AdditionalData_Insert->column = $addData['column'];
        //         $AdditionalData_Insert->value = $addData['value'];
        //         $AdditionalData_Insert->event_id = $event_id->id;
        //         $AdditionalData_Insert->save();
        //         $additionalStatus = $AdditionalData_Insert->save();
        //     }
        // }
        // //INSERT EVENT_ACTIVITY
        // $event = new Event_Activity();
        // $event->pii_id = $consumer_id;
        // $event->event_id = $event_id->id;
        // $event->activity = $request->activity['value'];
        // $event->save();
        // $customer_check = PII_Data::select('pii_uuid')->where('phone', $phone)->orderBy('created_at', 'DESC')->first();
        // return response($this->_returnresponse('success', array('data' => $customer_check->pii_uuid)), 200);
        // END INSERT ADDITIONAL DATA
    }

    // TODO: Change timestamp to desired timestamp
    public function createTimestamp($date)
    {
        $formats = ['d/m/Y', 'd-m-Y', 'd.m.Y', 'dmY', 'd/m/y', 'd-m-y', 'd.m.y', 'dmy'];
        foreach ($formats as $format) {
            $dateTime = \DateTime::createFromFormat($format, $date);
            if ($dateTime) {
                return $dateTime->getTimestamp();
            }
        }
        return strtotime($date);
    }

    // TODO: Get province
    public function _get_province(Request $request)
    {
        $param = $request->term;
        if ($param == NULL || empty($param)) {
            return array('results' => array(array('id' => '1', 'text' => 'Kabupaten Aceh Barat')));
        }
        $results = array(
            array('id' => '1', 'text' => 'Kabupaten Aceh Barat'),
            array('id' => '2', 'text' => 'Kabupaten Aceh Barat Daya'),
            array('id' => '3', 'text' => 'Kabupaten Aceh Besar'),
            array('id' => '4', 'text' => 'Kabupaten Aceh Jaya'),
            array('id' => '5', 'text' => 'Kabupaten Aceh Selatan'),
            array('id' => '6', 'text' => 'Kabupaten Aceh Singkil'),
            array('id' => '7', 'text' => 'Kabupaten Aceh Tamiang'),
            array('id' => '8', 'text' => 'Kabupaten Aceh Tengah'),
            array('id' => '9', 'text' => 'Kabupaten Aceh Tenggara'),
            array('id' => '10', 'text' => 'Kabupaten Aceh Timur'),
            array('id' => '11', 'text' => 'Kabupaten Aceh Utara'),
            array('id' => '12', 'text' => 'Kabupaten Bener Meriah'),
            array('id' => '13', 'text' => 'Kabupaten Bireuen'),
            array('id' => '14', 'text' => 'Kabupaten Gayo Lues'),
            array('id' => '15', 'text' => 'Kabupaten Nagan Raya'),
            array('id' => '16', 'text' => 'Kabupaten Pidie'),
            array('id' => '17', 'text' => 'Kabupaten Pidie Jaya'),
            array('id' => '18', 'text' => 'Kabupaten Simeulue'),
            array('id' => '19', 'text' => 'Kota Banda Aceh'),
            array('id' => '20', 'text' => 'Kota Langsa'),
            array('id' => '21', 'text' => 'Kota Lhokseumawe'),
            array('id' => '22', 'text' => 'Kota Sabang'),
            array('id' => '23', 'text' => 'Kota Subulussalam'),
            array('id' => '24', 'text' => 'Kabupaten Badung'),
            array('id' => '25', 'text' => 'Kabupaten Bangil'),
            array('id' => '26', 'text' => 'Kabupaten Buleleng'),
            array('id' => '27', 'text' => 'Kabupaten Gianyar'),
            array('id' => '28', 'text' => 'Kabupaten Jembrana'),
            array('id' => '29', 'text' => 'Kabupaten Karangasem'),
            array('id' => '30', 'text' => 'Kabupaten Klungkung'),
            array('id' => '31', 'text' => 'Kabupaten Tabanan'),
            array('id' => '32', 'text' => 'Kota Denpasar'),
            array('id' => '33', 'text' => 'Kabupaten Lebak'),
            array('id' => '34', 'text' => 'Kabupaten Pandeglang'),
            array('id' => '35', 'text' => 'Kabupaten Serang'),
            array('id' => '36', 'text' => 'Kabupaten Tangerang'),
            array('id' => '37', 'text' => 'Kota Cilegon'),
            array('id' => '38', 'text' => 'Kota Serang'),
            array('id' => '39', 'text' => 'Kota Tangerang'),
            array('id' => '40', 'text' => 'Kota Tangerang selatan'),
            array('id' => '41', 'text' => 'Kabupaten Bengkulu Selatan'),
            array('id' => '42', 'text' => 'Kabupaten Bemgkulu Tengah'),
            array('id' => '43', 'text' => 'Kabupaten Bengkulu Utara'),
            array('id' => '44', 'text' => 'Kabupaten Kaur'),
            array('id' => '45', 'text' => 'Kabupaten kapahiang'),
            array('id' => '46', 'text' => 'Kabupaten Lebong'),
            array('id' => '47', 'text' => 'Kabupaten Mukomuko'),
            array('id' => '48', 'text' => 'Kabupaten Rejang Lebong'),
            array('id' => '49', 'text' => 'Kabupaten seluma'),
            array('id' => '50', 'text' => 'Kota Bengkulu'),
            array('id' => '51', 'text' => 'Kabupaten Bantul'),
            array('id' => '52', 'text' => 'Kabupaten Gunung kildul'),
            array('id' => '53', 'text' => 'Kabupaten Kulon Progo'),
            array('id' => '54', 'text' => 'Kabupaten Sleman'),
            array('id' => '55', 'text' => 'Kota Yogyakarta'),
            array('id' => '56', 'text' => 'Kabupaten Kepulauan Seribu'),
            array('id' => '57', 'text' => 'Kota Jakarta Barat'),
            array('id' => '58', 'text' => 'Kota Jakarta Pusat'),
            array('id' => '59', 'text' => 'Kota Jakarta Selatan'),
            array('id' => '60', 'text' => 'Kota Jakarta Timur'),
            array('id' => '61', 'text' => 'Kota Jakarta Utara'),
            array('id' => '62', 'text' => 'Kabupaten Boalemo'),
            array('id' => '63', 'text' => 'Kabupaten Bone Bolango'),
            array('id' => '64', 'text' => 'Kabupaten Gorontalo'),
            array('id' => '65', 'text' => 'Kabupaten Gorontalo Utara'),
            array('id' => '66', 'text' => 'Kabupaten Pahuwato'),
            array('id' => '67', 'text' => 'Kota Gorontalo'),
            array('id' => '68', 'text' => 'Kabupaten Batanghari'),
            array('id' => '69', 'text' => 'Kabupaten Bungo'),
            array('id' => '70', 'text' => 'Kabupaten Kerinci'),
            array('id' => '71', 'text' => 'Kabupaten Merangin'),
            array('id' => '72', 'text' => 'Kabupaten Muaro Jambi'),
            array('id' => '73', 'text' => 'Kabupaten Sarolangun'),
            array('id' => '74', 'text' => 'Kabupaten Tanjung Jabung Barat'),
            array('id' => '75', 'text' => 'Kabupaten Tanjung Jabung Timur'),
            array('id' => '76', 'text' => 'Kabupaten Tebo'),
            array('id' => '77', 'text' => 'Kota Jambi'),
            array('id' => '78', 'text' => 'Kota Sungai Penuh'),
            array('id' => '79', 'text' => 'Kabupaten Bandung'),
            array('id' => '80', 'text' => 'Kabupaten Bandung Barat'),
            array('id' => '81', 'text' => 'Kabupaten Bekasi'),
            array('id' => '82', 'text' => 'Kabupaten Bogor'),
            array('id' => '83', 'text' => 'Kabupaten Ciamis'),
            array('id' => '84', 'text' => 'Kabupaten Cianjur'),
            array('id' => '85', 'text' => 'Kabupaten Cirebon'),
            array('id' => '86', 'text' => 'Kabupaten Garut'),
            array('id' => '87', 'text' => 'Kabupaten Indramayu'),
            array('id' => '88', 'text' => 'Kabupaten Karawang'),
            array('id' => '89', 'text' => 'Kabupaten Kuningan'),
            array('id' => '90', 'text' => 'Kabupaten Majalengka'),
            array('id' => '91', 'text' => 'Kabupaten Pangandaran'),
            array('id' => '92', 'text' => 'Kabupaten Purwakarta'),
            array('id' => '93', 'text' => 'Kabupaten Subang'),
            array('id' => '94', 'text' => 'Kabupaten Sukabumi'),
            array('id' => '95', 'text' => 'Kabupaten Sumedang'),
            array('id' => '96', 'text' => 'Kabupaten Tasikmalaya'),
            array('id' => '97', 'text' => 'Kota Bandung'),
            array('id' => '98', 'text' => 'Kota Banjar'),
            array('id' => '99', 'text' => 'Kota Bekasi'),
            array('id' => '100', 'text' => 'Kota Bogor'),
            array('id' => '101', 'text' => 'Kota Cimahi'),
            array('id' => '102', 'text' => 'Kota Cirebon'),
            array('id' => '103', 'text' => 'Kota Depok'),
            array('id' => '104', 'text' => 'Kota Sukabumi'),
            array('id' => '105', 'text' => 'Kota Tasikmalaya'),
            array('id' => '106', 'text' => 'Kabupaten Banjarnegara'),
            array('id' => '107', 'text' => 'Kabupaten Banyumas'),
            array('id' => '108', 'text' => 'Kabupaten Batang'),
            array('id' => '109', 'text' => 'Kabupaten Blora'),
            array('id' => '110', 'text' => 'Kabupaten Boyolali'),
            array('id' => '111', 'text' => 'Kabupaten Brebes'),
            array('id' => '112', 'text' => 'Kabupaten Cilacap'),
            array('id' => '113', 'text' => 'Kabupaten Demak'),
            array('id' => '114', 'text' => 'Kabupaten Grobogan'),
            array('id' => '115', 'text' => 'Kabupaten Jepara'),
            array('id' => '116', 'text' => 'Kabupaten Karanganyar'),
            array('id' => '117', 'text' => 'Kabupaten Kebumen'),
            array('id' => '118', 'text' => 'Kabupaten Kendal'),
            array('id' => '119', 'text' => 'Kabupaten Klaten'),
            array('id' => '120', 'text' => 'Kabupaten Kudus'),
            array('id' => '121', 'text' => 'Kabupaten Magelang'),
            array('id' => '122', 'text' => 'Kabupaten Pati'),
            array('id' => '123', 'text' => 'Kabupaten Pekalongan'),
            array('id' => '124', 'text' => 'Kabupaten Pemalang'),
            array('id' => '125', 'text' => 'Kabupaten Purbalingga'),
            array('id' => '126', 'text' => 'Kabupaten Purworejo'),
            array('id' => '127', 'text' => 'Kabupaten Rembang'),
            array('id' => '128', 'text' => 'Kabupaten Semarang'),
            array('id' => '129', 'text' => 'Kabupaten Sragen'),
            array('id' => '130', 'text' => 'Kabupaten Sukoharjo'),
            array('id' => '131', 'text' => 'Kabupaten Tegal'),
            array('id' => '132', 'text' => 'Kabupaten Temanggung'),
            array('id' => '133', 'text' => 'Kabupaten Wonogiri'),
            array('id' => '134', 'text' => 'Kabupaten Wonosobo'),
            array('id' => '135', 'text' => 'Kota Magelang'),
            array('id' => '136', 'text' => 'Kota Pekalongan'),
            array('id' => '137', 'text' => 'Kota Salatiga'),
            array('id' => '138', 'text' => 'Kota Semarang'),
            array('id' => '139', 'text' => 'Kota Surakarta'),
            array('id' => '140', 'text' => 'Kota Tegal'),
            array('id' => '141', 'text' => 'Kabupaten Bangkalan'),
            array('id' => '142', 'text' => 'Kabupaten Banyuwangi'),
            array('id' => '143', 'text' => 'Kabupaten Blitar'),
            array('id' => '144', 'text' => 'Kabupaten Bojonegoro'),
            array('id' => '145', 'text' => 'Kabupaten Bondowoso'),
            array('id' => '146', 'text' => 'Kabupaten Gresik'),
            array('id' => '147', 'text' => 'Kabupaten Jember'),
            array('id' => '148', 'text' => 'Kabupaten Jombang'),
            array('id' => '149', 'text' => 'Kabupaten Kediri'),
            array('id' => '150', 'text' => 'Kabupaten Lamongan'),
            array('id' => '151', 'text' => 'Kabupaten Lumajang'),
            array('id' => '152', 'text' => 'Kabupaten Madiun'),
            array('id' => '153', 'text' => 'Kabupaten Magetan'),
            array('id' => '154', 'text' => 'Kabupaten Malang'),
            array('id' => '155', 'text' => 'Kabupaten Mojokerto'),
            array('id' => '156', 'text' => 'Kabupaten Nganjuk'),
            array('id' => '157', 'text' => 'Kabupaten Ngawi'),
            array('id' => '158', 'text' => 'Kabupaten Pacitan'),
            array('id' => '159', 'text' => 'Kabupaten Pamekasan'),
            array('id' => '160', 'text' => 'Kabupaten Pasuruan'),
            array('id' => '161', 'text' => 'Kabupaten Ponorogo'),
            array('id' => '162', 'text' => 'Kabupaten Probolinggo'),
            array('id' => '163', 'text' => 'Kabupaten Sampang'),
            array('id' => '164', 'text' => 'Kabupaten Sidoarjo'),
            array('id' => '165', 'text' => 'Kabupaten Situbondo'),
            array('id' => '166', 'text' => 'Kabupaten Sumenep'),
            array('id' => '167', 'text' => 'Kabupaten Trenggalek'),
            array('id' => '168', 'text' => 'Kabupaten Tuban'),
            array('id' => '169', 'text' => 'Kabupaten Tulungagung'),
            array('id' => '170', 'text' => 'Kota Batu'),
            array('id' => '171', 'text' => 'Kota Blitar'),
            array('id' => '172', 'text' => 'Kota Kediri'),
            array('id' => '173', 'text' => 'Kota Madiun'),
            array('id' => '174', 'text' => 'Kota Malang'),
            array('id' => '175', 'text' => 'Kota Mojokerto'),
            array('id' => '176', 'text' => 'Kota Pasuruan'),
            array('id' => '177', 'text' => 'Kota Probolinggo'),
            array('id' => '178', 'text' => 'Kota Surabaya'),
            array('id' => '179', 'text' => 'Kabupaten Bengkayang'),
            array('id' => '180', 'text' => 'Kabupaten Kapuas Hulu'),
            array('id' => '181', 'text' => 'Kabupaten Kayong Utara'),
            array('id' => '182', 'text' => 'Kabupaten Ketapang'),
            array('id' => '183', 'text' => 'Kabupaten Kubu Raya'),
            array('id' => '184', 'text' => 'Kabupaten Landak'),
            array('id' => '185', 'text' => 'Kabupaten Melawi'),
            array('id' => '186', 'text' => 'Kabupaten Pontianak'),
            array('id' => '187', 'text' => 'Kabupaten Sambas'),
            array('id' => '188', 'text' => 'Kabupaten Sanggau'),
            array('id' => '189', 'text' => 'Kabupaten Sekadau'),
            array('id' => '190', 'text' => 'Kabupaten Sintang'),
            array('id' => '191', 'text' => 'Kota Pontianak'),
            array('id' => '192', 'text' => 'Kota Singkawang'),
            array('id' => '193', 'text' => 'Kabupaten Balangan'),
            array('id' => '194', 'text' => 'Kabupaten Banjar'),
            array('id' => '195', 'text' => 'Kabupaten Barito Kuala'),
            array('id' => '196', 'text' => 'Kabupaten Hulu Sungai Selatan'),
            array('id' => '197', 'text' => 'Kabupaten Hulu Sungai Tengah'),
            array('id' => '198', 'text' => 'Kabupaten Hulu Sungai Utara'),
            array('id' => '199', 'text' => 'Kabupaten Kotabaru'),
            array('id' => '200', 'text' => 'Kabupaten Tabalong'),
            array('id' => '201', 'text' => 'Kabupaten Tanah Bumbu'),
            array('id' => '202', 'text' => 'Kabupaten Tanah Laut'),
            array('id' => '203', 'text' => 'Kabupaten Tapin'),
            array('id' => '204', 'text' => 'Kota Banjarbaru'),
            array('id' => '205', 'text' => 'Kota Banjarmasin'),
            array('id' => '206', 'text' => 'Kabupaten Barito Selatan'),
            array('id' => '207', 'text' => 'Kabupaten Barito Timur'),
            array('id' => '208', 'text' => 'Kabupaten Barito Utara'),
            array('id' => '209', 'text' => 'Kabupaten Gunung Mas'),
            array('id' => '210', 'text' => 'Kabupaten Kapuas'),
            array('id' => '211', 'text' => 'Kabupaten Katingan'),
            array('id' => '212', 'text' => 'Kabupaten Kotawaringin Barat'),
            array('id' => '213', 'text' => 'Kabupaten Kotawaringin Timur'),
            array('id' => '214', 'text' => 'Kabupaten Lamandau'),
            array('id' => '215', 'text' => 'Kabupaten Murung Raya'),
            array('id' => '216', 'text' => 'Kabupaten Pulang Pisau'),
            array('id' => '217', 'text' => 'Kabupaten Sukamara'),
            array('id' => '218', 'text' => 'Kabupaten Seruyan'),
            array('id' => '219', 'text' => 'Kota Palangka Raya'),
            array('id' => '220', 'text' => 'Kabupaten Berau'),
            array('id' => '221', 'text' => 'Kabupaten Kutai Barat'),
            array('id' => '222', 'text' => 'Kabupaten Kutai Kartanegara'),
            array('id' => '223', 'text' => 'Kabupaten Kutai Timur'),
            array('id' => '224', 'text' => 'Kabupaten Paser'),
            array('id' => '225', 'text' => 'Kabupaten Penajam Paser Utara'),
            array('id' => '226', 'text' => 'Kabupaten Mahakam Ulu'),
            array('id' => '227', 'text' => 'Kota Balikpapan'),
            array('id' => '228', 'text' => 'Kota Bontang'),
            array('id' => '229', 'text' => 'Kota Samarinda'),
            array('id' => '230', 'text' => 'Kabupaten Bulungan'),
            array('id' => '231', 'text' => 'Kabupaten Malinau'),
            array('id' => '232', 'text' => 'Kabupaten Nunukan'),
            array('id' => '233', 'text' => 'Kabupaten Tana Tidung'),
            array('id' => '234', 'text' => 'Kota Tarakan'),
            array('id' => '235', 'text' => 'Kabupaten Bangka'),
            array('id' => '236', 'text' => 'Kabupaten Bangka Barat'),
            array('id' => '237', 'text' => 'Kabupaten Bangka Selatan'),
            array('id' => '238', 'text' => 'Kabupaten Bangka Tengah'),
            array('id' => '239', 'text' => 'Kabupaten Belitung'),
            array('id' => '240', 'text' => 'Kabupaten Belitung Timur'),
            array('id' => '241', 'text' => 'Kota Pangkal Pinang'),
            array('id' => '242', 'text' => 'Kabupaten Bintan'),
            array('id' => '243', 'text' => 'Kabupaten Karimun'),
            array('id' => '244', 'text' => 'Kabupaten Kepulauan Anambas'),
            array('id' => '245', 'text' => 'Kabupaten Lingga'),
            array('id' => '246', 'text' => 'Kabupaten Natuna'),
            array('id' => '247', 'text' => 'Kota Batam'),
            array('id' => '248', 'text' => 'Kota Tanjung Pinang'),
            array('id' => '249', 'text' => 'Kabupaten Lampung Barat'),
            array('id' => '250', 'text' => 'Kabupaten Lampung Selatan'),
            array('id' => '251', 'text' => 'Kabupaten Lampung Tengah'),
            array('id' => '252', 'text' => 'Kabupaten Lampung Timur'),
            array('id' => '253', 'text' => 'Kabupaten Lampung Utara'),
            array('id' => '254', 'text' => 'Kabupaten Mesuji'),
            array('id' => '255', 'text' => 'Kabupaten Pesawaran'),
            array('id' => '256', 'text' => 'Kabupaten Pringsewu'),
            array('id' => '257', 'text' => 'Kabupaten Tanggamus'),
            array('id' => '258', 'text' => 'Kabupaten Tulang Bawang'),
            array('id' => '259', 'text' => 'Kabupaten Tulang Bawang Barat'),
            array('id' => '260', 'text' => 'Kabupaten Way Kanan'),
            array('id' => '261', 'text' => 'Kabupaten Pesisir Barat'),
            array('id' => '262', 'text' => 'Kota Bandar Lampung'),
            array('id' => '263', 'text' => 'Kota Kotabumi'),
            array('id' => '264', 'text' => 'Kota Liwa'),
            array('id' => '265', 'text' => 'Kota Metro'),
            array('id' => '266', 'text' => 'Kabupaten Buru'),
            array('id' => '267', 'text' => 'Kabupaten Buru Selatan'),
            array('id' => '268', 'text' => 'Kabupaten Kepulauan Aru'),
            array('id' => '269', 'text' => 'Kabupaten Maluku Barat Daya'),
            array('id' => '270', 'text' => 'Kabupaten Maluku Tengah'),
            array('id' => '271', 'text' => 'Kabupaten Maluku Tenggara'),
            array('id' => '272', 'text' => 'Kabupaten Maluku Tenggara Barat'),
            array('id' => '273', 'text' => 'Kabupaten Seram Bagian Barat'),
            array('id' => '274', 'text' => 'Kabupaten Seram Bagian Timur'),
            array('id' => '275', 'text' => 'Kota Ambon'),
            array('id' => '276', 'text' => 'Kota Tual'),
            array('id' => '277', 'text' => 'Kabupaten Halmahera Barat'),
            array('id' => '278', 'text' => 'Kabupaten Halmahera Tengah'),
            array('id' => '279', 'text' => 'Kabupaten Halmahera Utara'),
            array('id' => '280', 'text' => 'Kabupaten Halmahera Selatan'),
            array('id' => '281', 'text' => 'Kabupaten Halmahera Timur'),
            array('id' => '282', 'text' => 'Kabupaten Kepulauan Sula'),
            array('id' => '283', 'text' => 'Kabupaten Pulau Morotai'),
            array('id' => '284', 'text' => 'Kabupaten Pulau Taliabu'),
            array('id' => '285', 'text' => 'Kota Ternate'),
            array('id' => '286', 'text' => 'Kota Tidore Kepulauan'),
            array('id' => '287', 'text' => 'Kabupaten Bima'),
            array('id' => '288', 'text' => 'Kabupaten Dompu'),
            array('id' => '289', 'text' => 'Kabupaten Lombok Barat'),
            array('id' => '290', 'text' => 'Kabupaten Lombok Tengah'),
            array('id' => '291', 'text' => 'Kabupaten Lombok Timur'),
            array('id' => '292', 'text' => 'Kabupaten Lombok Utara'),
            array('id' => '293', 'text' => 'Kabupaten Sumbawa'),
            array('id' => '294', 'text' => 'Kabupaten Sumbawa Barat'),
            array('id' => '295', 'text' => 'Kota Bima'),
            array('id' => '296', 'text' => 'Kota Mataram'),
            array('id' => '297', 'text' => 'Kabupaten Alor'),
            array('id' => '298', 'text' => 'Kabupaten Belu'),
            array('id' => '299', 'text' => 'Kabupaten Ende'),
            array('id' => '300', 'text' => 'Kabupaten Flores Timur'),
            array('id' => '301', 'text' => 'Kabupaten Kupang'),
            array('id' => '302', 'text' => 'Kabupaten Lembata'),
            array('id' => '303', 'text' => 'Kabupaten Manggarai'),
            array('id' => '304', 'text' => 'Kabupaten Manggarai Barat'),
            array('id' => '305', 'text' => 'Kabupaten Manggarai Timur'),
            array('id' => '306', 'text' => 'Kabupaten Ngada'),
            array('id' => '307', 'text' => 'Kabupaten Nagekeo'),
            array('id' => '308', 'text' => 'Kabupaten Rote Ndao'),
            array('id' => '309', 'text' => 'Kabupaten Sabu Raijua'),
            array('id' => '310', 'text' => 'Kabupaten Sikka'),
            array('id' => '311', 'text' => 'Kabupaten Sumba Barat'),
            array('id' => '312', 'text' => 'Kabupaten Sumba Barat Daya'),
            array('id' => '313', 'text' => 'Kabupaten Sumba Tengah'),
            array('id' => '314', 'text' => 'Kabupaten Sumba Timur'),
            array('id' => '315', 'text' => 'Kabupaten Timor Tengah Selatan'),
            array('id' => '316', 'text' => 'Kabupaten Timor Tengah Utara'),
            array('id' => '317', 'text' => 'Kota Kupang'),
            array('id' => '318', 'text' => 'Kabupaten Asmat'),
            array('id' => '319', 'text' => 'Kabupaten Biak Numfor'),
            array('id' => '320', 'text' => 'Kabupaten Boven Digoel'),
            array('id' => '321', 'text' => 'Kabupaten Deiyai'),
            array('id' => '322', 'text' => 'Kabupaten Dogiyai'),
            array('id' => '323', 'text' => 'Kabupaten Intan Jaya'),
            array('id' => '324', 'text' => 'Kabupaten Jayapura'),
            array('id' => '325', 'text' => 'Kabupaten Jayawijaya'),
            array('id' => '326', 'text' => 'Kabupaten Keerom'),
            array('id' => '327', 'text' => 'Kabupaten Kepulauan Yapen'),
            array('id' => '328', 'text' => 'Kabupaten Lanny Jaya'),
            array('id' => '329', 'text' => 'Kabupaten Mamberamo Raya'),
            array('id' => '330', 'text' => 'Kabupaten Mamberamo Tengah'),
            array('id' => '331', 'text' => 'Kabupaten Mappi'),
            array('id' => '332', 'text' => 'Kabupaten Merauke'),
            array('id' => '333', 'text' => 'Kabupaten Mimika'),
            array('id' => '334', 'text' => 'Kabupaten Nabire'),
            array('id' => '335', 'text' => 'Kabupaten Nduga'),
            array('id' => '336', 'text' => 'Kabupaten Paniai'),
            array('id' => '337', 'text' => 'Kabupaten Pegunungan Bintang'),
            array('id' => '338', 'text' => 'Kabupaten Puncak'),
            array('id' => '339', 'text' => 'Kabupaten Puncak Jaya'),
            array('id' => '340', 'text' => 'Kabupaten Sarmi'),
            array('id' => '341', 'text' => 'Kabupaten Supiori'),
            array('id' => '342', 'text' => 'Kabupaten Tolikara'),
            array('id' => '343', 'text' => 'Kabupaten Waropen'),
            array('id' => '344', 'text' => 'Kabupaten Yahukimo'),
            array('id' => '345', 'text' => 'Kabupaten Yalimo'),
            array('id' => '346', 'text' => 'Kota Jayapura'),
            array('id' => '347', 'text' => 'Kabupaten Fakfak'),
            array('id' => '348', 'text' => 'Kabupaten Kaimana'),
            array('id' => '349', 'text' => 'Kabupaten Manokwari'),
            array('id' => '350', 'text' => 'Kabupaten Manokwari Selatan'),
            array('id' => '351', 'text' => 'Kabupaten Maybrat'),
            array('id' => '352', 'text' => 'Kabupaten Pegunungan Arfak'),
            array('id' => '353', 'text' => 'Kabupaten Raja Ampat'),
            array('id' => '354', 'text' => 'Kabupaten Sorong'),
            array('id' => '355', 'text' => 'Kabupaten Sorong Selatan'),
            array('id' => '356', 'text' => 'Kabupaten Tambrauw'),
            array('id' => '357', 'text' => 'Kabupaten Teluk Bintuni'),
            array('id' => '358', 'text' => 'Kabupaten Teluk Wondama'),
            array('id' => '360', 'text' => 'Kota Sorong'),
            array('id' => '361', 'text' => 'Kabupaten Bengkalis'),
            array('id' => '362', 'text' => 'Kabupaten Indragiri Hilir'),
            array('id' => '363', 'text' => 'Kabupaten Indragiri Hulu'),
            array('id' => '364', 'text' => 'Kabupaten Kampar'),
            array('id' => '365', 'text' => 'Kabupaten Kuantan Singingi'),
            array('id' => '366', 'text' => 'Kabupaten Pelalawan'),
            array('id' => '367', 'text' => 'Kabupaten Rokan Hilir'),
            array('id' => '368', 'text' => 'Kabupaten Rokan Hulu'),
            array('id' => '369', 'text' => 'Kabupaten Siak'),
            array('id' => '370', 'text' => 'Kabupaten Kepulauan Meranti'),
            array('id' => '371', 'text' => 'Kota Dumai'),
            array('id' => '372', 'text' => 'Kota Pekanbaru'),
            array('id' => '373', 'text' => 'Kabupaten Majene'),
            array('id' => '374', 'text' => 'Kabupaten Mamasa'),
            array('id' => '375', 'text' => 'Kabupaten Mamuju'),
            array('id' => '376', 'text' => 'Kabupaten Mamuju Utara'),
            array('id' => '377', 'text' => 'Kabupaten Polewali Mandar'),
            array('id' => '378', 'text' => 'Kabupaten Mamuju Tengah'),
            array('id' => '379', 'text' => 'Kabupaten Bantaeng'),
            array('id' => '380', 'text' => 'Kabupaten Barru'),
            array('id' => '381', 'text' => 'Kabupaten Bone Watampone'),
            array('id' => '382', 'text' => 'Kabupaten Bulukumba'),
            array('id' => '383', 'text' => 'Kabupaten Enrekang'),
            array('id' => '384', 'text' => 'Kabupaten Gowa'),
            array('id' => '385', 'text' => 'Kabupaten Jeneponto'),
            array('id' => '386', 'text' => 'Kabupaten Kepulauan Selayar'),
            array('id' => '387', 'text' => 'Kabupaten Luwu'),
            array('id' => '388', 'text' => 'Kabupaten Luwu Timur'),
            array('id' => '389', 'text' => 'Kabupaten Luwu Utara'),
            array('id' => '390', 'text' => 'Kabupaten Maros'),
            array('id' => '391', 'text' => 'Kabupaten Pangkajene dan Kepulauan'),
            array('id' => '392', 'text' => 'Kabupaten Pinrang'),
            array('id' => '393', 'text' => 'Kabupaten Sidenreng Rappang'),
            array('id' => '394', 'text' => 'Kabupaten Sinjai'),
            array('id' => '395', 'text' => 'Kabupaten Soppeng'),
            array('id' => '396', 'text' => 'Kabupaten Takalar'),
            array('id' => '397', 'text' => 'Kabupaten Tana Toraja'),
            array('id' => '398', 'text' => 'Kabupaten Toraja Utara'),
            array('id' => '399', 'text' => 'Kabupaten Wajo'),
            array('id' => '400', 'text' => 'Kota Makassar'),
            array('id' => '401', 'text' => 'Kota Palopo'),
            array('id' => '402', 'text' => 'Kota Parepare'),
            array('id' => '403', 'text' => 'Kabupaten Banggai'),
            array('id' => '404', 'text' => 'Kabupaten Banggai Kepulauan'),
            array('id' => '405', 'text' => 'Kabupaten Banggai Laut'),
            array('id' => '406', 'text' => 'Kabupaten Buol'),
            array('id' => '407', 'text' => 'Kabupaten Donggala'),
            array('id' => '408', 'text' => 'Kabupaten Morowali'),
            array('id' => '409', 'text' => 'Kabupaten Parigi Moutong'),
            array('id' => '410', 'text' => 'Kabupaten Poso'),
            array('id' => '411', 'text' => 'Kabupaten Sigi'),
            array('id' => '412', 'text' => 'Kabupaten Tojo Una-Una'),
            array('id' => '413', 'text' => 'Kabupaten Tolitoli'),
            array('id' => '414', 'text' => 'Kota Palu'),
            array('id' => '415', 'text' => 'Kabupaten Bombana'),
            array('id' => '416', 'text' => 'Kabupaten Buton'),
            array('id' => '417', 'text' => 'Kabupaten Buton Utara'),
            array('id' => '418', 'text' => 'Kabupaten Kolaka'),
            array('id' => '419', 'text' => 'Kabupaten Kolaka Timur'),
            array('id' => '420', 'text' => 'Kabupaten Kolaka Utara'),
            array('id' => '421', 'text' => 'Kabupaten Konawe'),
            array('id' => '422', 'text' => 'Kabupaten Konawe Selatan'),
            array('id' => '423', 'text' => 'Kabupaten Konawe Utara'),
            array('id' => '424', 'text' => 'Kabupaten Konawe Kepulauan'),
            array('id' => '425', 'text' => 'Kabupaten Muna'),
            array('id' => '426', 'text' => 'Kabupaten Wakatobi'),
            array('id' => '427', 'text' => 'Kota Bau-Bau'),
            array('id' => '428', 'text' => 'Kota Kendari'),
            array('id' => '429', 'text' => 'Kabupaten Bolaang Mongondow'),
            array('id' => '430', 'text' => 'Kabupaten Bolaang Mongondow Selatan'),
            array('id' => '431', 'text' => 'Kabupaten Bolaang Mongondow Timur'),
            array('id' => '432', 'text' => 'Kabupaten Bolaang Mongondow Utara'),
            array('id' => '433', 'text' => 'Kabupaten Kepulauan Sangihe'),
            array('id' => '434', 'text' => 'Kabupaten Kepulauan Siau Tagulandang Biaro'),
            array('id' => '435', 'text' => 'Kabupaten Kepulauan Talaud'),
            array('id' => '436', 'text' => 'Kabupaten Minahasa'),
            array('id' => '437', 'text' => 'Kabupaten Minahasa Selatan'),
            array('id' => '438', 'text' => 'Kabupaten Minahasa Tenggara'),
            array('id' => '439', 'text' => 'Kabupaten Minahasa Utara'),
            array('id' => '440', 'text' => 'Kota Bitung'),
            array('id' => '441', 'text' => 'Kota Kotamobagu'),
            array('id' => '442', 'text' => 'Kota Manado'),
            array('id' => '443', 'text' => 'Kota Tomohon'),
            array('id' => '444', 'text' => 'Kabupaten Agam'),
            array('id' => '445', 'text' => 'Kabupaten Dharmasraya'),
            array('id' => '446', 'text' => 'Kabupaten Kepulauan Mentawai'),
            array('id' => '447', 'text' => 'Kabupaten Lima Puluh Kota'),
            array('id' => '448', 'text' => 'Kabupaten Padang Pariaman'),
            array('id' => '449', 'text' => 'Kabupaten Pasaman'),
            array('id' => '450', 'text' => 'Kabupaten Pasaman Barat'),
            array('id' => '451', 'text' => 'Kabupaten Pesisir Selatan'),
            array('id' => '452', 'text' => 'Kabupaten Sijunjung'),
            array('id' => '453', 'text' => 'Kabupaten Solok'),
            array('id' => '454', 'text' => 'Kabupaten Solok Selatan'),
            array('id' => '455', 'text' => 'Kabupaten Tanah Datar'),
            array('id' => '456', 'text' => 'Kota Bukittinggi'),
            array('id' => '456', 'text' => 'Kota Padang'),
            array('id' => '457', 'text' => 'Kota Padangpanjang'),
            array('id' => '458', 'text' => 'Kota Pariaman'),
            array('id' => '459', 'text' => 'Kota Payakumbuh'),
            array('id' => '460', 'text' => 'Kota Sawahlunto'),
            array('id' => '461', 'text' => 'Kota Solok'),
            array('id' => '462', 'text' => 'Kabupaten Banyuasin'),
            array('id' => '463', 'text' => 'Kabupaten Empat Lawang'),
            array('id' => '464', 'text' => 'Kabupaten Lahat'),
            array('id' => '465', 'text' => 'Kabupaten Muara Enim'),
            array('id' => '466', 'text' => 'Kabupaten Musi Banyuasin'),
            array('id' => '467', 'text' => 'Kabupaten Musi Rawas'),
            array('id' => '468', 'text' => 'Kabupaten Ogan Ilir'),
            array('id' => '469', 'text' => 'Kabupaten Ogan Komering Ilir'),
            array('id' => '470', 'text' => 'Kabupaten Ogan Komering Ulu'),
            array('id' => '471', 'text' => 'Kabupaten Ogan Komering Ulu Selatan'),
            array('id' => '472', 'text' => 'Kabupaten Penukal Abab Lematang Ilir'),
            array('id' => '473', 'text' => 'Kabupaten Ogan Komering Ulu Timur'),
            array('id' => '474', 'text' => 'Kota Lubuklinggau'),
            array('id' => '475', 'text' => 'Kota Pagar Alam'),
            array('id' => '476', 'text' => 'Kota Palembang'),
            array('id' => '477', 'text' => 'Kota Prabumulih'),
            array('id' => '478', 'text' => 'Kabupaten Asahan'),
            array('id' => '479', 'text' => 'Kabupaten Batubara'),
            array('id' => '480', 'text' => 'Kabupaten Dairi'),
            array('id' => '481', 'text' => 'Kabupaten Deli Serdang'),
            array('id' => '482', 'text' => 'Kabupaten Humbang Hasundutan'),
            array('id' => '483', 'text' => 'Kabupaten Karo	Kabanjahe'),
            array('id' => '484', 'text' => 'Kabupaten Labuhanbatu'),
            array('id' => '485', 'text' => 'Kabupaten Labuhanbatu Selatan'),
            array('id' => '486', 'text' => 'Kabupaten Labuhanbatu Utara'),
            array('id' => '486', 'text' => 'Kabupaten Langkat'),
            array('id' => '487', 'text' => 'Kabupaten Mandailing Natal'),
            array('id' => '487', 'text' => 'Kabupaten Nias'),
            array('id' => '488', 'text' => 'Kabupaten Nias Barat'),
            array('id' => '489', 'text' => 'Kabupaten Nias Selatan'),
            array('id' => '490', 'text' => 'Kabupaten Nias Utara'),
            array('id' => '491', 'text' => 'Kabupaten Padang Lawas'),
            array('id' => '492', 'text' => 'Kabupaten Padang Lawas Utara'),
            array('id' => '493', 'text' => 'Kabupaten Pakpak Bharat'),
            array('id' => '494', 'text' => 'Kabupaten Samosir'),
            array('id' => '495', 'text' => 'Kabupaten Serdang Bedagai'),
            array('id' => '496', 'text' => 'Kabupaten Simalungun'),
            array('id' => '497', 'text' => 'Kabupaten Tapanuli Selatan'),
            array('id' => '498', 'text' => 'Kabupaten Tapanuli Tengah'),
            array('id' => '498', 'text' => 'Kabupaten Tapanuli Utara'),
            array('id' => '499', 'text' => 'Kabupaten Toba Samosir'),
            array('id' => '500', 'text' => 'Kota Binjai'),
            array('id' => '501', 'text' => 'Kota Gunungsitoli'),
            array('id' => '502', 'text' => 'Kota Medan'),
            array('id' => '503', 'text' => 'Kota Padangsidempuan'),
            array('id' => '504', 'text' => 'Kota Pematangsiantar'),
            array('id' => '505', 'text' => 'Kota Sibolga'),
            array('id' => '506', 'text' => 'Kota Tanjungbalai'),
            array('id' => '507', 'text' => 'Kota Tebing Tinggi')
        );

        foreach ($results as $arr) {
            if (strpos(strtolower($arr['text']), strtolower($param)) !== false) {
                return array('results' => array(array('id' => $arr['id'], 'text' => $arr['text'])));
            }
        }
    }
}
