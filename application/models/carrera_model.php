<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Carrera_model extends CI_Model{

		function __construct(){
			parent::__construct();
		}

		/*Agregar una nueva carrera, recibe por parametro el nombre de la carrera mediante un arreglo*/
		function insertar($data){
			if(empty($data)){
				throw new Exception("El nombre de la carrera no puede ser nulo o vacio.", 1);
			}

			if(is_array($data)){
				$this->db->insert("carrera",$data);
			}else{
				throw new Exception("El parametro debe de ser un arreglo con los campos de la tabla", 1);
			}

			/*Regresa verdadero si la consulta se ejecuto correctamente*/
			return true;
		}

		/*Actualiza la tabla carrera con el nombre e id especificado en el arreglo*/
		function actualizar($data){

			if(empty($data)){
				throw new Exception("El nombre de la carrera no puede ser nulo o vacio.", 1);
			}

			if(is_array($data)){
				$this->db->update("carrera",$data);
			}else{
				throw new Exception("El parametro debe de ser un arreglo con los campos de la tabla", 1);
			}

			/*Regresa verdadero si la consulta se ejecuto correctamente*/
			return true;
		}

		/*Retorna un valor boleano si el nombre de la carrera existe*/
		function nombre_carrera_existe($nombre_carrera){

			if(!empty($nombre_carrera)){
				$this->db->where('nombre_carrera',$nombre_carrera);
			}

			$query = $this->db->get('carrera');
			if($query != null && $query->num_rows() > 0){
				return true;
			}

			return false;
		}

		/*Retorna un valor boleano si el id de la carrera existe*/
		function carrera_existe($carrera_id){

			if(!empty($carrera_id)){
				$this->db->where('carrera_id',$carrera_id);
			}

			$query = $this->db->get('carrera');
			if($query != null && $query->num_rows() > 0){
				return true;
			}

			return false;
		}
	}
?>