<?php defined('BASEPATH') OR exit('No direct script access allowed');
	class Login extends CI_Controller{
		function __construct(){
			parent:: __construct();
			$this->load->helper(array('form','url'));
			$this->load->library('form_validation');
			$this->load->library('session');

			$this->form_validation->set_rules('correo','Correo','required');
			$this->form_validation->set_rules('pass','Contraseña','required');
		}

		function index(){
			$this->load->view("cabecera");
			$this->load->view("nav");
			$this->load->view("login");
			$this->load->view("footer");
		}

		function IniciarSesion(){
			$this->load->model('login_model','',true);

			if($this->form_validation->run()== false){
				$datos['title'] = 'Inicio de Sesion';

				$this->load->view('iniciar_sesion',$datos);
			}
			else{
				$data_usuario['correo'] = $this->input->post('correo');
				$data_usuario['clave'] = $this->input->post('pass');

				$user_id = $this->login_model->testUser($data_usuario);
				
				if($user_id['usuario_id'] == false){
					$datos['title'] = 'Inicio de Sesion';

					$this->load->view('iniciar_sesion',$datos);
				}
				else{
					$this->session->set_userdata($user_id['persona_id']);
					$this->load->view('testView');
				}
			
			}
		}

		function CerrarSesion(){
			session_destroy();
			?>
				<script type="text/javascript">
					window.alert("Has cerrado sesion");
					window.location="<?=base_url()?>";
				</script>
			<?
		}
	} 
}