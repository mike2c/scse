<?php 
	include_once "usuario_model.php";

	class Empresa_model extends Usuario_model{

		function __construct(){
			parent:: __construct("listar_empresas");

			$this->load->library('session');
			$this->load->database();
		}

		function insertarEmpresa($data_usuario,$data_empresa,$data_contacto){

			$this->db->insert("usuario",$data_usuario);
			$data_empresa["usuario_id"] = $this->db->insert_id();
			
			$this->db->insert("contacto",$data_contacto);
			$data_empresa["contacto_id"] = $this->db->insert_id();
			
			$this->db->insert("empresa",$data_empresa);
			
		}

		function actualizarEmpresa($data_empresa,$data_contacto,$data_usuario){
			
			#actualiza tabla de usuario
			$where = "usuario.usuario_id=". $data_usuario["usuario_id"];
			$query = $this->db->update_string("usuario",$data_usuario,$where);
			$this->db->query($query);

			#actualizar tabla de contacto
			$where = "contacto.contacto_id=". $data_contacto["contacto_id"];
			$query = $this->db->update_string("contacto",$data_contacto,$where);
			
			$this->db->query($query);

			#actualizar tabla de empresa
			$where = "empresa_id=". $data_empresa["empresa_id"];
			$query = $this->db->update_string("empresa",$data_empresa,$where);
			#echo $query;
			$this->db->query($query);

		}

		function editarEmpresa($data_empresa){
			$this->db->where("empresa_id",$data_empresa["empresa_id"]);
			$this->db->update("empresa",$data_empresa);
			return TRUE;
		}
		function editarUsuarioEmpresa($data_usuario){
			$this->db->where("usuario_id",$data_usuario["usuario_id"]);
			$this->db->update("usuario",$data_usuario);
		}

		function editarContactoEmpresa($data_contacto){
			$this->db->where("contacto_id",$data_contacto["contacto_id"]);
			$this->db->update("contacto",$data_contacto);
		}

		function eliminarEmpresa($empresa_id,$contacto_id,$usuario_id){
			$this->db->query("delete from empresa where empresa_id=" & $empresa_id);
			$this->db->query("delete from usuario where usuario_id" & $usuario_id);
			$this->db->query("delete from contacto where contacto_id=" & $contacto_id);
		}

		function getInfo(){
			$info['datos_sociedad'] = $this->db->query("select * from sociedad;");
			$info['datos_empresa'] = $this->db->query("select empresa_id, nombre_empresa, autenticada from empresa") ;
			return $info;
		}

		function fillCampos(){
			$user_id = $this->session->userdata('empresa');
			$data_usuario['data_usuario'] = $this->db->query("select correo,clave,imagen_perfil from usuario where usuario.usuario_id = '$user_id[usuario_id]';");
			$data_usuario['data_empresa'] = $this->db->query("select empresa_id, sociedad_id, mision, vision, ocupacion, sitio_web, contacto_id, nombre_empresa from empresa where empresa.usuario_id = '$user_id[usuario_id]';");
			$contacto = $data_usuario['data_empresa']->row()->contacto_id;
			$data_usuario['data_contacto'] = $this->db->query("select telefono,celular,direccion,municipio_id from contacto where contacto.contacto_id = '$contacto';");		
			return $data_usuario;
		}

		function autenticar($verificar,$empresa_id){

			for ($i=0; $i < count($empresa_id); $i++) { 
				$this->db->where("empresa_id",trim($empresa_id[$i]));
				$this->db->update("empresa",$verificar);
			}
		}

		function buscarEmpresa($where = ""){
			if($where != ""){
				$this->db->like($where);
			}

			return $this->db->get("listar_empresas");
		}
	}
 ?>