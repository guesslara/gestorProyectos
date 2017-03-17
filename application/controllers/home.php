<?php
	class Home extends CI_Controller{

		public function index(){
            $data = array("title" => "Home","mensaje"=>"Hola mundo desde codeigniter");
			$this->load->view("home",$data);
		}
	}
?>