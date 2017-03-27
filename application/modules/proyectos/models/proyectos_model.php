<?php
	/**
	 * 
	 */
	class proyectos_model extends MY_Model{

		public function __construct()
                {
                        $this->load->database();
                }

                public function getProyectos(){
        	       //$query = $this->db->get('proyectos');
                       $query = $this->db->query("SELECT id,nombre,descripcion,fecha_vencimiento,status,porcentaje FROM proyectos");
        	       return $query->result_array();
                }
	}
?>