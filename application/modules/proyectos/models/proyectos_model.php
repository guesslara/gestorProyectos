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
        	$query = $this->db->get('proyectos');
        	return $query->result_array();
        }
	}
?>