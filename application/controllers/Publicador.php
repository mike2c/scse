<?php defined('BASEPATH') OR exit('No direct script access allowed');
	define("IS_AJAX",isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == 'xmlhttprequest');

	class Publicador extends CI_Controller{

		function __construct(){
			parent::__construct();
			$this->load->model("publicador_model","publicador");
			$this->load->library("form_validation");

		}

		function Registro(){

			$this->form_validation->set_rules("nombre","Nombre","trim|required|max_length[45]");
			$this->form_validation->set_rules("apellido","Apellido","trim|required|max_length[45]");
			$this->form_validation->set_rules("genero","Genero","trim|required|min_length[1]|max_length[1]");
			$this->form_validation->set_rules("area","Area","trim|required|min_length[1]|max_length[4]");
			$this->form_validation->set_rules("cargo","Cargo","trim|required|min_length[1]|max_length[4]");
			$this->form_validation->set_rules('correo','Correo','trim|required|min_length[10]|max_length[45]|valid_email');
			$this->form_validation->set_rules("clave","Contraseña","trim|required|min_length[5]|max_length[15]");
			$this->form_validation->set_rules('clave_conf','Contraseña','trim|required|matches[clave]|min_length[5]|max_length[15]',
				array("matches"=>"Las contraseñas no coinciden","required"=>"El campo de confirmacion de contraseña es obligatorio"));

			if($this->form_validation->run() == FALSE){
				echo validation_errors();
			}elseif($this->publicador->existe_correo($this->input->post("correo"))){
				echo "El correo que estas ingresando ya existe";
				return FALSE;
			}else{
			
				$this->load->library("Encrypter");
				$this->load->helper("fecha");

				$data_persona["nombre"] = $this->input->post("nombre");
				$data_persona["apellido"] = $this->input->post("apellido");
				$data_persona["sexo"] = $this->input->post("genero");
				$data_persona["fecha_nacimiento"] = format_date($this->input->post("fecha_nacimiento"));
				
				if($data_persona["sexo"] == "M"){
					$data_usuario["imagen"]="default/male.jpg";
				}else{
					$data_usuario["imagen"]="default/female.jpg";
				}

				$data_usuario["correo"] = $this->input->post("correo");
				$data_usuario["clave"] = Encrypter::encrypt($this->input->post("clave"));
				$data_usuario["activo"] = TRUE;

				$data_publicador["cargo_id"] = $this->input->post("cargo");

				$this->publicador->insertar($data_persona,$data_usuario,$data_publicador);

				echo "<script type='text/javascript'>
					alert('Registrado');
					window.location='". base_url('CPanel') ."';
				</script>";
				
			}
		}

		function ActualizarPerfil(){

			if($this->Actualizar()){
				echo "<script type='text/javascript'>
					alert('Perfil actualizado');
					window.location='". base_url('Perfil') ."';
				</script>";
			}
		}
		
		function fechaNacimiento(){
			$this->load->helper('fecha');
			
			$fecha=$this->input->post("fecha_nacimiento");
			$patron = '/^\d{1,2}\/\d{1,2}\/\d{4}$/';
			
			if (!preg_match($patron, $fecha) or !validarFechaNacimiento($fecha)){
				$this->form_validation->set_message("fechaNacimiento","Ingrese Una Fecha de Nacimiento valida");
				return false;
			}
			return true;
		}

		function Actualizar(){

			$this->form_validation->set_rules("nombre","Nombre","trim|required|max_length[45]");
			$this->form_validation->set_rules("apellido","Apellido","trim|required|max_length[45]");
			$this->form_validation->set_rules("genero","Genero","trim|required|min_length[1]|max_length[1]");
			$this->form_validation->set_rules("area","Area","trim|required|min_length[1]|max_length[4]");
			$this->form_validation->set_rules("cargo","Cargo","trim|required|min_length[1]|max_length[4]");
			$this->form_validation->set_rules('correo','Correo','trim|required|min_length[10]|max_length[45]|valid_email');
			$this->form_validation->set_rules('fecha_nacimiento','Fecha de Nacimiento','callback_fechaNacimiento');
			
			if($this->form_validation->run() == FALSE){
				echo validation_errors();
			}elseif($this->publicador->existe_correo($this->input->post("correo"),getUsuarioId())){
				echo "El correo que estas ingresando ya existe";
				return FALSE;
			}else{

				$this->load->library("Encrypter");
				$this->load->helper("fecha");

				$data_persona["persona_id"] = $this->input->post("persona_id");
				$data_persona["nombre"] = $this->input->post("nombre");
				$data_persona["apellido"] = $this->input->post("apellido");
				$data_persona["sexo"] = $this->input->post("genero");
				
				$data_persona["fecha_nacimiento"] = format_date($this->input->post("fecha_nacimiento"));
				
				$data_usuario["usuario_id"] = $this->input->post("usuario_id");
				$data_usuario["correo"] = $this->input->post("correo");

				$data_publicador["publicador_id"] = $this->input->post("publicador_id");
				$data_publicador["cargo_id"] = $this->input->post("cargo");
		
				$this->publicador->actualizar($data_usuario,$data_persona,$data_publicador);
				return TRUE;
			}
		}
	}
?>