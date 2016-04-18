<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Perfil extends CI_Controller{

		private $upload_errors = "";//Tienen que ser arreglos
	
		function __construct(){
			parent::__construct();
			$this->load->helper("fecha");
		}

		function imhackerman(){

			$this->load->library('Encrypter');
			$this->Encrypter->decrypt('');
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

			/*Cargar las encuestas*/
			$this->load->model("encuesta/encuesta_model");
			$this->load->model("egresado_model","modelo");
			$this->load->model("privacidad_model");
			
			$resultado = $this->modelo->buscarEgresado(array("usuario_id"=>getUsuarioId()));
			
			$data["perfil"] = ($resultado != null) ? $resultado->row() : null;
			$data["privacidad"] = $this->privacidad_model->consultar_privacidad(getUsuarioId());
 		
 			/*Comprobar si hay encuestas nuevas*/
 			$id_egresado = $this->modelo->consultar_egresado_id(getUsuarioId());
 			$id_carrera = $this->modelo->consultar_carrera($id_egresado)->carrera_id;
 			$resultado = $this->encuesta_model->listar_encuestas(array($id_carrera));
 			
 			#echo $encuestas->num_rows();
 			foreach ($resultado->result() as $row) {
				if(!$this->encuesta_model->encuesta_contestada($id_egresado, $row->encuesta_id)){
					$data["encuesta"] = $row;
					break;
				}
			}

			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("perfil/perfil_egresado",$data);
			$this->load->view("perfil/cambiar_clave");
			$this->load->view("templates/footer");

		}
		
		function perfil_empresa(){
			$this->load->model("empresa_model","modelo");
			$resultado = $this->modelo->buscarEmpresa(array("usuario_id"=>getUsuarioId()));
			$data["perfil"] = ($resultado != null) ? $resultado->row() : null;
			
			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("perfil/perfil_empresa",$data);
			$this->load->view("perfil/cambiar_clave");
			$this->load->view("templates/footer");

		}

		function perfil_publicador(){
			$this->load->model("publicador_model","modelo");
			$resultado = $this->modelo->buscarPublicador(array("usuario_id"=>getUsuarioId()));

			$data["perfil"] = ($resultado != null) ? $resultado->row() : null;
			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("perfil/perfil_publicador",$data);
			$this->load->view("perfil/cambiar_clave");
			$this->load->view("templates/footer");

		}

		function perfil_admin(){

			$this->load->model("admin_model");
			$resultado = $this->admin_model->listar(array("usuario_id"=>getUsuarioId()));

			$data["perfil"] = ($resultado != null) ? $resultado->row() : null;
			
			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("perfil/perfil_admin",$data);
			$this->load->view("perfil/cambiar_clave");
			$this->load->view("templates/footer");
		}

		/*Componer este codigo*/
		function cambiar_imagen_perfil(){

			if(is_uploaded_file($_FILES['imagen']['tmp_name'])){
			
				$data = $this->subir_imagen();
								
				if($data != null && !empty($data)){
					if($this->recortar_imagen($data)){
						$this->load->model('usuario_model');
						$this->usuario_model->actualizar_imagen_perfil(getUsuarioId(), $data['file_name']);
						setImagenPerfil($data['file_name']);
						redirect('perfil');
					}
				}
				
				$this->load->view('errors/html/upload_error',$this->upload_errors);
			}
		}

		function recortar_imagen($data){
			if($data['image_width'] > 200 || $data['image_height'] > 200){
				$config["image_library"] = "gd2";
				$config["source_image"] = $data['full_path'];
				$config["create_thumb"] = FALSE;
				$config["maintain_ratio"] = TRUE;
				$config["width"] = 200;
				$config["height"] = 200;

				$this->load->library('image_lib',$config);
				if (!$this->image_lib->resize()){
					$this->upload_errors = array("error_heading"=>"Error de redimensión","upload_errors"=>$this->image_lib->display_errors());
					return FALSE;
				}
			}			

			return TRUE;
		}

		function subir_imagen(){
			
			$config['upload_path'] = 'uploads/';
            $config['allowed_types'] = 'gif|jpg|png';
            $config['overwrite'] = TRUE;	
            $config['max_size'] = 2024;
            $config['max_width'] = 1024;
            $config['max_height'] = 768;	
            $config['file_name'] = 'profile_image_'.getUsuarioId();	

            $this->load->library('upload',$config);

            if(!$this->upload->do_upload('imagen')){
            	$this->upload_errors = array("error_heading"=>"Error de subida","upload_errors"=>$this->upload->display_errors());
            	return FALSE;
            }
            
            return $this->upload->data();
       	}
      
		function cambiar_clave(){
			
			$this->load->model("perfil_model");
			$this->load->library("Encrypter");
			$this->load->library("form_validation");

			$this->form_validation->set_rules('clave_actual','contraseña actual','trim|required|min_length[5]|max_length[20]');
			$this->form_validation->set_rules('clave_nueva','nueva contraseña','trim|required|min_length[5]|max_length[20]');
			$this->form_validation->set_rules('clave_repetida','confirmar contraseña','trim|required|min_length[5]|max_length[20]');

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