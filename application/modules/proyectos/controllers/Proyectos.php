<?php  
	
	/**
	* 
	*/
	include "libs/tpl.lib.php";//libreria para pintar el template

	class Proyectos extends MY_Controller{
		//directorio de vistas
		private $dirVistas="./application/modules/proyectos/views";
		//variable para asignar los valores del template
		private $tpl="";

		function __construct()
		{
			parent::__construct();
			$this->tpl = new Template($this->dirVistas);
			$this->load->model('proyectos_model');
		}

		function index(){//funcion inicial del controlador
			$data['proyectos'] = $this->proyectos_model->getProyectos();
			echo "<pre>";
			print_r($data);
			echo "</pre>";
			$this->tpl->set_filenames(array('Proyectos' => 'proyectos'));
            $this->tpl->assign_vars(array(
                'TEST' => "Bienvenido a Codeigniter HMVC"
            ));
            $this->tpl->pparse('Proyectos');
		}
	}
?>