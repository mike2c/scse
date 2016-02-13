<?php defined('BASEPATH') OR exit('No direct script access allowed');
	define("IS_AJAX",isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == 'xmlhttprequest');

	
	class CPanel extends CI_Controller{

		function __construct(){
			parent::__construct();
			
			$this->load->helper("sesion");
			if(!esAdministrador()){
				#show_404();
			}
		}

		function index(){

			$this->load->view("templates/header");
			$this->load->view("panel/panel.php");
			$this->load->view("templates/footer");
		}

		function reportes(){

			if(IS_AJAX){
				$this->load->view('panel/reportes/reportes.php');
			}
		}

		function ListarEgresados(){
			
			if(IS_AJAX){
				$this->load->model("egresado_model","egresados");
				$this->load->model("listas_model","listas");

				if(isset($_POST["busqueda"])){

					$like["carrera_id"] = $this->input->post("carrera");
					$data["carrera_seleccionada"] = $this->input->post("carrera");

					$campo = $this->input->post("campo");
					if(!empty($campo)){
						$like["carrera_id"] = $this->input->post("carrera");
						$like[$campo] = $this->input->post("busqueda");
						$data["busqueda"] = $this->input->post("busqueda");
						$data["campo"] = $campo;
					}
					
					$data["registros"] = $this->egresados->listar(null,$like);
				}else{
					$data["registros"] = $this->egresados->listar();
				}
				
				$data["carreras"] = $this->listas->listarCarreras();
				$this->load->view("panel/listado/listar_egresados",$data);
			}
		}

		function RegistrarEgresado(){

			if(IS_AJAX){
				$this->load->view("panel/registro/registrar_egresado");
			}
		}

		function ListarEmpresas(){

			if(IS_AJAX){
				$this->load->model("empresa_model","empresas");
				$this->load->model("listas_model","listas");
				$this->load->helper("fecha");

				if(isset($_POST["busqueda"])){

					$like["sociedad_id"] = $this->input->post("sociedad");
					$data["sociedad_seleccionada"] = $this->input->post("sociedad");

					$campo = $this->input->post("campo");
					if(!empty($campo)){
						$like["sociedad_id"] = $this->input->post("sociedad");
						$like[$campo] = $this->input->post("busqueda");
						$data["busqueda"] = $this->input->post("busqueda");
						$data["campo"] = $campo;
					}
					
					$data["registros"] = $this->empresas->listar(null,$like);
				}else{
					$data["registros"] = $this->empresas->listar();
				}
				
				$data["sociedades"] = $this->listas->listarSociedades();
				$this->load->view("panel/listado/listar_empresas",$data);
			}
		}

		function ListarPublicadores(){

			if(IS_AJAX){
				$this->load->model("publicador_model","publicadores");

				if(isset($_POST["busqueda"])){

					if(isset($_POST["area"])){

						$like["area_id"] = $this->input->post("area");
						$data["area_seleccionada"] = $this->input->post("area");
					}
					if(isset($_POST["cargo"])){

						$like["cargo_id"] = $this->input->post("cargo");
						$data["cargo_seleccionado"] = $this->input->post("cargo");
					}

					if(isset($_POST["campo"]) && !empty($_POST["campo"])){
						$campo = $this->input->post("campo");
						$like[$campo] = $this->input->post("busqueda");
						$data["busqueda"] = $this->input->post("busqueda");
						$data["campo"] = $this->input->post("campo");
					}

					$data["registros"] = $this->publicadores->listar(null,$like);
				}else{
					$data["registros"] = $this->publicadores->listar();
				}

				$this->load->view("panel/listado/listar_publicadores",$data);
			}
		}

		function ListarAdministradores(){

			if(IS_AJAX){
				$this->load->model("admin_model","admin");
				$this->load->helper("fecha");
				
				if(isset($_POST["busqueda"])){

					if(isset($_POST["campo"]) && !empty($_POST["campo"])){
						$campo = $this->input->post("campo");
						$like[$campo] = $this->input->post("busqueda");
						$data["busqueda"] = $this->input->post("busqueda");
						$data["campo"] = $this->input->post("campo");
					}

					$data["registros"] = $this->admin->listar(null,$like);
				}else{
					$data["registros"] = $this->admin->listar();
				}

				$this->load->view("panel/listado/listar_admins",$data);
			}
		}

		/**Convierte una consulta en un array compatible para la funcion crear grafico*/
		private function query_to_array($query,$label_field,$value_field){

			if(is_null($query) || empty($query)){
				return null;
			}

			$data = array();
			foreach ($query->result_array() as $row) {
				array_push($data, array("name"=>$row[$label_field],"y"=>$row[$value_field]));
			}

			return $data;
		}

		/*Creacion de reportes*/
		function ReporteEgresadosTrabajando(){
			if(IS_AJAX){

				$this->load->helper("graficos");
				$this->load->model("egresado_model","egresados");
				$this->load->model("listas_model","listas");

				$where_in = null;
				if(isset($_POST["carrera"]) && !empty($_POST["carrera"])){
					$where_in = $this->input->post("carrera");
					
				}

				$where["trabaja"] = true;
				//$where["titulado"] = true;
				if(isset($_POST["titulado"]) && !empty($_POST["titulado"])){
					$where["titulado"] = true;
				}

				$result[0]["name"] = "Trabajando";
				$result[0]["y"] = $this->egresados->contar($where,$where_in)->row('cantidad');
				$where["trabaja"] = false;
				$result[1]["name"] = "Desempleados";
				$result[1]["y"] = $this->egresados->contar($where,$where_in)->row('cantidad');
				
				$data["data"] = $result;
				$data["sel_carreras"] = $this->input->post("carrera");
				
				$data["carreras"] = $this->listas->listarCarreras();
				$this->load->view("panel/reportes/egresados_trabajando",$data);			
			}
		}

		function ReporteEgresadosTitulados(){
			
			if(IS_AJAX){

				$fecha_inicial = $this->input->post("fecha_inicial");
				$fecha_final = $this->input->post("fecha_final");


				$this->load->helper("graficos");
				$this->load->model("egresado_model","egresados");

				$arr[0]["name"] = "Titulados";
				$arr[0]["y"] = $this->egresados->contar(array("titulado"=>TRUE))->row('cantidad');
				$arr[1]["name"] = "Sin titulo";
				$arr[1]["y"] = $this->egresados->contar(array("titulado"=>FALSE))->row('cantidad');
				
				$data["data"] = $arr;
				$this->load->view("panel/reportes/egresados_titulados.php",$data);
			}
		}

		function ReporteEgresadosPorCarrera(){

			if(IS_AJAX){

				$this->load->helper("graficos");
				$this->load->model("egresado_model","egresados");
				$this->load->model("listas_model","listas");

				$carreras = $this->listas->listarCarreras();
				$contador = 0;
				$total_egresados = 0;

				foreach ($carreras->result() as $row) {
					$arr[$contador]["name"] = $row->nombre_carrera;
					$arr[$contador]["y"] = $this->egresados->listar(array("carrera_id"=>$row->carrera_id))->num_rows();
					$total_egresados += $arr[$contador]["y"];
					$contador++;
				}

				$data["data"] = $arr;
				$data["total_egresados"] = $total_egresados;
				$this->load->view("panel/reportes/egresados_carrera",$data);
			}
		}

		function RegistrarPublicador(){

			if(IS_AJAX){
				$this->load->view("panel/registro/registrar_publicador");
			}
		}

		function RegistrarAdministrador(){

			if(IS_AJAX){
				$this->load->view("panel/registro/registrar_admin");
			}
		}
	}
?>