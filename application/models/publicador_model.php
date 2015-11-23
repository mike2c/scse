<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	include_once "usuario_model.php";
	class Publicador_model extends Usuario_model{

		function __construct(){
			parent::__construct("listar_publicadores");
			$this->load->database();
		}

		function insertar($data_persona,$data_usuario,$data_publicador){

			$this->db->insert("persona",$data_persona);
			$data_publicador["persona_id"] = $this->db->insert_id();

			$this->db->insert("usuario",$data_usuario);
			$data_publicador["usuario_id"] = $this->db->insert_id();

			$this->db->insert("publicador",$data_publicador);
		
		}

		function actualizar($data_usuario,$data_persona,$data_publicador){

			$this->db->where("usuario_id",$data_usuario["usuario_id"]);
			$this->db->update("usuario",$data_usuario);

			$this->db->where("persona_id",$data_persona["persona_id"]);
			$this->db->update("persona",$data_persona);

			$this->db->where("publicador_id",$data_publicador["publicador_id"]);
			$this->db->update("publicador",$data_publicador);
		}

		function buscarPublicador($where){
			if(!empty($where)){
				$this->db->like($where);
			}
			return $this->db->get("listar_publicadores");
		}


	}
?>