<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
/**
 * 
 */
class Admin extends CI_Controller {
	
	public function __construct() {
		parent::__construct();
		$this->load->library(array('session'));
		$this->load->helper(array('url'));
	}
	
	public function index()
	{
		if(($this->session->userdata('is_logued_in') == FALSE) || ($this->session->userdata('perfil') != '0'))
		{
			redirect(base_url().'login');
		}
		$data['titulo'] = 'Bienvenido Administrador';
		$data['nombre'] = $this->session->userdata("nombre");
		$data['apaterno'] = $this->session->userdata("apaterno");
		$this->load->view('admin_view',$data);
	}
}