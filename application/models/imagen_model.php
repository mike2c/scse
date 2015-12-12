<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Imagen_model extends CI_Model{

		function __construct(){
			parent::__construct();
			$this->load->database();
		}

		function guardar($data){
			$this->db->query("insert into imagen(imagen,tipo) values ('$data[imagen]','$data[tipo]');");
		}

		function mostrar($id_imagen){

			$result= $this->db->query("select imagen,tipo from imagen_publicacion where imagen_publicacion_id=".$id_imagen)->result_array();
			$data["data"]=$result[0]["imagen"];
			$data["tipo"]=$result[0]["tipo"];

			return $data;
		}

		function deFichaOcupacional($ficha_id){
			$result =  $this->db->query("select imagen,tipo from publicacion,ficha where ficha.publicacion_id = publicacion.publicacion_id and ficha_id=". $ficha_id)->result_array();
			
			$data["data"] = $result[0]["imagen"];
			$data["tipo"] = $result[0]["tipo"];

			return $data;
		}

		function existe($imagen_id){

			$this->db->where("imagen_publicacion_id",$imagen_id);
			$result = $this->db->get("imagen_publicacion");

			if($result != null && $result->num_rows() == 1){
				
				$imagen = $result->row('imagen');
				if(!empty($imagen)){
					return true;
				}
			}

			return false;
		}
	}
?>