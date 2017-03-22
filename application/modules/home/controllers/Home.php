<?php  
	
	/**
	* 
	*/
	include "libs/tpl.lib.php";//libreria para pintar el template

	class Home extends MY_Controller{
		//directorio de vistas
		private $dirVistas="./application/modules/home/views";
		//variable para asignar los valores del template
		private $tpl="";

		function __construct()
		{
			parent::__construct();
			$this->tpl = new Template($this->dirVistas);
		}

		function index(){//funcion inicial del controlador
			$this->tpl->set_filenames(array('Home' => 'default'));
            $this->tpl->assign_vars(array(
                'TEST' => "Bienvenido a Codeigniter HMVC"
            ));
            $this->tpl->pparse('Home');
		}

		function test(){//funcion de test
			$this->tpl->set_filenames(array('Home' => 'test'));
            $this->tpl->assign_vars(array(
                'TEST' => "Esta es una funcion TEST"
            ));
            $this->tpl->pparse('Home');
		}
	}
?>