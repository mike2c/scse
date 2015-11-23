<?php
	include "usuario_model.php";
	class Egresado_model extends Usuario_model{

		function __construct(){
			parent::__construct("listar_egresados");
			/*$this->load->database();*/
		}
		
		function autenticarEgresado($data){
			$query = $this->db->query("select correo, clave, activo from usuario where usuario.correo='$data'");
			if ($query->num_rows()>0) {
				$data_user = $query->row();
				if ($data_user->activo == TRUE) {
					return TRUE;
				}else {
					$this->db->where("correo",$data);
					$this->db->update("usuario",array("activo"=>TRUE));
					return $data_user;
				}
			}else {
				$msg = "ERROR";
				return $msg;
			}
		}

		function insertarEgresado($data_egresado,$data_persona,$data_usuario,$data_contacto){

			$this->db->insert("contacto",$data_contacto);
			$data_egresado["contacto_id"] = $this->db->insert_id();
			
			$this->db->insert("usuario",$data_usuario);
			$data_egresado["usuario_id"] = $this->db->insert_id();
			
			$this->db->insert("persona",$data_persona);
			$data_egresado["persona_id"] = $this->db->insert_id();

			$this->db->insert("egresado",$data_egresado);

			return $data_egresado["usuario_id"];		
		}

		function actualizarEgresado($data_egresado,$data_persona,$data_usuario,$data_contacto){
			
			$this->db->where('persona_id',$data_persona["persona_id"]);
			$this->db->update('persona',$data_persona);

			$this->db->where('contacto_id',$data_contacto["contacto_id"]);
			$this->db->update("contacto",$data_contacto);

			$this->db->where("usuario_id",$data_usuario["usuario_id"]);
			$this->db->update("usuario",$data_usuario);

			$this->db->where("egresado_id",$data_egresado["egresado_id"]);
			$this->db->update("egresado",$data_egresado);

			
		}

		function buscarEgresado($where){
			
			if(!empty($where)){
				$this->db->like($where);
			}
			
			$query = $this->db->get("listar_egresados");

			return $query;
			
		}
	
		function eliminarEgresado($persona_id,$egresado_id,$contacto_id,$usuario_id){
			$this->db->query("delete from usuario where usuario_id=$usuario_id");
			$this->db->query("delete from contacto where contacto_id=$contacto_id");
			$this->db->query("delete from egresado where egresado_id=$egresado_id");
			$this->db->query("delete from persona where persona_id=$persona_id");
		}

		function listarEgresados(){
			return $this->db->get("listar_egresados");
		}

		function existe_cedula($cedula,$egresado = null){
			
			if($cedula != null && !empty($cedula)){
				$this->db->where("cedula",$cedula);
			}else{
				return FALSE;
			}

			if($egresado != null && !empty($egresado)){
				$this->db->where("usuario_id !=",$egresado);
			}

			$query = $this->db->get("egresado");

			if($query->num_rows() > 0){
				return TRUE;
			}

			return  FALSE;
		}

		function existe_carnet($carnet){
			
			$query = $this->db->query("select carnet from egresado where carnet='$carnet'");
			if($query->num_rows() > 0){
				return TRUE;
			}

			return  FALSE;
		}

	}

?>