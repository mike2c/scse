<?php defined('BASEPATH') OR exit('No direct script access allowed');
	include_once "publicacion_model.php";
	class  Ficha_model extends Publicacion_model{

		function __construct(){
			parent::__construct("listar_fichas");

		}

		function insertar($data_ficha){
			
			$this->db->insert("ficha",$data_ficha);
			return $this->db->insert_id();	
		}

		function actualizar($data_publicacion,$data_ficha,$ficha_carreras){

			$this->actualizarPublicacion($data_publicacion);
			$this->actualizarFiltro($ficha_carreras,$data_publicacion["publicacion_id"]);
			$this->db->where("ficha_id",$data_ficha["ficha_id"]);
			$this->db->update("ficha",$data_ficha);
		}

		function eliminarFicha($publicacion_id,$usuario_id){
			
			parent::eliminarPublicacion($publicacion_id,$usuario_id);
			
			$this->db->where("publicacion_id",$publicacion_id);
			$this->db->delete("ficha");
		}

		function consultar_por_carrera($arr){

			if(is_null($arr) || empty($arr)){
				return null;
			}
			
			$this->db->select("*")->from("listar_fichas,publicacion_carrera");
			$this->db->where("listar_fichas.publicacion_id=publicacion_carrera.publicacion_id");
			$this->db->where("fecha_alta >=",date("Y-m-d"));
			$this->db->where("visible",TRUE);
			$this->db->where("filtro",TRUE);
			$this->db->where_in("publicacion_carrera.carrera_id",$arr);
			$this->db->group_by("listar_fichas.publicacion_id");
			
			return $this->db->get();
		}

		function consultar_creador($ficha_id){

			if(is_null($ficha_id) || empty($ficha_id)){
				throw new Exception("El parametro ficha_id no puede ser vacio o nulo");
			}

			$this->db->select("usuario.usuario_id,correo")->from("usuario,publicacion,ficha");
			$this->db->where("usuario.usuario_id=publicacion.usuario_id");			
			$this->db->where("ficha.publicacion_id=publicacion.publicacion_id");			
			$this->db->where("ficha_id",$ficha_id);

			return $this->db->get();
		}

		function consultar_publicadas($usuario_id,$carreras = null){

			if(is_null($carreras) || empty($carreras)){
				
			}else{
				$this->db->where_in("publicacion_carrera.carrera_id",$carreras);				
			}

			$this->db->select("listar_fichas.ficha_id,listar_fichas.publicacion_id,cargo,ubicacion,cantidad,descripcion,fecha_alta
				jefe,a_cargo,fecha_alta,finalidad,funciones,requisitos,experiencia,competencia,ficha_solicitante.ficha_solicitante_id")
			->from("listar_fichas,publicacion_carrera");
			$this->db->join("ficha_solicitante","ficha_solicitante.ficha_id=listar_fichas.ficha_id and ficha_solicitante.usuario_id='$usuario_id'","left");
			$this->db->where("listar_fichas.publicacion_id=publicacion_carrera.publicacion_id");
				
			$this->db->where("fecha_alta >=",date("Y-m-d"));
			$this->db->where("visible",TRUE);
			$this->db->where("filtro",TRUE);
			$this->db->group_by("listar_fichas.publicacion_id");

			return $this->db->get();
		}

		function registrar_aplicacion($usuario_id,$ficha_id){

			if(empty($usuario_id) || is_null($usuario_id)){
				throw new Exception("El parametro usuario_id no puede ser nulo o vacio");
			}
			if(empty($ficha_id) || is_null($ficha_id)){
				throw new Exception("El parametro ficha_id no puede ser nulo o vacio");
			}
			$arr = array("usuario_id"=>$usuario_id,"ficha_id"=>$ficha_id);
			$this->db->insert("ficha_solicitante",$arr);

			return $this->db->insert_id();
		}
	}
?>