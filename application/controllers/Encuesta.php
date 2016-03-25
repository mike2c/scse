<?php defined('BASEPATH') OR exit('No direct script access allowed');
	define("IS_AJAX",isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == 'xmlhttprequest');

	class Encuesta extends CI_Controller{

		function __construct(){
			parent::__construct();
			
			if(!esPublicador() && !esAdministrador()){
				show_404();
			}
			
		}

		function crear_encuesta(){

			$this->load->model("encuesta/categoria_pregunta_model");
			$this->load->model("listas_model","listas");
			
			$data["carreras"] = $this->listas->listarCarreras();
			
			$result = $this->categoria_pregunta_model->listar_categorias();
			if(is_null($result) || $result->num_rows() == 0){
				exit("Ha ocurrido un error y no se han podido cargar las categorias");
			}
			$data["categorias"] = $result->result_array();

			// Cargar las vistas
			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("encuesta/crear_encuesta",$data);
		}

		function insertar(){
			
			/**Si recibimos una peticion ajax entonces validamos los datos*/	
			
			if(IS_AJAX){$this->validar();return;}
		
			/**Si no es una peticion ajax comprobamos que los datos ingresados tambien son validos*/
			
			if($this->validar() == true){

				/*Cargando los modelos para guardar en la base de datos*/
			
				$this->load->model("encuesta/encuesta_model");
				$this->load->model("encuesta/pregunta_model");
				$this->load->model("encuesta/respuesta_sugerida_model");
			
				/*Capturamos los datos para la tabla encuesta*/

				$encuesta["objetivo"] = $this->input->post("objetivo");
				$encuesta["titulo"] = $this->input->post("titulo");
				$encuesta["descripcion"] = $this->input->post("descripcion");
				$encuesta["usuario_id"] = getUsuarioId();
				$id_encuesta = $this->encuesta_model->insertar($encuesta);

				/*Capturamos los datos para guardar en la tabla de pregunta y respuesta_suegerida*/

				$preguntas = $_POST["pregunta"];
				$texto_ayuda = $_POST["texto_ayuda"];
				$tipo_pregunta = $_POST["tipo_pregunta"];
				$carreras = $_POST["carreras"];
				$opciones = (isset($_POST["opciones"])) ? $_POST["opciones"] : null;
	 
				foreach ($preguntas as $key => $value) { 

					$pregunta_actual["encuesta_id"] = $id_encuesta;
					$pregunta_actual["categoria_id"] = $tipo_pregunta[$key];
					$pregunta_actual["pregunta"] = $value;
					$pregunta_actual["texto_ayuda"] = $texto_ayuda[$key];

					$id_pregunta = $this->pregunta_model->insertar($pregunta_actual);

					/* Si el tipo de pregunta es 3 o 4 significa que son de seleccion */
					if($tipo_pregunta[$key] == "3" || $tipo_pregunta[$key] == "4"){

						/* Preguntamos si hay opciones en el indice de esa pregunta @$Key */
						if($opciones != null && isset($opciones[$key])){
							
							if(is_array($opciones[$key])){

								/* Recorremos todas las opciones y las guardamos */
								foreach ($opciones[$key] as $key => $value) {
									
									$opcion["pregunta_id"] = $id_pregunta;
									$opcion["opcion"] = $value;

									$this->respuesta_sugerida_model->insertar($opcion);// guardamos la opcion
								}

							}else{

								$opcion["pregunta_id"] = $id_pregunta;
								$opcion["opcion"] = $$opciones[$key];

								$this->respuesta_sugerida_model->insertar($opcion);// guardamos la opcion

							}
						}
					}
				}

				/**Relacionamos la encuesta con las carreras*/
				foreach ($carreras as $key => $value) {
					
					$carrera_encuesta["encuesta_id"] = $id_encuesta;
					$carrera_encuesta["carrera_id"] = $value;
					$this->encuesta_model->agregar_carrera($carrera_encuesta);
				}

				#Redireccionar al usuario
				?>	
					<script type="text/javascript">
						alert("Encuesta guardada");
						window.location = "<?=base_url('encuesta/listar_encuestas')?>";
					</script>
				<?
			}
			
		}	

		function eliminar_encuesta($id_encuesta){
			
			?><!--Preguntamos si quiere eliminar la cuenta en realidad-->
				<script type="text/javascript">
					if(!confirm("¿Esta seguro que desea eliminar esta encuesta? \n Toda la información relacionada con esta encuesta se perdera asi como las respuestas y resultados de los egresados.")){
						window.location = "<?=base_url('encuesta/listar_encuestas')?>";
					}
				</script>
			<?

			/*Continamos con el proceso para eliminar la encuesta,
			cargamos los modelos*/
			$this->load->model("encuesta/encuesta_model");
			$this->load->model("encuesta/pregunta_model");
			$this->load->model("resultado/resultado_model");
			$this->load->model("resultado/respuesta_model");

		}

		function encuestas_sin_aplicar($egresado_id){

			return  $this->db->query("select encuesta.encuesta_id, objetivo, descripcion 
				from 
				encuesta,resultado 
				where 
				encuesta.encuesta_id = resultado.resultado_id and resultado.resultado_id != $egresado_id");

		}

		function listar_encuestas(){

			$this->load->model("encuesta/encuesta_model");
			$this->load->model("encuesta/pregunta_model");

			$encuestas = $this->encuesta_model->listar_por_publicador(getUsuarioId());
			$no_preguntas = array();/*Numero de preguntas*/
			$carreras = array();

			if($encuestas != null && $encuestas->num_rows() > 0){

				foreach ($encuestas->result() as $row) {

					$no_preguntas[$row->encuesta_id] = $this->pregunta_model->contar_preguntas($row->encuesta_id);
					$carreras[$row->encuesta_id] = $this->encuesta_model->listar_carreras($row->encuesta_id);
					$data["total_egresados"][$row->encuesta_id] = $this->encuesta_model->total_egresados_a_encuestar($row->encuesta_id);
					$data["egresados_encuestados"][$row->encuesta_id] = $this->encuesta_model->contar_egresados_encuestados($row->encuesta_id);
				}
			}

			$data["carreras"] = $carreras;
			unset($carreras);
			$data["encuestas"] = $encuestas;
			$data["no_preguntas"] = $no_preguntas;

			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("encuesta/listar_encuestas",$data);
			$this->load->view("templates/footer");
		}

		function respuestas($id_encuesta){
			
			#cargar librerias
			$this->load->library("Usuarios/Egresado.php");
			$this->load->library("Encuesta/Pregunta.php");
			$this->load->library("Encuesta/Respuesta.php");
			
			#cargar modelos
			$this->load->model("respuesta/resultado_model");
			$this->load->model("encuesta/pregunta_model");
			$this->load->model("encuesta/encuesta_model");
			$this->load->model("respuesta/respuesta_abierta_model");

			$rsegresados = $this->resultado_model->listar_encuestados($id_encuesta);
			$rspreguntas = $this->pregunta_model->listar_preguntas_abiertas($id_encuesta);

			$data["egresados"] = array();
			$data["preguntas"] = array();
			$respuestas[][] = array();
		
			#cargamos todas las preguntas
			foreach ($rspreguntas->result() as $row) {
				
				$pregunta = new Pregunta($row->pregunta, $row->pregunta_id);
				$data["preguntas"][] = $pregunta;
			}

			#cargamos todos los encuestados
			foreach ($rsegresados->result() as $row) {
					
				$egresado = new Egresado();
				$egresado->setIdEgresado($row->egresado_id);
				$egresado->setNombre($row->nombre);
				$egresado->setApellido($row->apellido);
				$data["egresados"][] = $egresado;

				foreach ($data["preguntas"] as $key => $p) {
					
					$respuestas[$egresado->getIdEgresado()][$p->getIdPregunta()] = $this->respuesta_abierta_model->consultar_respuesta($egresado->getIdEgresado(),$p->getIdPregunta());
				}
			}

			$data["respuestas"] = $respuestas;

			/*Eliminamos las variables que ya no necesiamos*/
			unset($rsegresados);
			unset($rspreguntas);

			/*Cargar las vistas*/
			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("encuesta/leer_respuestas",$data);
			$this->load->view("templates/footer");
		}

		public function resultado($idEncuesta){

			#cargar los modelos a utilizar
			$this->load->model("encuesta/encuesta_model");
			$this->load->model("encuesta/pregunta_model");
			$this->load->model("encuesta/respuesta_sugerida_model");
			$this->load->model("respuesta/respuesta_model");
			$this->load->model("respuesta/respuesta_seleccionada_model");
			$this->load->model("respuesta/respuesta_abierta_model");
			$this->load->model("respuesta/respuesta_cerrada_model");

			$encuesta = $this->encuesta_model->leer($idEncuesta)->row();
			$preguntas = $this->pregunta_model->listar_preguntas($idEncuesta);
			$total_egresados = $this->encuesta_model->contar_egresados_encuestados($idEncuesta);
			$opciones = array();//Para guardar las opciones que tienen las respuestas cerradas
			$resultados = array();//Para guardar los datos numericos de los resultados de las encuestas

			//Leemos las respuestas
			foreach ($preguntas->result() as $row) {
				
				if($row->categoria_id == "3" || $row->categoria_id == "4"){

					$opciones[$row->pregunta_id] = $this->respuesta_sugerida_model->listar_opciones($row->pregunta_id);
				}else if($row->categoria_id == "2"){
					
					$respuestas_cerradas[$row->pregunta_id]["si"] = $this->respuesta_cerrada_model->resultado($row->pregunta_id, 1);
					
					$respuestas_cerradas[$row->pregunta_id]["no"] = $this->respuesta_cerrada_model->resultado($row->pregunta_id, 0);
					
				}
			}

			#consultar respuestas por pregunta
			foreach ($opciones as $rs) {
				foreach ($rs->result() as $row) {
					$respuestas[$row->respuesta_sugerida_id] = $this->respuesta_seleccionada_model->numero_respuestas($row->respuesta_sugerida_id);
				}
			}

			foreach($preguntas->result() as $row){

				if(isset($opciones[$row->pregunta_id])){
					#echo "<h3>$row->pregunta</h3>";
					foreach ($opciones[$row->pregunta_id]->result() as $o) {
					
					#	echo "<p>$o->opcion</p>";
					}
				}
			}

			$data["encuesta"] = $encuesta;
			$data["total_egresados"] = $total_egresados;
			$data["preguntas"] = $preguntas;
			$data["opciones"] = $opciones;
			$data["carreras"] = $this->encuesta_model->listar_carreras($idEncuesta);
			
			if(isset($respuestas)){
				$data["respuestas"] = $respuestas;
				unset($respuestas);
			}
			if(isset($respuestas_cerradas)){
				$data["respuestas_cerradas"] = $respuestas_cerradas;
				unset($respuestas_cerradas);
			}
			
			unset($encuesta);
			unset($total_egresados);
			unset($preguntas);
			unset($opciones);
			
			#Cargamos las vistas	
			$this->load->view("templates/header");
			$this->load->view("templates/menu");
			$this->load->view("encuesta/resultado_encuesta",$data);
			$this->load->view("templates/footer");
		}

		private function validar(){
			
			$this->load->library("form_validation");
			$this->load->helper("form_helper");

			$this->form_validation->set_rules("pregunta[]","pregunta","required|max_length[300]|min_length[10]");
			$this->form_validation->set_rules("texto_ayuda[]","texo de ayuda","max_length[100]|min_length[10]");
			$this->form_validation->set_rules("tipo_pregunta[]","tipo de pregunta","required|integer|min_length[1]");
			$this->form_validation->set_rules("objetivo","objetivo","required|trim|max_length[300]|min_length[10]");
			$this->form_validation->set_rules("descripcion","descripcion","trim|max_length[300]|min_length[10]");
			$this->form_validation->set_rules("titulo","titulo","required|trim|max_length[300]|min_length[10]");
			$this->form_validation->set_rules("carreras[]","carreras","required|max_length[100]|min_length[1]");

			if($this->form_validation->run() == false){
				echo validation_errors();
				return false;
			}

			/*Programar mas validaciones*/
			$preguntas = $_POST["pregunta"];
			$tipo_pregunta = $_POST["tipo_pregunta"];
			$opciones = (isset($_POST["opciones"])) ? $_POST["opciones"] : null;

			foreach ($preguntas as $key => $value) {
				
				if($tipo_pregunta[$key] == "3" || $tipo_pregunta[$key] == "4"){
					
					if(!isset($opciones[$key]))							{
						echo "<p>Porfavor ingrese opciones para la pregunta: <br> " . $value . "</p>";
						return false;
					}
				}
			}

			return true;
		}

		function grafico($idPregunta){

			#cargar modelos
			$this->load->model("encuesta/pregunta_model");
			$this->load->model("respuesta/respuesta_seleccionada_model");
			$this->load->model("respuesta/respuesta_cerrada_model");
			$this->load->model("encuesta/respuesta_sugerida_model");

			#cargar helpers
			$this->load->helper("graficos_helper");

			$pregunta = $this->pregunta_model->consultar_pregunta($idPregunta);
			if($pregunta == null) return;

			#cargamos el plugin de javascript para crear los graficos
			$this->load->view("templates/header");
						
			$data["pregunta"] = $pregunta->pregunta;
		
			if($pregunta->categoria_id == '2'){

				$valores[0]["name"] = "si";
				$valores[0]["y"] = $this->respuesta_cerrada_model->resultado($idPregunta, 1);
				$valores[1]["name"] = "no";
				$valores[1]["y"] = $this->respuesta_cerrada_model->resultado($idPregunta, 0);
				
				$data["data"] = $valores;
				
				$this->load->view("encuesta/grafico_pastel", $data);
				$this->load->view("templates/footer");
			}elseif($pregunta->categoria_id == '3' || $pregunta->categoria_id == '4'){

				$opciones = $this->respuesta_sugerida_model->listar_opciones($idPregunta);

				if($opciones->num_rows() == 0)
					return;

				$valores = array();
				$cont = 0;
				foreach ($opciones->result() as $row) {
					$valores[$cont]["name"] = $row->opcion;
					$valores[$cont]["y"] = $this->respuesta_seleccionada_model->numero_respuestas($row->respuesta_sugerida_id);
					$cont++;
				}	
			
				$data["data"] = $valores;
				$this->load->view("encuesta/grafico_pastel", $data);
				$this->load->view("templates/footer");
			}

		}
	}
?>