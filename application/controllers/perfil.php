<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Perfil extends CI_Controller{

		function __construct(){
			parent::__construct();
			$this->load->helper("fecha");
		}

		function index(){
			$this->cargar_perfil();
		}

		private function cargar_perfil(){
			
			if(esEgresado()){
				$this->perfil_egresado();
			}elseif(esEmpresa()){
				$this->perfil_empresa();
			}elseif(esPublicador()){
				$this->perfil_publicador();
			}elseif(esAdministrador()){
				$this->perfil_admin();
			}
		}

		#Cargar perfil de la empresa
		function perfil_egresado(){

			$this->load->model("egresado_model","modelo");
			$this->load->model("privacidad_model");
			$resultado = $this->modelo->buscarEgresado(array("usuario_id"=>getUsuarioId()));
			$data["perfil"] = ($resultado != null) ? $resultado->row() : null;
			$data["privacidad"] = $this->privacidad_model->consultar_privacidad(getUsuarioId());
 
			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("perfil/perfil_egresado",$data);
			$this->load->view("footer");

		}
		
		function perfil_empresa(){
			$this->load->model("empresa_model","modelo");
			$resultado = $this->modelo->buscarEmpresa(array("usuario_id"=>getUsuarioId()));
			$data["perfil"] = ($resultado != null) ? $resultado->row() : null;
			
			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("perfil/perfil_empresa",$data);
			$this->load->view("footer");

		}

		function perfil_publicador(){
			$this->load->model("publicador_model","modelo");
			$resultado = $this->modelo->buscarPublicador(array("usuario_id"=>getUsuarioId()));
			$data["perfil"] = ($resultado != null) ? $resultado->row() : null;
			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("perfil/perfil_publicador",$data);
			$this->load->view("footer");

		}

		function perfil_admin(){

			$this->load->model("admin_model");
			$resultado = $this->admin_model->listar(array("usuario_id"=>getUsuarioId()));

			$data["perfil"] = ($resultado != null) ? $resultado->row() : null;
			
			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("perfil/perfil_admin",$data);
			$this->load->view("footer");
		}

		function cambiar_clave(){

			$this->load->model("perfil_model");
			$this->load->library("Encrypter");
			$this->load->library("form_validation");

			$this->form_validation->set_rules('clave_actual','Clave actual','trim|required|min_length[5]|max_length[20]');
			$this->form_validation->set_rules('clave_nueva','Clave nueva','trim|required|min_length[5]|max_length[20]');
			$this->form_validation->set_rules('clave_repetida','Clave repetida','trim|required|min_length[5]|max_length[20]');

			if($this->form_validation->run() == FALSE){
				echo validation_errors();
			}else{

				$clave_actual = Encrypter::encrypt($this->input->post("clave_actual"));
				$clave_nueva = $this->input->post("clave_nueva");
				$clave_repetida = $this->input->post("clave_repetida");

				if($clave_actual == $this->perfil_model->getClave(getUsuarioId())){
					if($clave_nueva == $clave_repetida){

						$clave_nueva = Encrypter::encrypt($clave_nueva);
						$this->perfil_model->cambiarClave(getUsuarioId(),$clave_nueva);
						echo "<script type='text/javascript'>
							alert('La contraseña ha sido cambiada');
							window.location='". base_url('Perfil')."'"; 
							echo "
						</script>";
						
					}else{
						echo "Las contraseñas no coinciden";
					}
				}else{
					echo "La contraseña actual que digitaste es incorrecta";
				}
			}
		}


	}
?>