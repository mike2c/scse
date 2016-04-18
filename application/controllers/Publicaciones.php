<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Publicaciones extends CI_Controller{

		function __construct(){
			parent::__construct();
			$this->load->library("session");
			$this->load->helper(array("sesion","fecha"));

		}

		public function Becas(){
			$this->load->library("calendar");
	
			$this->load->model("beca_model");
			$this->load->model("listas_model");

			if(isset($_POST["carrera"]) && !empty($_POST["carrera"])){
			
				$data["becas"] = $this->beca_model->consultar_por_carrera($this->input->post("carrera"));
					$data["carreras_marcadas"] = $this->input->post("carrera");
			}else{
				$data["becas"]= $this->beca_model->listar(array("visible"=>TRUE,"fecha_alta >="=>date("Y-m-d")),"","fecha_publicacion");
			}
			
			$data["carreras"] = $this->listas_model->listarCarreras();
			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("pages/becas",$data);
			$this->load->view("templates/footer");
		}

		public function bolsa_de_trabajo(){
			if (sesionIniciada() && esEgresado()) {
				$this->load->model("ficha_model");
				$this->load->model("listas_model");

				if(isset($_POST["carrera"]) && !empty($_POST["carrera"])){
					$data["fichas"] = $this->ficha_model->consultar_publicadas(getUsuarioId(),$this->input->post("carrera"));
						$data["carreras_marcadas"] = $this->input->post("carrera");
				}else{
					$data["fichas"]= $this->ficha_model->consultar_publicadas(getUsuarioId());
				}

				$data["carreras"] = $this->listas_model->listarCarreras();
				$this->load->view("templates/header");
				$this->load->view("templates/menu");
				$this->load->view("pages/bolsa_de_trabajo",$data);
				$this->load->view("templates/footer");
			}else{
				show_404();
			}
		}
		
		public function aplicarFicha(){
			
			if(isset($_POST["ficha_id"])){

				$this->load->model("mensaje_model");
				$this->load->model("curriculum_model");
				$this->load->model("ficha_model");
				$this->load->library("Correo");

				$id_user = getUsuarioId();
				$id_egresado = $this->curriculum_model->getEgresadoID($id_user)->egresado_id;
				
				if($this->curriculum_model->existe($id_egresado)){

					$destinatario = $this->ficha_model->consultar_creador($this->input->post("ficha_id"))->row();
				
					$data_correo["destinatario"] = $destinatario->correo;
					$data_correo["asunto"] = "Alguien ha aplicado al puesto Ofertado";
					$data_correo["mensaje"] = getNombreCompleto()." ha aplicado a tu Ficha Ocupacional, puedes ver su curriculo en el siguiente enlace: <a href='". base_url('curriculum/ver/'.getUsuarioId().'')."'>Curriculo</a>" ;
					$this->correo->correoPublicaciones($data_correo);
					
					$data_mensaje["asunto"] = $data_correo["asunto"];
					$data_mensaje["mensaje"] = $data_correo["mensaje"];
					$data_mensaje["fecha_envio"] = date("Y-m-d");
					$data_mensaje["usuario_id"] = getUsuarioId();

					$destinoInfo["mensaje_id"]= $this->mensaje_model->insertarMensaje($data_mensaje);
					$this->mensaje_model->insertarDestinoMensaje(array("mensaje_id"=>$destinoInfo["mensaje_id"],"usuario_id"=>$destinatario->usuario_id));
					$this->mensaje_model->registrarEnTablaEliminados($destinatario->usuario_id,$destinoInfo["mensaje_id"]);
					
					$this->ficha_model->registrar_aplicacion(getUsuarioId(),$this->input->post("ficha_id"));

					?>
						<script type="text/javascript">
							alert("Has aplicado con exito para este cargo. Tu curriculum ha sido enviado la creador de esta publicación porfavor mantente en contacto con tu correo o nuestro sistema para cualquier respuesta.");
							window.location = "<?=base_url('Publicaciones/bolsa_de_trabajo')?>";
						</script>
					<?
					redirect("Publicaciones/bolsa_de_trabajo");
				}else{
					?>
						<script type="text/javascript">
							alert("Necesitas crear un curriculum antes de hacer uso de esta funcion");
							if(confirm("¿Deseas crear tu curriculum ahora?")){
								window.location = "<?=base_url('curriculum')?>";
							}else{
								window.location = "<?=base_url('Publicaciones/bolsa_de_trabajo')?>";
							}
							//window.location = "<?=base_url('Publicaciones/bolsa_de_trabajo')?>";
						</script>
					<?
				}				
			}
		}

		public function Cursos(){

			$this->load->model("curso_model");
			$this->load->model("listas_model");
			$this->load->helper("fecha");
			
			if(isset($_POST["carrera"]) && !empty($_POST["carrera"])){
			
				$data["cursos"] = $this->curso_model->consultar_por_carrera($this->input->post("carrera"));
				$data["carreras_marcadas"] = $this->input->post("carrera");
			}else{
				$data["cursos"] = $this->curso_model->listar(array("visible"=>TRUE,"fecha_alta >="=>date("Y-m-d")),"","fecha_publicacion");
			}
			
			$data["carreras"] = $this->listas_model->listarCarreras();
			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("pages/cursos",$data);
			$this->load->view("templates/footer");
		}


	}

?>