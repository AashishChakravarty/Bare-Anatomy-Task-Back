<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Quiz extends REST_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('quiz_model');
    }

    public function questions_get()
    {
        $id = $this->input->get('id');
        $email =$this->input->get('email');
        if ($id && $email) {
            if ($this->validEmail($email)) {
                $question = $this->quiz_model->question($id);
                if ($question) {
                    $options = $this->quiz_model->options($question->id);
                    $question->options = $options;
                    $response = array(
                                    'status'    => true,
                                    'message'   => 'Successfully Question fetched',
                                    'data'  => $question
                                );
                    return $this->response($response, REST_Controller::HTTP_OK);
                } else {
                    $response = array(
                        'status'    => false,
                        'message'   => 'No Question Found'
                    );
                    return $this->response($response, REST_Controller::HTTP_OK);
                }               
            } else {
                $response = array(
                    'status'    => false,
                    'message'   => 'Something went to wrong'
                );
                return $this->response($response, REST_Controller::HTTP_BAD_REQUEST);
            }
        } else if ($email) {
            if ($this->validEmail($email)) {
                $question = $this->quiz_model->first_question();
                if ($question) {
                    $options = $this->quiz_model->options($question->id);
                    $question->options = $options;
                    $response = array(
                                    'status'    => true,
                                    'message'   => 'Successfully Question fetched',
                                    'data'  => $question
                                );
                    return $this->response($response, REST_Controller::HTTP_OK);
                } else {
                    $response = array(
                        'status'    => false,
                        'message'   => 'No Question Found'
                    );
                    return $this->response($response, REST_Controller::HTTP_OK);
                }               
            } else {
                $response = array(
                    'status'    => false,
                    'message'   => 'Something went to wrong'
                );
                return $this->response($response, REST_Controller::HTTP_BAD_REQUEST);
            }
            
        } else {
            $response = array(
                'status'    => false,
                'message'   => 'Something went to wrong'
            );
            return $this->response($response, REST_Controller::HTTP_BAD_REQUEST);
        }
    }

    public function answers_post()
    {
        $req_data = $this->post();
        $email = $req_data['email'];
        if ($this->validEmail($email)) {
            $data = array(
                'email' => $email
            );
            $insert_id = $this->quiz_model->submit_user($data);

            if ($insert_id) {
                $answers = $req_data['answers'];
                $submit_answers = array();
                foreach ($answers as $answer) {
                    $ans_arr = array(
                        'user_id' =>  $insert_id,
                        'question_id'=>$answer['id'],
                        'option_id' =>$answer['optionId']
                    );
                    if (isset($answer['other']))
                    {
                        $ans_arr['other_answer'] = $answer['other'];
                    } else {
                        $ans_arr['other_answer'] = '';
                    }
                    array_push($submit_answers, $ans_arr);
                }

                $result = $this->quiz_model->submit_answers($submit_answers);

                if ($result) {
                    $response = array(
                        'status'    => true,
                        'message'   => 'Sucessfully submited'
                    );
                    return $this->response($response, REST_Controller::HTTP_OK);
                } else {
                    $response = array(
                        'status'    => false,
                        'message'   => 'Something went to wrong'
                    );
                    return $this->response($response, REST_Controller::HTTP_OK);
                }
                
            } else {
                $response = array(
                    'status'    => false,
                    'message'   => 'Something went to wrong'
                );
                return $this->response($response, REST_Controller::HTTP_INTERNAL_SERVER_ERROR);
            }
            
        } else {
            $response = array(
                'status'    => false,
                'message'   => 'Something went to wrong'
            );
            return $this->response($response, REST_Controller::HTTP_BAD_REQUEST);
        }
    }

    function validEmail($email){
        $exp = "^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$^";
        if(preg_match($exp,trim($email))){
                return 1;
        }else{
            return 0;
        }    
    }
}
