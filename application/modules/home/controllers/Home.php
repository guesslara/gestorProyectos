<?php  
	
	/**
	* 
	*/
	include "libs/tpl.lib.php";

	class Home extends MY_Controller{

		private $dirVistas="./application/modules/home/views";
		private $tpl="";

		function __construct()
		{
			parent::__construct();
			$this->tpl = new Template($this->dirVistas);
		}

		function index(){
			$this->tpl->set_filenames(array('Home' => 'default'));
            $this->tpl->assign_vars(array(
                'TEST' => "Bienvenido a Codeigniter HMVC"
            ));
            $this->tpl->pparse('Home');
		}

		function test(){
			$this->tpl->set_filenames(array('Home' => 'test'));
            $this->tpl->assign_vars(array(
                'TEST' => "Esta es una funcion TEST"
            ));
            $this->tpl->pparse('Home');
		}
	}
?>