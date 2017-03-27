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
		private $dirPublico="dist";

		function __construct()
		{
			parent::__construct();
			$this->tpl = new Template($this->dirVistas);
			$this->load->model('proyectos_model');
			$this->load->helper('url');
		}

		function index(){//funcion inicial del controlador
			//echo base_url();
			$this->dirPublico=base_url()."dist";
			$data['proyectos'] = $this->proyectos_model->getProyectos();

			for ($i=0; $i < count($data["proyectos"]); $i++) {
				$idDivGrafico="graficoAvance_".$data["proyectos"][$i]["id"];
				$rutaDetalle=base_url("proyectos/detalleProj/".$data["proyectos"][$i]["id"]);
		        $this->tpl->assign_block_vars('LISTADO_PROYECTOS',array(
					'ID_PROYECTO' 		=> $data["proyectos"][$i]["id"],
					'NOMBRE'	  		=> $data["proyectos"][$i]["nombre"],
					'DESCRIPCION' 		=> $data["proyectos"][$i]["descripcion"],
					'FECHA_VENCIMIENTO' => $data["proyectos"][$i]["fecha_vencimiento"],
					'STATUS' 			=> $data["proyectos"][$i]["status"],
					'PORCENTAJE' 		=> $data["proyectos"][$i]["porcentaje"],
					'ID_DIVGRAFICO'	 	=> $idDivGrafico,
					'RUTA_DETALLE'		=> $rutaDetalle
				));
			}
           
            $this->tpl->assign_vars(array(
            	'DIR_MOD'  => $this->dirPublico,
            	'DIR_VIEW' => $this->dirVistas,
                'TEST' 	   => "Bienvenido a Codeigniter HMVC"
            ));
            //mandar a pintar el template
            $this->renderTemplate("Proyectos","proyectos");
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
?>