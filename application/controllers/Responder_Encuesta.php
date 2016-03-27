<?php defined('BASEPATH') OR exit('No direct script access allowed');
	define("IS_AJAX",isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == 'xmlhttprequest');

	class Responder_Encuesta extends CI_Controller{

		function __construct(){
			parent::__construct();
		}

		function encuesta($id_encuesta){
			
			$this->load->model("encuesta/encuesta_model");
			$encuesta = $this->encuesta_model->leer($id_encuesta);
			if($encuesta == null || $encuesta->num_rows() == 0){
				show_404();
			}

			/*Preguntar si la encuesta ya se ha contestado para evitar la repeticion*/
			$this->load->model("respuesta/resultado_model");
			$this->load->model("egresado_model");
			$id_egresado = $this->egresado_model->consultar_egresado_id(getUsuarioId());
			
			if($this->resultado_model->existe_resultado($id_encuesta, $id_egresado)){
				$this->load->view("templates/header");
				$this->load->view("templates/menu");
				$this->load->view("encuesta/encuesta_respondida");
				$this->load->view("templates/footer");
				return;
			}

			$this->load->model("encuesta/pregunta_model");
			$this->load->model("encuesta/respuesta_sugerida_model");
			
			$preguntas = $this->pregunta_model->listar_preguntas($id_encuesta);
			$respuesta_sugerida = array();

			foreach ($preguntas->result() as $row) {
			
				if($row->categoria_id == "3" || $row->categoria_id == "4"){
					$result = $this->respuesta_sugerida_model->listar($row->pregunta_id);
					if($result != null){
						$respuesta_sugerida[$row->pregunta_id] = $result;
					}
				}
			}

			$data["preguntas"] = $preguntas;
			$data["encuesta"] = $encuesta->row();
			$data["respuesta_sugerida"] = $respuesta_sugerida;
			$data["id_encuesta"] = $id_encuesta;

			$egresado_result = $this->egresado_model->consultar_egresado($id_egresado);
			$data["nombre"] = $egresado_result->row("nombre"). " ". $egresado_result->row("apellido");
			unset($egresado_result);
			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("encuesta/responder_encuesta",$data);
			$this->load->view("templates/footer");
		}

		function guardar_respuestas($id_encuesta){

			/*Validamos si la peticion fue hecha con ajax y validamos los datos*/
			if(IS_AJAX){
				$this->validar();
				return;
			}
			
			/*Tambien validamos los datos cuando la peticion no sea ajax*/
			if($this->validar()){

				$this->load->model("respuesta/respuesta_abierta_model");
				$this->load->model("respuesta/respuesta_cerrada_model");
				$this->load->model("respuesta/respuesta_seleccionada_model");
				$this->load->model("respuesta/resultado_model");
				$this->load->model("egresado_model");

				if($id_encuesta == null || $id_encuesta == ""){
					return;
				}
				
				/**Consultar el ID del egresado*/
				$id_egresado = $this->egresado_model->consultar_egresado_id(getUsuarioId());

				/**Capturar los datos por post*/
				$tipo_pregunta = $this->input->post("tipo_pregunta");
				$textarea = $this->input->post("respuesta");
				$radio = $this->input->post("radio");
				$checkbox = $this->input->post("checkbox");

				/**Arreglo para la tabla resultado*/
				$resultado["encuesta_id"] = $id_encuesta;
				$resultado["egresado_id"] = $id_egresado;//consultar_egresado_id(getUsuarioId());

				$resultado_id = $this->resultado_model->guardar_resultado($resultado);

				foreach ($tipo_pregunta as $key => $value) {
					
					$respuesta["resultado_id"] = $resultado_id;
					$respuesta["pregunta_id"] = $key;

					switch ($value) {

						case '1':// guardar respuesta abierta
							
							$respuesta_abierta["respuesta"] = $textarea[$key];
							$this->respuesta_abierta_model->guardar_respuesta_abierta($respuesta, $respuesta_abierta);
							break;
						case '2':// guardar respuesta cerrada

							$valor = $radio[$key];
							$respuesta_cerrada["valor"] = ($valor == "si") ? true : false;
							$this->respuesta_cerrada_model->guardar_respuesta_cerrada($respuesta, $respuesta_cerrada);
							break;
						case '3':// guardar respuesta seleccion unica

							$respuesta_seleccionada = array();
							foreach ($radio[$key] as $indice => $val) {
								array_push($respuesta_seleccionada,$val);
							}
							$this->respuesta_seleccionada_model->guardar_respuesta_seleccionada($respuesta, $respuesta_seleccionada);
							break;
						case '4':// guardar respuesta seleccion multiple

							$respuesta_seleccionada = array();
							foreach ($checkbox[$key] as $indice => $val) {
								array_push($respuesta_seleccionada,$val);
							}
							$this->respuesta_seleccionada_model->guardar_respuesta_seleccionada($respuesta, $respuesta_seleccionada);
							break;
					}
				}

				/*Mostrar mensaje y redireccionar al perfil*/
				echo "<script type='text/javascript'>
				alert('Gracias por tu participacion y tiempo');
				window.location = '" . base_url('perfil') . "';
				</script>";
			}
						
		}

		function validar(){

			$checkbox = $this->input->post("checkbox");
			$radio = $this->input->post("radio");
			$categoria = $this->input->post("tipo_pregunta");
			$preguntas = $this->input->post("preguntas");

			foreach ($categoria as $key => $value) {
				
				if($value == '2' || $value == '3'){

					if(!isset($radio[$key]) || count($radio[$key]) == 0){
						echo "Debes seleccionar una opción en la pregunta: ". $preguntas[$key];
						return false;
					}
				}elseif($value == '4'){
					if(!isset($checkbox[$key]) || count($checkbox[$key]) == 0){
						echo "Debes seleccionar al menos una opción en la pregunta: ". $preguntas[$key];
						return false;
					}
				}
			}
			return true;
		}
	}
?>