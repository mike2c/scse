<?php 
	class Mensaje_model extends CI_model{

		function __construct(){
			parent::__construct();
			$this->load->database();
		}

		function insertarMensaje($data_mensaje){

			$this->db->insert("mensaje",$data_mensaje);
			return $this->db->insert_id();
		}

		function insertarDestinoMensaje($data_destino){

			$this->db->insert("destino_mensaje",$data_destino);
		}

		function registrarEnTablaEliminados($usuario_id,$mensaje_id){
			
			$data_eliminados = array(
				"usuario_id"=>$usuario_id,
				"mensaje_id"=>$mensaje_id,
				"eliminado"=>false);

			$this->db->insert("mensaje_eliminado",$data_eliminados);
		}

		function actualizarTablaEliminados($usuario_id,$mensaje_id,$valor = true){

			$this->db->where("mensaje_id",$mensaje_id);
			$this->db->where("usuario_id",$usuario_id);

			$this->db->update("mensaje_eliminado",array("eliminado"=>$valor));
		}

		function insertarBorrador($data_borrador){
			
			$this->db->insert("mensaje_borrador",$data_borrador);
		}

		function listarInbox($where = null,$like = null){

			if($where != null && !empty($where)){
				$this->db->where($where);
			}
			if($like != null && !empty($like)){
				$this->db->like($like);
			}

			return $this->db->get("listar_inbox");
		}

		function listarSent($filtro = null,$like = null){

			if($filtro != null && !empty($filtro)){
				$this->db->where($filtro);
			}
			if($like != null && !empty($like)){
				$this->db->like($like);
			}

			return $this->db->get("listar_sent");
		}

		function listarDrafts($filtro = null,$like = null){

			if($filtro != null && !empty($filtro)){
				$this->db->where($filtro);
			}
			if($like != null && !empty($like)){
				$this->db->like($like);
			}
			
			return $this->db->get("listar_drafts");
		}

		function eliminarMensaje($usuario_id,$mensaje_id){

			$this->db->where("usuario_id",$usuario_id);
			$this->db->where("mensaje_id",$mensaje_id);
			#UPDATE
			$this->db->update("mensaje_borrador",array("eliminado"=>true));
		}

		function destruirBorrador($mensaje_id){

			$this->db->where("mensaje_id",$mensaje_id);
			$this->db->delete("mensaje_eliminado");
			$this->db->where("mensaje_id",$mensaje_id);
			$this->db->delete("mensaje");
		}

		function actualizarMensaje($data){
			$this->db->where("mensaje_id",$data["mensaje_id"]);
			$this->db->update("mensaje",$data);
		}
		
		function registrar_leido($usuario_id,$mensaje_id){

			if($usuario_id == null || empty($usuario_id)){
				throw new Exception("El parametro usuario_id no puede ser null o vacio");
			}
			if($mensaje_id == null || empty($mensaje_id)){
				throw new Exception("El parametro mensaje_id no puede ser null o vacio");
			}

			$this->db->where("usuario_id",$usuario_id);
			$this->db->where("mensaje_id",$mensaje_id);
			
			$this->db->update("destino_mensaje",array("usuario_id"=>$usuario_id,"mensaje_id"=>$mensaje_id,"visto"=>TRUE));
		}

		function contar_inbox($usuario_id){
			
			$this->db->select("count(mensaje_id) as cantidad_inbox");
			$this->db->where("usuario_id",$usuario_id);
			return $this->db->get("listar_inbox")->row('cantidad_inbox');
		}

		function contar_sent($usuario_id){
			
			$this->db->select("count(mensaje_id) as cantidad_sent");
			$this->db->where("usuario_id",$usuario_id);
			return $this->db->get("listar_sent")->row('cantidad_sent');
		}

		function contar_drafts($usuario_id){
			
			$this->db->select("count(mensaje_id) as cantidad_drafts");
			$this->db->where("usuario_id",$usuario_id);
			return $this->db->get("listar_drafts")->row('cantidad_drafts');
		}
	}

 ?>