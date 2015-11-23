<?php
	
	include_once "usuario_model.php";
	class Admin_model extends Usuario_model{
		
		function __construct(){
			parent::__construct("listar_admins");
			$this->load->library('session');
		}

		function insertarAdmin( $data_usuario,$data_persona){
			$this->db->insert("usuario",$data_usuario);
			$data_admin['usuario_id']= $this->db->insert_id();

			$this->db->insert("persona",$data_persona);
			$data_admin['persona_id']=$this->db->insert_id();

			$this->db->insert("admin",$data_admin);
						
		}
		
		function updateAdmin($data_usuario, $data_persona){
			$this->db->where('usuario_id',$data_usuario['usuario_id']);
			$this->db->update('usuario',$data_usuario);

			$this->db->where('persona_id',$data_persona['persona_id']);
			$this->db->update('persona',$data_persona);
		}

		function borrarAdmin($data_usuario){
			$this->db->where('usuario_id',$data_usuario['usuario_id']);
			$this->db->update('usuario',$data_usuario);
		}

		function adminInfo($user_id){

			$data_usuario['data_usuario'] = $this->db->query("select correo, clave, imagen_perfil from usuario where usuario.usuario_id = '$user_id'");
			$data_usuario['data_persona'] = $this->db->query("select persona.persona_id,nombre, apellido, sexo, fecha_nacimiento from persona, admin, usuario where admin.usuario_id = '$user_id' and persona.persona_id = admin.persona_id");

			return $data_usuario->row();
		}
	}
?>