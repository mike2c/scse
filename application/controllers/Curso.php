<?php defined('BASEPATH') OR exit('No direct script access allowed');
	define("IS_AJAX",isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == 'xmlhttprequest');
	
	class Curso extends CI_Controller{

		function __construct(){
			parent::__construct();
			
			$this->load->library("session");
			$this->load->library("Correo");
			$this->load->helper(array("imagen","fecha","sesion","texto"));
			$this->load->model("egresado_model");
			$this->load->model("mensaje_model");
			if (!sesionIniciada()) {
				exit("ERROR DE ACCESO, no hay una sesion activa");
			}
		}

		function Index(){
			$this->listar();
		}

		function validarCampos(){

			$this->load->library("form_validation");
			$this->form_validation->set_rules("descripcion","Descripcion","required|min_length[10]");
			$this->form_validation->set_rules("nombre_curso","Nombre del curso","required|min_length[10]|max_length[80]");
			$this->form_validation->set_rules("fecha_alta","Fecha de Alta","required|max_length[10]|min_length[10]");
			$this->form_validation->set_rules("carreras[]","Carreras del Curso","required");
			$this->form_validation->set_rules("costo","Costo del Curso","numeric|required|min_length[1]|max_length[10]");
			$this->form_validation->set_rules("duracion","Duracion del Curso","required|integer");

			if ($this->form_validation->run()==FALSE) {
				echo validation_errors();
			}
		}

		function Crear(){
			
			$data["carreras"] = $this->lista->listarCarreras();
			$data["errores"] = $this->validarCampos();

			if(IS_AJAX){
				if(!$data["errores"]==TRUE){
					$this->load->view("ficha/crear_ficha",$data);
				}
			}
		}

		function Insertar(){
			
			if(IS_AJAX){
				$this->validarCampos();
			}else{
				if($this->validarCampos() == ""){

					$this->load->model("curso_model");

					$data_publicacion["usuario_id"] = getUsuarioId();
					$data_publicacion["descripcion"] = nl2br($this->input->post("descripcion"));
					$data_publicacion["fecha_publicacion"] = date("Y-m-d");
					$data_publicacion["fecha_alta"] =  format_date($this->input->post("fecha_alta"));
					$data_publicacion["visible"] = TRUE;

					$img = escaparImagen("imagen");
					if($img != null){
						$data_imagen["imagen"] = $img["imagen"];
						$data_imagen["tipo"] = $img["tipo"];
					}else{
						$data_imagen["imagen"] = null;
						$data_imagen["tipo"] = null;
					}

					$data_curso["costo"] = $this->input->post("costo");
					$data_curso["duracion"] = $this->input->post("duracion");
					$data_curso["nombre_curso"] = $this->input->post("nombre_curso");
					$data_curso["libre"] = FALSE;

					if (isset($_POST["libre"])) {
						$data_curso["libre"] = TRUE;
					}
					
					$data_carrera = $this->input->post("carreras[]");
					$data_publicacion["imagen_publicacion_id"] = $this->curso_model->insertarImagen($data_imagen);
					$data_curso["publicacion_id"]= $this->curso_model->insertarPublicacion($data_publicacion);

					$this->curso_model->insertarFiltro($data_curso);
					$this->curso_model->actualizarFiltro($data_carrera,$data_curso["publicacion_id"]);
					$this->curso_model->insertar($data_curso);
					
					$this->enviarCorreo($this->input->post("carreras[]"));
					echo "<script>
						alert('Publicacion guardada correctamente');
						window.location= '". base_url('Perfil') ."?page=cursos';
					</script>";
				}
			}
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
			$correoInfo["asunto"] = "NUEVO CURSO PUBLICADO";
			$correoInfo["mensaje"] = "La Universidad Nacional de Ingeniería ha publicado un nuevo Curso, puedes obtener mas información sobre el en el siguiente enlace: ". base_url('publicaciones/Curso') ;
			$this->correo->correoPublicaciones($correoInfo);
			$msgInfo["asunto"] = "NUEVO CURSO PUBLICADO";
				$msgInfo["mensaje"] = "La Universidad Nacional de Ingeniería ha publicado un nuevo Curso, puedes obtener mas información sobre el en el siguiente enlace: <a href='". base_url('publicaciones/Curso').">Cursos</a>" ;
				$msgInfo["fecha_envio"] = date("Y-m-d");
				$msgInfo["usuario_id"] = getUsuarioId();
				$destinoInfo["mensaje_id"]= $this->mensaje_model->insertarMensaje($msgInfo);
			foreach($query->result() as $datos){
				$this->mensaje_model->insertarDestinoMensaje(array("mensaje_id"=>$destinoInfo["mensaje_id"],"usuario_id"=>$datos->usuario_id));
				$this->mensaje_model->registrarEnTablaEliminados($datos->usuario_id,$destinoInfo["mensaje_id"]);
			}
		}
		
		function Listar(){
			$this->load->model("curso_model");
			$this->load->model("listas_model","lista");
		
			$data["cursos"] = $this->curso_model->listar(array("usuario_id"=>getUsuarioId()));
			$data["carreras"] = $this->lista->listarCarreras();

			if(IS_AJAX){
				$this->load->view("cursos/crear_curso",$data);
				$this->load->view("cursos/listar_cursos",$data);
			}
		}

		function Editar($publicacion_id){
			$this->load->model("curso_model");
			$data["curso"] = $this->curso_model->listar(array("usuario_id"=>getUsuarioId(),"publicacion_id"=>$publicacion_id));
			if($data["curso"] != null){
				$data["curso"] = $data["curso"]->row();
			}
			$data["carrera"] = $this->curso_model->listarCarrera($publicacion_id);
			if(IS_AJAX){
				$this->load->view("cursos/editar_curso",$data);	
			}
		}

		function Actualizar(){
			if(IS_AJAX){
				$this->validarCampos();
			}else{

				$this->load->model("curso_model");
				
				$data_publicacion["publicacion_id"] = $this->input->post("publicacion_id");
				$data_publicacion["usuario_id"] = getUsuarioId();
				$data_publicacion["descripcion"] = nl2br($this->input->post("descripcion"));
				$data_publicacion["fecha_publicacion"] = date("Y-m-d");
				$data_publicacion["fecha_alta"] =  format_date($this->input->post("fecha_alta"));

				$img = escaparImagen("imagen");
				if($img != null){
					$data_imagen["imagen"] = $img["imagen"];
					$data_imagen["tipo"] = $img["tipo"];
					$data_imagen["imagen_publicacion_id"] = $this->input->post("imagen_publicacion_id");
					$this->curso_model->actualizarImagen($data_imagen);
				}
			
				$data_curso["costo"] = $this->input->post("costo");
				$data_curso["duracion"] = $this->input->post("duracion");
				$data_curso["curso_id"] = $this->input->post("curso_id");

				if (!$this->input->post("libre")=="") {
					$data_curso["libre"] = TRUE;
				}else{
					$data_curso["libre"] = FALSE;
				}
				
				$data_carrera = $this->input->post("carreras[]");

				$this->curso_model->actualizarPublicacion($data_publicacion);
				$this->curso_model->actualizar($data_curso);
				$this->curso_model->actualizarFiltro($data_carrera,$data_publicacion["publicacion_id"]);

				echo "<script type='text/javascript'>
				alert('Publicación registrada correctamente');
				window.location='". base_url('Perfil') ."?page=cursos';
				</script>";
			}
			
			
		}

		function Eliminar(){
			
			$this->load->model("curso_model");
			$cursos = $this->input->post("publicacion");
			$usuario_id = getUsuarioId();
			if(empty($cursos)){
				return;
			}
			if(is_array($cursos)){
				foreach ($cursos as $key => $value) {
					$this->curso_model->eliminar($value,$usuario_id);
				}
			}else{
				$this->curso_model->eliminar($value,$usuario_id);
			}
		}
	}
?>