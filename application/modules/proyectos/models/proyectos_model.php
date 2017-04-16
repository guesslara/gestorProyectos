<?php
	/**
	 * 
	 */
	class proyectos_model extends MY_Model{

		public function __construct(){
            $this->load->database();
        }

        public function getProyectos(){
        	//$query = $this->db->get('proyectos');
            $query = $this->db->query("SELECT id,nombre,descripcion,fecha_vencimiento,status,porcentaje FROM proyectos");
        	return $query->result_array();
        }

        public function getUsrProyectos($usr){
            $this->db->where('ID',$usr);
            $this->db->where('activo',"1");
            $query = $this->db->get('userdbsistemas');
            if($query->num_rows() == 1){
                return $query->row();
            }
        }

        public function detalleProyecto($idP){
            $this->db->where('id',$idP);
            $query = $this->db->get('proyectos');
            if($query->num_rows() == 1){
                return $query->row();
            }
        }

        public function getLogProyecto($idP){
            $query = $this->db->query("SELECT bitacora.id AS id,id_proyecto,accion_realizada,fecha_bitacora,hora_bitacora,usuario,CONCAT(nombre,' ',apaterno) AS nombre FROM bitacora INNER JOIN userdbsistemas ON bitacora.responsable_bitacora=userdbsistemas.ID WHERE id_proyecto='".$idP."' ORDER BY id DESC");
            return $query->result_array();
        }
	}
?>