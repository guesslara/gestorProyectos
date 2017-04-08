<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
/**
 * 
 */
include "libs/tpl.lib.php";//libreria para pintar el template

class App extends CI_Controller {
	//directorio de vistas
	private $dirVistas="./application/modules/app/views";
	//variable para asignar los valores del template
	private $tpl="";
	private $dirPublico="dist";
	
	public function __construct() {
		parent::__construct();
		$this->tpl = new Template($this->dirVistas);
		$this->load->library(array('session'));
		$this->load->helper(array('url'));
	}
	
	public function index(){
		if(($this->session->userdata('is_logued_in') == FALSE) || ($this->session->userdata('perfil') != '0'))
		{
			redirect(base_url().'login');
		}
		$data['titulo'] = 'Bienvenido Administrador';
		$data['nombre'] = $this->session->userdata("nombre");
		$data['apaterno'] = $this->session->userdata("apaterno");
		//$this->load->view('admin_view',$data);


		$this->dirPublico=base_url()."dist";
		$this->tpl->assign_vars(array(
        	'DIR_MOD'   => $this->dirPublico,
        	'DIR_VIEW'  => $this->dirVistas,
        	'URL'		=> base_url(),
            'NOMBRE'	=> $this->session->userdata("nombre"),
			'APATERNO'  => $this->session->userdata("apaterno"),
			'USUARIO'	=> $this->session->userdata("username")
        ));
        $this->renderTemplate("App","app_view");
	}

	/**
	 * @parser nombre del archivo sin extension php
	 * @plantilla nombre de la plantilla sin extension dwt
	 */
	private function renderTemplate($parser,$plantilla){
		$this->tpl->set_filenames(array($parser => $plantilla));
		$this->tpl->pparse($parser);
	}
}