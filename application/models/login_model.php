<?php
	class Login_model extends CI_Model{
		function __construct(){
			parent:: __construct();
			$this->load->library('session');
		}
		function testUser($data_usuario){
			$query = $this->db->query("select usuario.usuario_id from egresado, usuario where usuario.correo = '$data_usuario[correo]' and usuario.clave = '$data_usuario[clave]' and usuario.usuario_id = egresado.usuario_id;");
			$query2 = $this->db->query("select usuario.usuario_id from admin, usuario where usuario.correo='$data_usuario[correo]' and usuario.clave='$data_usuario[clave]' and usuario.usuario_id = admin.usuario_id;");
			$query3 = $this->db->query("select usuario.usuario_id from publicador, usuario where usuario.correo = '$data_usuario[correo]' and usuario.clave = '$data_usuario[clave]' and usuario.usuario_id = publicador.usuario_id;");
			
			if($query->num_rows()>0){
				$user_id['usuario_id'] =$query->row_array();
				$user_id['tipo_usuario'] = 'egresado';
				$this->getSesion_id($user_id);

				$user = $this->session->userdata('usuario_id');

				$query4 = $this->db->query("select egresado.persona_id from egresado where egresado.usuario_id = '$user';");
				$user_id['persona_id'] = $query4->row_array();

			}else if($query2->num_rows()>0){
				$user_id['usuario_id'] =$query2->row_array();
				$user_id['tipo_usuario'] = 'admin';

				$this->getSesion_id($user_id);

				$user = $this->session->userdata('usuario_id');

				$query5 = $this->db->query("select admin.persona_id from admin where admin.usuario_id = '$user';");
				$user_id['persona_id'] = $query5->row_array();

			}else if($query3->num_rows()>0){
				$user_id['usuario_id'] =$query3->row_array();
				$user_id['tipo_usuario'] = 'publicador';

				$this->getSesion_id($user_id);

				$user = $this->session->userdata('usuario_id');

				$query6 = $this->db->query("select publicador.persona_id from publicador where publicador.usuario_id = '$user';");
				$user_id['persona_id'] = $query6->row_array();

			}else{
				$user_id['usuario_id'] = false;
				$user_id['tipo_usuario'] = '';
				$user_id['persona_id'] = false;
			}
			return $user_id;
		}
		function getSesion_id($user_id){
			$this->session->set_userdata($user_id['usuario_id']);
			$this->session->set_userdata('tipo_usuario',$user_id['tipo_usuario']);
		}
	}