<?php
	class Publicacion_model extends CI_Model{

		private $view_name = null;

		function __construct($view_name){
			
			parent::__construct();
			
			$this->view_name=$view_name;
			$this->load->library('session');
			$this->load->helper(array("sesion"));
		}

		function actualizarPublicacion($data_publicacion){
			$this->db->where("publicacion_id",$data_publicacion["publicacion_id"]);
			$this->db->update("publicacion",$data_publicacion);
		}

		function insertarPublicacion($data_publicacion){
			$this->db->insert("publicacion",$data_publicacion);
			return $this->db->insert_id();
		}

		function listar($where = "",$like = "",$order_by="",$where_in="",$fields = ""){
			if($where != ""){
				$this->db->where($where);
			}
			if($like != ""){
				$this->db->like($like);
			}
			if($fields != ""){
				$this->db->select($fields);
			}
			if($order_by != ""){
				$this->db->order_by($order_by,"asc");
			}
			if($where_in != ""){
				$this->db->where_in(key($where_in),$where[key($where_in)]);
			}
			return $this->db->get($this->view_name);
		}

		function insertarImagen($data_imagen){
			$this->db->insert("imagen_publicacion",$data_imagen);
			return $this->db->insert_id();
		}

		function actualizarImagen($data_imagen){
			$this->db->where("imagen_publicacion_id",$data_imagen["imagen_publicacion_id"]);
			$this->db->update("imagen_publicacion",$data_imagen);
		}

		function listarCarrera($publicacion_id){
		
			return $this->db->query("select publicacion_carrera_id,nombre_carrera, carrera.carrera_id,filtro from publicacion_carrera,carrera where publicacion_carrera.publicacion_id = '$publicacion_id' and carrera.carrera_id=publicacion_carrera.carrera_id;");
		}

		function eliminarPublicacion($publicacion_id,$usuario_id){

			$this->db->where("publicacion_id",$publicacion_id);
			$this->db->where("usuario_id",$usuario_id);
			$this->db->delete("publicacion");
		}

		function insertarFiltro($data_publicacion){
			$cont_carrera = $this->db->get("carrera");
			foreach ($cont_carrera->result() as $row) { 
				$this->db->query("insert into publicacion_carrera(publicacion_id,carrera_id,filtro) values('$data_publicacion[publicacion_id]',$row->carrera_id,false);");
			}
		}
		
		function cambiarVisibilidad($data){

			$this->db->where("publicacion_id",$data["publicacion_id"]);
			$this->db->update("publicacion",$data);
		}

		function actualizarFiltro($data_carrera,$publicacion_id){
			$data = $this->db->query("select publicacion_id,carrera_id,filtro from publicacion_carrera where publicacion_carrera.publicacion_id = '$publicacion_id';");
			$this->db->where("publicacion_id",$publicacion_id);
			$this->db->update("publicacion_carrera",array("filtro"=>false));

			$encontrado=true;

			if($data->num_rows()>0){

				for ($i=0; $i < count($data_carrera); $i++){
					$encontrado =false;

					foreach($data->result() as $row){ 

						if($row->carrera_id==$data_carrera[$i]){
							$encontrado=true;
							break;
						}
					}

					if ($encontrado==false) {

						$save = array("publicacion_id"=>$publicacion_id,"carrera_id"=>$data_carrera[$i],"filtro"=>true);
						$this->db->insert("publicacion_carrera",$save);

					}else{

						$this->db->where("carrera_id",$data_carrera[$i]);
						$this->db->where("publicacion_id",$publicacion_id);
						$this->db->update("publicacion_carrera",array("filtro"=>true));
					}
				}
			}
		}
	}
?>