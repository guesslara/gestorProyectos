<?php
	/*
	Clase con algunas funciones comunes en la aplicacion necesarias y que son repetitivas
	Autor:Gerardo Lara Perez
	*/
	include("conexion.php");
	class funcionesComunes{	
		
		public function guardaDetalleSistema($id_proyecto,$accionRealizada,$usuarioSistema){
			$this->conexionBd();			
			//se hace la insercion en la tabla de la bitacora
			$sqlDetalle="INSERT INTO bitacora (id_proyecto,accion_realizada,responsable_bitacora,fecha_bitacora,hora_bitacora) VALUES ('".$id_proyecto."','".$accionRealizada."','".$usuarioSistema."','".date("Y-m-d")."','".date("H:i:s")."')";
			$resDetalle=@mysql_query($sqlDetalle,$this->conexion)or die(mysql_error());
			if($resDetalle){
				echo "<p>Detalle guardado FC</p>";
			}else{
				echo "<p>Error al guardar el detalle</p>";
			}
			return $resDetalle;
		}
		
		private function conexionBd(){
			try{
				//include("../../includes/config.inc.php");
				$conn = new Conexion();
				//$this->conexion = $conn->getConexion($host,$usuario,$pass,$db);
				$this->conexion = $conn->getConexion("localhost","root","xampp","2012_control_sistemas");
				
			}catch(Exception $e){
				echo "Ha ocurrido un error en la aplicaci&oacute;n.";
			}

		}//fin de la conexion
		
	}//fin de la clase
?>