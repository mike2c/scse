<?php defined('BASEPATH') OR exit('No direct script access allowed');
	define("IS_AJAX",isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == 'xmlhttprequest');

	class Reporte extends CI_Controller{

		function __construct(){
			parent::__construct();
		
		}

		function Index(){
			echo "<p>Page not found 404</p>";
		}

		function ReporteEgresados(){
			
			$this->load->model("egresado_model");
			$data["data"] = $this->egresado_model->getReporteEgresadosTrabajando();
			$data["data_titulados"] = $this->egresado_model->getReporteEgresadosTitulados();
			$data["egresados_carrera"] = $this->egresado_model->getReporteEgresadosCarrera();

			if(IS_AJAX){
				$this->load->view("reportes/egresados_trabajando_reporte",$data);
				$this->load->view("reportes/egresados_titulados_reporte",$data);
				$this->load->view("reportes/egresados_carreras_reporte",$data);
			}else{
				$this->load->view("cabecera");
				$this->load->view("nav");

				$this->load->view("reportes/egresados_trabajando_reporte",$data);
				$this->load->view("reportes/egresados_titulados_reporte",$data);
				$this->load->view("reportes/egresados_carreras_reporte",$data);

				$this->load->view("footer");
			}
			
		}

		function Trabajando(){
			$this->load->model("egresado_model");
			$data["data"] = $this->egresado_model->getReporteEgresadosTrabajando();

			if(IS_AJAX){
				$this->load->view("reportes/egresados_trabajando_reporte",$data);
			}else{
				$this->load->view("cabecera");
				$this->load->view("nav");
				$this->load->view("reportes/egresados_trabajando_reporte",$data);
				$this->load->view("footer");
			}
		}

		function Titulados(){
			$this->load->model("egresado_model");
			$data["data_titulados"] = $this->egresado_model->getReporteEgresadosTitulados();

			if(IS_AJAX){
				$this->load->view("reportes/egresados_titulados_reporte",$data);
			}else{
				$this->load->view("cabecera");
				$this->load->view("nav");
				$this->load->view("reportes/egresados_titulados_reporte",$data);
				$this->load->view("footer");
			}
		}

		function EgresadosCarrera(){
			$this->load->model("egresado_model");
			$data["egresados_carrera"] = $this->egresado_model->getReporteEgresadosCarrera();

			if(IS_AJAX){
				$this->load->view("reportes/egresados_carreras_reporte",$data);
			}else{
				$this->load->view("cabecera");
				$this->load->view("nav");
				$this->load->view("reportes/egresados_carreras_reporte",$data);
				$this->load->view("footer");
			}

		}
	}
?>