<?php defined('BASEPATH') OR exit('No direct script access allowed');
	include_once "publicacion_model.php";
	
	class  Beca_model extends Publicacion_model{

		function __construct(){
			parent::__construct("listar_becas");
		}

		function insertarBeca($data_beca){	

			$this->db->insert("beca",$data_beca);
		}

		function actualizarBeca($data_beca){
		
			$this->db->where("beca_id",$data_beca["beca_id"]);
			$this->db->update("beca",$data_beca);
		}

		function eliminarBeca($publicacion_id,$usuario_id){

			parent::eliminarPublicacion($publicacion_id,$usuario_id);

			$this->db->where("publicacion_id",$publicacion_id);
			$this->db->delete("beca");
		}

		function consultar_por_carrera($arr){

			if(is_null($arr) || empty($arr)){
				return null;
			}
			
			$this->db->select("*")->from("listar_becas,publicacion_carrera");
			$this->db->where("listar_becas.publicacion_id=publicacion_carrera.publicacion_id");
			$this->db->where("fecha_alta >=",date("Y-m-d"));
			$this->db->where("visible",TRUE);
			$this->db->where("filtro",TRUE);
			$this->db->where_in("publicacion_carrera.carrera_id",$arr);
			$this->db->group_by("listar_becas.publicacion_id");
			
			return $this->db->get();
		}
	}
?>