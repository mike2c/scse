<?php defined('BASEPATH') OR exit('No direct script access allowed');
	define('IS_AJAX', isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest');
	if(!isset($_SESSION["administrador"])){
		#DESCOMENTAR ESTA LINEA CUANDO EL SISTEMA ESTE TERMINADO.
		exit ("Error 404. pagina no encontrada");
	}

	class Admin extends CI_Controller{

		function __construct(){
			parent:: __construct();
			
			$this->load->library("form_validation");		
			$this->load->model("admin_model","admin");
		}

		function registro(){

			$this->form_validation->set_rules('nombre','Nombre','trim|required|min_length[2]|max_length[45]');
			$this->form_validation->set_rules('apellido','Apellido','trim|required|min_length[2]|max_length[45]');
			$this->form_validation->set_rules('genero','Sexo','trim|required|max_length[1]');
			$this->form_validation->set_rules('correo','Correo','trim|required|max_length[45]|valid_email');
			$this->form_validation->set_rules('clave','Contraseña','trim|required|min_length[5]|max_length[100]');
			$this->form_validation->set_rules('clave_conf','Confirmar Contraseña','trim|matches[clave]|min_length[5]|required|max_length[100]');
		
			if($this->form_validation->run() == FALSE){
				echo validation_errors();			
			}elseif($this->admin->existe_correo($this->input->post("correo"))){
				echo "El correo que estas ingresando ya existe";
				return FALSE;
			}else{

				$this->load->library("Encrypter");//Cargamos la libreria para encriptar
			
				#Tabla usuario
				$data_usuario["correo"] = $this->input->post('correo');
				$data_usuario["clave"] = Encrypter::encrypt($this->input->post('clave'));
				$data_usuario["activo"] = true;

				#Tabla persona
				$data_persona["nombre"] = $this->input->post('nombre');
				$data_persona["apellido"] = $this->input->post('apellido');
				$data_persona["sexo"] = $this->input->post('genero');
				
				if($data_persona["sexo"] == "M"){
					$data_usuario["imagen"]="default/male.jpg";
				}else{
					$data_usuario["imagen"]="default/female.jpg";
				}

				$this->admin->insertarAdmin($data_usuario,$data_persona);

				echo "<script type='text/javascript'>
				alert('Registrado');
				window.location='". base_url('CPanel') ."';
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
		
		function actualizar(){
			
			$this->form_validation->set_rules('nombre','Nombre','trim|required|min_length[2]|max_length[45]');
			$this->form_validation->set_rules('apellido','Apellido','trim|required|min_length[2]|max_length[45]');
			$this->form_validation->set_rules('genero','Sexo','trim|required|max_length[1]');
			$this->form_validation->set_rules('correo','Correo','trim|required|max_length[45]|valid_email');
			$this->form_validation->set_rules('fecha_nacimiento','Fecha de Nacimiento','callback_fechaNacimiento');
			
			if($this->form_validation->run() == FALSE){
				echo validation_errors();
			}elseif($this->admin->existe_correo($this->input->post("correo"),getUsuarioId())){
				echo "El correo que estas ingresando ya existe";
				return FALSE;
			}else{

				$this->load->library("Encrypter");
				$this->load->helper("fecha");

				$data_usuario["correo"] = $this->input->post('correo');
				$data_usuario["usuario_id"] = getUsuarioId();
	
				$data_persona["nombre"] = $this->input->post('nombre');
				$data_persona["apellido"] = $this->input->post('apellido');
				$data_persona["sexo"] = $this->input->post('genero');
				$data_persona["fecha_nacimiento"] = format_date($this->input->post("fecha_nacimiento"));
				$data_persona["persona_id"] = $this->input->post("persona_id");
	
				$this->admin->updateAdmin($data_usuario,$data_persona);
				return TRUE;
			}
		}

		function actualizar_perfil(){

			if($this->Actualizar()){
				echo "<script type='text/javascript'>
					alert('Perfil actualizado');
					window.location='". base_url('Perfil') ."';
				</script>";
			}
		}
	}
?>
