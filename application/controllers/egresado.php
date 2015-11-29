<?php defined('BASEPATH') OR exit('No direct script access allowed');
	//DEFINIENDO LA CONSTANTE  IS_AJAX
	define("IS_AJAX",isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == 'xmlhttprequest');
	class Egresado extends CI_Controller{
		
		function __construct(){
			parent::__construct();
			$this->load->library(array("form_validation","email","Encrypter"));
			$this->email->set_newline("\r\n");
			$this->load->model("egresado_model","modelo");
			$this->load->helper(array("url","form_helper","sesion"));
			
		}

		function autenticar(){
			if (!$this->input->post('correo')=="") {
			
				$data = $this->modelo->autenticarEgresado($this->input->post('correo'));
				if ($data == TRUE || $data=="ERROR") {
					
					if ($data == 1){
						$msg["existe"] = "El correo proporcionado ya se encuentra autenticado y en uso.";
					}else{
						$msg["no_existe"] = "El correo proporcionado no se encuentra registrado en el sistema, por favor contactar con el administrador.";
					}
					$this->load->view("cabecera");
					$this->load->view("nav");
					$this->load->view("egresado/error_autenticacion",$msg);
					$this->load->view("footer");
					
				}else{
					$this->enviar_correo_egresado($data);
				}
			}else{
				$this->load->view("cabecera");
				$this->load->view("nav");
				$this->load->view("egresado/autenticar_egresado");
				$this->load->view("footer");
			}
		}

		function listado(){
			
			$this->load->model("listas_model","lista");
			$this->load->model("privacidad_model");

			try{

				/*Verificamos si no se han enviado datos por post*/
				if(/*isset($_POST["nombre"]) &&*/ isset($_POST["carrera"])){

					/*$like = array("nombre"=>$this->input->post("nombre"));*/
					$where = null;
					if($this->input->post("carrera") != 0){
						$where = array("carrera_id"=>$this->input->post("carrera"));
						$data["carrera"] = $this->input->post("carrera");
					}

					$data["registro"] = $this->modelo->listar($where,null,"nombre");
				
				}else{
					$data["registro"] = $this->modelo->listar(null,null,"nombre");
				}
			}catch(Exception $e){
				exit($e->getMessage());
			}
			
			/*Cargamos la privacidad por cada usuario*/
			if($data["registro"] != null){
				foreach ($data["registro"]->result() as $row) {
					$data["privacidad"][$row->usuario_id] = $this->privacidad_model->consultar_privacidad($row->usuario_id);
				}
			}
			
			/*Listar carreras*/
			$data["carreras"] = $this->lista->listarCarreras();

			if($data["registro"] != null){
				$this->load->view("templates/header");
				$this->load->view("templates/menu");
				$this->load->view("pages/listado_egresados",$data);
				$this->load->view("templates/footer");
			}else{
				exit("No se han encontrado registros");
			}
		}

		function registro(){

			if(!isset($_SESSION["administrador"])){
				#show_404();
			}
			$this->form_validation->set_rules("cedula","Cedula","trim|max_length[16]|min_length[16]");	
			$this->form_validation->set_rules("nombre","Nombre","trim|required|max_length[45]");
			$this->form_validation->set_rules("apellido","Apellido","trim|required|max_length[45]");
			$this->form_validation->set_rules("genero","Genero","trim|required|max_length[1]");
			$this->form_validation->set_rules("carnet","Carnet","trim|required|max_length[10]");
			$this->form_validation->set_rules("telefono","Telefono","trim|max_length[9]");
			$this->form_validation->set_rules("celular","Celular","trim|max_length[9]");
			$this->form_validation->set_rules('correo','Correo','trim|required|min_length[10]|max_length[45]|valid_email');
			$this->form_validation->set_rules("direccion","Direccion","trim|max_length[100]|min_length[6]");
			$this->form_validation->set_rules("municipio","Municipio","trim|required|max_length[10]|min_length[1]");
			$this->form_validation->set_rules("departamento","Departamento","trim|required|max_length[10]|min_length[1]");


			if($this->form_validation->run()==false){
				echo validation_errors();
			}elseif($this->modelo->existe_cedula($this->input->post("cedula"))){
				echo "La cedula que estas ingresando ya existe";
			}elseif($this->modelo->existe_carnet($this->input->post("carnet"))){
				echo "El carnet que estas ingresando ya existe";
			}elseif($this->modelo->existe_correo($this->input->post("correo"))){
				echo "El correo que estas ingresando ya existe";
				return FALSE;
			}else{

				$this->load->helper(array("pass_gen","fecha"));
				$data_persona["nombre"] = $this->input->post("nombre");
				$data_persona["apellido"] = $this->input->post("apellido");
				$data_persona["sexo"] = $this->input->post("genero");
				
				$data_persona["fecha_nacimiento"] = format_date($this->input->post("fecha_nacimiento"));
				
				$data_contacto["telefono"] = $this->input->post("telefono");
				$data_contacto["celular"] = $this->input->post("celular");
				$data_contacto["direccion"] = $this->input->post("direccion");
				$data_contacto["municipio_id"] = $this->input->post("municipio");;

				$data_egresado["carnet"] = $this->input->post("carnet");
				$data_egresado["cedula"] = $this->input->post("cedula");
				$data_egresado["titulado"] = FALSE;
				$data_egresado["trabaja"] = FALSE;
				$data_egresado["carrera_id"] = $this->input->post("carrera");;
				$data_egresado["fecha_egresado"] = $this->input->post("fecha_egresado");

				if($data_persona["sexo"] == "M"){
					$data_usuario["imagen"]="default/male.jpg";
				}else{
					$data_usuario["imagen"]="default/female.jpg";
				}

				$data_usuario["correo"] = $this->input->post("correo");
				$data_usuario["clave"] =  Encrypter::encrypt(generarClave(20));
				$data_usuario["activo"] = FALSE;

				$privacidad["usuario_id"] = $this->modelo->insertarEgresado($data_egresado,$data_persona,$data_usuario,$data_contacto);
				
				$this->load->model("privacidad_model");
				
				$privacidad["foto_perfil"] = "empresas";
				$privacidad["info_contacto"] = "empresas";
				$privacidad["info_ubicacion"] = "empresas";
				$privacidad["info_curriculum"] = "empresas";
				$privacidad["info_adicional"] = "empresas";

				$this->privacidad_model->configurar_privacidad($privacidad);

				echo "<script type='text/javascript'>
					alert('Registrado');
					window.location='". base_url('CPanel') ."';
				</script>";
		
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

			if(!isset($_SESSION["egresado"])){
				show_404();
			}

			#print_r($_POST);
			#exit();
			$this->form_validation->set_rules("cedula","Cedula","trim|max_length[16]|min_length[16]");			
			$this->form_validation->set_rules("nombre","Nombre","trim|required|max_length[45]|min_length[5]");
			$this->form_validation->set_rules("apellido","Apellido","trim|required|max_length[45]|min_length[5]");
			$this->form_validation->set_rules("genero","Genero","trim|required");
			$this->form_validation->set_rules("telefono","Telefono","trim|max_length[9]");
			$this->form_validation->set_rules("celular","Celular","trim|max_length[9]");
			$this->form_validation->set_rules('correo','Correo','trim|required|min_length[10]|max_length[45]|valid_email');
			$this->form_validation->set_rules("telefono","Telefono","trim|max_length[9]");
			$this->form_validation->set_rules("direccion","Direccion","trim|max_length[100]|min_length[6]");
			$this->form_validation->set_rules("municipio","Municipio","trim|required|max_length[10]|min_length[1]");
			$this->form_validation->set_rules("departamento","Departamento","trim|required|max_length[10]|min_length[1]");
			$this->form_validation->set_rules('fecha_nacimiento','Fecha de nacimiento','callback_fechaNacimiento');

			if($this->form_validation->run()==false){
				echo validation_errors();
			}elseif($this->modelo->existe_cedula($this->input->post("cedula"),getUsuarioId())){
				echo "La cedula que estas ingresando ya existe";
			}elseif($this->modelo->existe_correo($this->input->post("correo"),getUsuarioId())){
				echo "El correo que estas ingresando ya existe";
				return FALSE;
			}else{
				
				$this->load->helper("fecha");#HELPER DE FECHA

				$data_persona["persona_id"] = $this->input->post("persona_id");
				$data_persona["nombre"] = $this->input->post("nombre");
				$data_persona["apellido"] = $this->input->post("apellido");
				$data_persona["sexo"] = $this->input->post("genero");
	
				$data_persona["fecha_nacimiento"] = format_date($this->input->post("fecha_nacimiento"));
	
				$data_contacto["contacto_id"]= $this->input->post("contacto_id");
				$data_contacto["telefono"] = $this->input->post("telefono");
				$data_contacto["celular"] = $this->input->post("celular");
				$data_contacto["direccion"] = $this->input->post("direccion");
				$data_contacto["municipio_id"] = $this->input->post("municipio");
				$data_egresado["fecha_egresado"] = $this->input->post("fecha_egresado");
	
				$data_egresado["egresado_id"]= $this->input->post("egresado_id");
				
				$data_egresado["cedula"] = $this->input->post("cedula");
				$data_egresado["titulado"] = $this->input->post("titulado");
				$data_egresado["trabaja"] = $this->input->post("trabaja");
				$data_egresado["carrera_id"] = $this->input->post("carrera");
	
				$data_usuario["usuario_id"]= $this->input->post("usuario_id");
				$data_usuario["correo"] = $this->input->post("correo");
					
				$this->modelo->actualizarEgresado($data_egresado,$data_persona,$data_usuario,$data_contacto);
				
				#Actualizar privacidad
				$this->load->model("privacidad_model");
				
				if($this->privacidad_model->consultar_privacidad(getUsuarioId()) == FALSE){

					$privacidad["usuario_id"] = getUsuarioId();
					$privacidad["foto_perfil"] = "empresas";
					$privacidad["info_contacto"] = "empresas";
					$privacidad["info_ubicacion"] = "empresas";
					$privacidad["info_curriculum"] = "empresas";
					$privacidad["info_adicional"] = "empresas";

					$this->privacidad_model->configurar_privacidad($privacidad);
				}else{

					$privacidad["usuario_id"] = getUsuarioId();
					$privacidad["foto_perfil"] = $this->input->post("visibilidad_foto");
					$privacidad["info_contacto"] = $this->input->post("visibilidad_contacto");
					$privacidad["info_ubicacion"] = $this->input->post("visibilidad_ubicacion");
					$privacidad["info_curriculum"] = $this->input->post("visibilidad_curriculum");
					$privacidad["info_adicional"] = $this->input->post("visibilidad_info_adicional");

					$this->privacidad_model->actualizar_privacidad($privacidad);
				}

				return TRUE;
			}
		}

	}
		
	function enviar_correo_egresado($data){
		$clave = Encrypter::decrypt($data->clave);
		 
		$this->email->from("UniAdmin@gmail.com","UNIVERSIDAD NACIONAL DE INGENIERIA");
		$this->email->reply_to("UniAdmin@gmail.com","UNIVERSIDAD NACIONAL DE INGENIERIA");
		$this->email->to($data->correo);	
		$this->email->subject("Autentificación de Egresados");
		$this->email->message("Hola, tu cuenta ha sido autentificada, tu correo y contraseña para iniciar sesion son los siguientes:
		Correo: $data->correo
		Contraseña: $clave
		Te recomendamos que no borres este correo, en caso de que olvides tu contraseña.");	
			
		if (!$this->email->send()) {
			echo "ERROR, no se pudo enviar el mensaje<br/>";
			echo $this->email->print_debugger();
		}else {
			redirect("Sesion");
		}
	}
		
?>
