<?php  
	
	/**
	* 
	*/
	include "libs/tpl.lib.php";//libreria para pintar el template

	class Login extends MY_Controller{
		//directorio de vistas
		private $dirVistas="./application/modules/login/views";
		//variable para asignar los valores del template
		private $tpl="";

		function __construct()
		{
			parent::__construct();
			$this->tpl = new Template($this->dirVistas);
			$this->load->model('login_model');
			$this->load->library(array('session','form_validation'));
			$this->load->helper(array('url','form'));
			$this->load->database('default');
		}

		function index(){//funcion inicial del controlador
			// $this->tpl->set_filenames(array('Login' => 'default'));
   //          $this->tpl->assign_vars(array(
   //              'TEST' => "Bienvenido a Codeigniter HMVC"
   //          ));
   //          $this->tpl->pparse('Login');
			switch ($this->session->userdata('perfil')) {
				case '':
					$data['token'] = $this->token();
					$data['titulo'] = 'Login - Proyectos';
					$this->load->view('login_view',$data);
					break;
				case '0':
					redirect(site_url().'/admin');
					break;
				case '1':
					redirect(site_url().'editor');
					break;
				default:
					$data['token'] = $this->token();
					$data['titulo'] = 'Login 2 con roles de usuario en codeigniter';
					$this->load->view('login_view',$data);
					break;		
			}
		}

		public function new_user(){
			if($this->input->post('token') && $this->input->post('token') == $this->session->userdata('token')){
	            $this->form_validation->set_rules('username', 'username', 'required|trim|min_length[2]|max_length[150]');
	            $this->form_validation->set_rules('password', 'password', 'required|trim|min_length[5]|max_length[150]');
	            //lanzamos mensajes de error si es que los hay
				if($this->form_validation->run() == FALSE){
					$this->index();
				}else{
					echo "Se valida el usuario";
					$username = $this->input->post('username');
					$password = sha1($this->input->post('password'));
					$check_user = $this->login_model->login_user($username,$password);
					if($check_user == TRUE){
						$data = array(
		                'is_logued_in' 	=> 		TRUE,
		                'id_usuario' 	=> 		$check_user->ID,
		                'perfil'		=>		$check_user->nivel_acceso,
		                'username' 		=> 		$check_user->usuario,
		                'nombre'		=>		$check_user->nombre,
		                'apaterno'		=>		$check_user->apaterno
	            		);
						$this->session->set_userdata($data);
						$this->index();
					}
				}
			}else{
				redirect(site_url().'/login');
			}
		}
	
		public function token(){
			$token = md5(uniqid(rand(),true));
			$this->session->set_userdata('token',$token);
			return $token;
		}
	
		public function logout_ci(){
			$this->session->sess_destroy();
			$this->index();
		}
	}
?>