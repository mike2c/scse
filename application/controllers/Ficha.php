<?php defined('BASEPATH') OR exit('No direct script access allowed');
	define("IS_AJAX",isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == 'xmlhttprequest');

	class Ficha extends CI_Controller{

		function __construct(){
			parent::__construct();
			
			$this->load->model("ficha_model","ficha");
			$this->load->model("egresado_model");
			$this->load->library("Correo");
			$this->load->model("mensaje_model");
			if(!isset($_SESSION["publicador"]) && !isset($_SESSION["empresa"]) && !isset($_SESSION["administrador"])){
				show_404();
			}
		}

		function validarCampos(){

			$this->load->library("form_validation");

			$this->form_validation->set_rules("descripcion","Descripcion","required|min_length[10]");
			$this->form_validation->set_rules("fecha_alta","Fecha de Alta","required|max_length[10]|min_length[10]");
			$this->form_validation->set_rules("cargo","Denominacion del cargo","required|max_length[60]|min_length[10]");
			$this->form_validation->set_rules("ubicacion","Ubicacion del Cargo","required|max_length[40]|min_length[6]");
			$this->form_validation->set_rules("cantidad","Cantidad de Puestos","required|max_length[20]|min_length[1]");
			$this->form_validation->set_rules("jefe","Jefe inmediato","required|max_length[30]|min_length[6]");
			$this->form_validation->set_rules("a_cargo","Personal a Cargo","required|min_length[10]");
			$this->form_validation->set_rules("finalidad","Finalidad del Puesto","required|min_length[10]");
			$this->form_validation->set_rules("funciones","Funciones y Responsabilidades","required|max_length[300]|min_length[10]");
			$this->form_validation->set_rules("requisitos","Requisitos del Puesto","required|min_length[10]");
			$this->form_validation->set_rules("experiencia","Experiencia Necesario","required|max_length[100]|min_length[4]");
			$this->form_validation->set_rules("competencia","Competencia","required|min_length[10]");
			$this->form_validation->set_rules("carreras[]","Carreras","required");

			if($this->form_validation->run()==FALSE){
				echo validation_errors();
			}
		}
		
		#CREANDO UNA FICHA OCUPACIONAL NUEVA	
		function Crear(){
			
			if(IS_AJAX){
				if(is_string($this->validarCampos())){
					echo $this->validarCampos();
				}
			}else{
				if($this->insertar() == true){
					echo "<script>
						alert('Publicación guardada correctamente');
						window.location='" . base_url("Perfil") . "';	
					</script>";
				}
			}
		}

		function Listar(){

			$this->load->model("ficha_model","ficha");
			$this->load->model("listas_model","lista");

			$data["fichas"] = $this->ficha->listar(array("usuario_id"=>getUsuarioId()));
			$data["carreras"] = $this->lista->listarCarreras();

			if(IS_AJAX){
				$this->load->view("ficha/listar_fichas",$data);
				$this->load->view("ficha/crear_ficha",$data);
			}
		}

		function Editar($publicacion_id){

			if(IS_AJAX){
				
				$this->load->model("ficha_model","ficha");
				$this->load->model("listas_model","lista");
				$this->load->helper("texto");

				$result = $this->ficha->listar(array("usuario_id"=>getUsuarioId(),"publicacion_id"=>$publicacion_id));
				if($result != null){
					$data["ficha"] = $result->row();
				}
				
				$data["carrera"] = $this->ficha->listarCarrera($publicacion_id);
				$data["carreras"] = $this->lista->listarCarreras();
				$this->load->view("ficha/editar_ficha",$data);
			}
		}

		function Eliminar(){

			$this->load->model("ficha_model","ficha");
			$publicacion = $this->input->post("publicacion");
			$usuario_id = getUsuarioId();
			if(empty($publicacion)){
				return;
			}
			if(is_array($publicacion)){
				foreach ($publicacion as $key => $value) {
					$this->ficha->eliminarFicha($value,$usuario_id);
				}
			}else{
				$this->ficha->eliminarFicha($value,$usuario_id);
			}			
		}

		private function Insertar(){

			try{
				$this->load->model("ficha_model","ficha");
				$this->load->helper(array("imagen","fecha"));

				$img = escaparImagen("imagen");
				$data_imagen = array();
				if($img != null){
					$data_imagen["imagen"]= $img["imagen"];
					$data_imagen["tipo"]= $img["tipo"];
				}else{
					$data_imagen["imagen"]= null;
					$data_imagen["tipo"]= null;
				}
				
				$data_publicacion["imagen_publicacion_id"] = $this->ficha->insertarImagen($data_imagen);
				$data_publicacion["descripcion"] = nl2br($this->input->post("descripcion"));
				$data_publicacion["fecha_publicacion"] = date("Y-m-d");
				$data_publicacion["fecha_alta"] = format_date($this->input->post('fecha_alta'));
				$data_publicacion["usuario_id"] = getUsuarioId();
				$data_publicacion["visible"] = true;
				
				$data_ficha["publicacion_id"] = $this->ficha->insertarPublicacion($data_publicacion);

				$data_ficha["cargo"]= $this->input->post("cargo");
				$data_ficha["ubicacion"]= $this->input->post("ubicacion");
				$data_ficha["cantidad"]= $this->input->post("cantidad");
				$data_ficha["jefe"]= $this->input->post("jefe");
				$data_ficha["a_cargo"]= $this->input->post("a_cargo");
				$data_ficha["finalidad"]= nl2br($this->input->post("finalidad"));
				$data_ficha["funciones"]= nl2br($this->input->post("funciones"));
				$data_ficha["requisitos"]= nl2br($this->input->post("requisitos"));
				$data_ficha["experiencia"]= $this->input->post("experiencia");
				$data_ficha["competencia"]= nl2br($this->input->post("competencia"));
				
				$this->ficha->insertar($data_ficha);
				$data_carrera = $this->input->post("carreras[]");

				$this->ficha->insertarFiltro($data_ficha);
				$this->ficha->actualizarFiltro($data_carrera,$data_ficha["publicacion_id"]);
				
				$this->enviarCorreo($this->input->post("carreras[]"));
			}catch(Exception $e){
				return false;
			}
			
			return true;	
		}
		
		function enviarCorreo($carreras){
			$carreras_id["carrera_id"] = $carreras;			
			$query=$this->egresado_model->listar("","","",$carreras_id,"");
			$correoInfo = null;
			$cont = 0 ;
			if($query->num_rows() > 0){
				foreach($query->result() as $datos){
					$correoInfo["destinatario"][$cont] = $datos->correo;
					$cont +=1;
				}
			}else{
				return false;
			}
			$correoInfo["asunto"] = "NUEVO FICHA OCUPACIONAL PUBLICADA";
			$correoInfo["mensaje"] = "La Universidad Nacional de Ingeniería ha publicado una nueva Ficha Ocupacional, puedes obtener mas información sobre ella en el siguiente enlace: ". base_url('publicaciones/BolsaDeTrabajo') ;
			$this->correo->correoPublicaciones($correoInfo);
			$msgInfo["asunto"] = "NUEVO FICHA OCUPACIONAL PUBLICADA";
			$msgInfo["mensaje"] = "La Universidad Nacional de Ingeniería ha publicado una nueva Ficha Ocupacional, puedes obtener mas información sobre ella en el siguiente enlace: <a href='". base_url('publicaciones/BolsaDeTrabajo')."'>Fichas Ocupacionales</a>" ;
			$msgInfo["fecha_envio"] = date("Y-m-d");
			$msgInfo["usuario_id"] = getUsuarioId();
			$destinoInfo["mensaje_id"]= $this->mensaje_model->insertarMensaje($msgInfo);
			foreach($query->result() as $datos){
				$this->mensaje_model->insertarDestinoMensaje(array("mensaje_id"=>$destinoInfo["mensaje_id"],"usuario_id"=>$datos->usuario_id));
				$this->mensaje_model->registrarEnTablaEliminados($datos->usuario_id,$destinoInfo["mensaje_id"]);
			}
		}

		function Actualizar(){
			if(IS_AJAX){
				echo $this->validarCampos();
			}else{

				$this->load->helper("fecha");
				$this->load->helper("imagen");

				$data_publicacion["publicacion_id"] = $this->input->post("publicacion_id");
				$data_publicacion["descripcion"] = nl2br($this->input->post("descripcion"));
				$data_publicacion["fecha_publicacion"] = date("Y-m-d");
				$data_publicacion["fecha_alta"] = format_date($this->input->post("fecha_alta"));
						
				$img = escaparImagen("imagen");
				$data_imagen = array();

				if($img != null){
					$data_imagen["imagen"]= $img["imagen"];
					$data_imagen["tipo"]= $img["tipo"];
					$data_imagen["imagen_publicacion_id"] = $this->input->post("imagen_publicacion_id");
					$this->ficha->actualizarImagen();
				}
							
				$data_ficha["ficha_id"] = $this->input->post("ficha_id");
				$data_ficha["cargo"]= $this->input->post("cargo");
				$data_ficha["ubicacion"]= $this->input->post("ubicacion");
				$data_ficha["cantidad"]= $this->input->post("cantidad");
				$data_ficha["jefe"]= $this->input->post("jefe");
				$data_ficha["a_cargo"]= $this->input->post("a_cargo");
				$data_ficha["finalidad"]= nl2br($this->input->post("finalidad"));
				$data_ficha["funciones"]= nl2br($this->input->post("funciones"));
				$data_ficha["requisitos"]= nl2br($this->input->post("requisitos"));
				$data_ficha["experiencia"]= $this->input->post("experiencia");
				$data_ficha["competencia"]= nl2br($this->input->post("competencia"));
				
				$data_carrera = $this->input->post("carreras[]");
				$this->ficha->actualizar($data_publicacion,$data_ficha,$data_carrera);

				echo "
					<script stype='text/javascript'>
						alert('Actualizada');
						window.location='". base_url("Perfil")."';
					</script>";
			}
		}

		function CambiarVisibilidad(){
			
			if(!empty($_POST["visible"]) && !empty($_POST["publicacion"])){
			
				$visible = ($this->input->post("visible") == "true") ? 0 : 1;
				echo $visible;	
				$data["visible"] = $visible;
				$data["publicacion_id"] = $this->input->post("publicacion");
				$this->ficha->cambiarVisibilidad($data);
			}
		}
	}
?>