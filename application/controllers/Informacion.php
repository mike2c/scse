<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Informacion extends CI_Controller{

		function __construct(){
			parent::__construct();
			$this->load->library("session");
			$this->load->helper("sesion");
		}

		//ESTAS FUNCIONES NO TIENEN NADA QUE VER CON LA FUNCIONALIDAD DEL SISTEMA O ACCIONES DE LOS ADMINS.	
		function Egresados(){
			$this->load->view("cabecera");
			$this->load->view("nav");
			$this->load->view("informacion_egresado");
			$this->load->view("footer");
			/*Aqui meter la informacion que va a ser mostrada a egresados en la pagina*/
		}

		function Empresas(){
			$this->load->view("cabecera");
			$this->load->view("nav");
			$this->load->view("informacion_empresa");
			$this->load->view("footer");
		}

		function misionVision(){
			$this->load->view("cabecera");
			$this->load->view("nav");
			$this->load->view("mision_vision");
			$this->load->view("footer");
		}
		
		function BolsaDeTrabajo(){
			$this->load->model("ficha_model");
			$this->load->model("listas_model");

			$data["carreras"] = $this->listas_model->listarCarreras();
			if(isset($_GET)){
				$data["fichas"] = $this->ficha_model->listar($_GET);
			}else{
				$data["fichas"] = $this->ficha_model->listar();
			}		
			$this->load->view("cabecera");
			$this->load->view("nav");
			$this->load->view("ficha/bolsa_trabajo",$data);
			$this->load->view("footer");
		}
	}
?>