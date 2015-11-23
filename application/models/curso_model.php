<?php defined('BASEPATH') OR exit('No direct script access allowed');
	include_once "publicacion_model.php";

	class Curso_model extends Publicacion_model{

		function __construct(){
			parent::__construct("listar_cursos");
		}

		function insertar($data_curso){
			$this->db->insert("curso",$data_curso);
		}

		function actualizar($data_curso){

			$this->db->where("curso_id",$data_curso["curso_id"]);
			$this->db->update("curso",$data_curso);
		}
		
		function eliminar($publicacion_id,$usuario_id){

			parent::eliminarPublicacion($publicacion_id,$usuario_id);
			$this->db->where("publicacion_id",$publicacion_id);
			$this->db->delete("curso");
		}

		function consultar_por_carrera($arr){

			if(is_null($arr) || empty($arr)){
				return null;
			}
			
			$this->db->select("*")->from("listar_cursos,publicacion_carrera");
			$this->db->where("listar_cursos.publicacion_id=publicacion_carrera.publicacion_id");
			$this->db->where("fecha_alta >=",date("Y-m-d"));
			$this->db->where("visible",TRUE);
			$this->db->where("filtro",TRUE);
			$this->db->where_in("publicacion_carrera.carrera_id",$arr);
			$this->db->group_by("listar_cursos.publicacion_id");
			
			return $this->db->get();
		}

	}