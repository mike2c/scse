<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class ControladorPrueba extends CI_Controller{

		function __construct(){
			parent::__construct();
			$this->load->library("session");
		}

		function index(){
			$this->load->view("cabecera");
			$this->load->view("nav");
			$this->load->view("prueba");
			$this->load->view("footer");
		}
		function prueba(){
			$cedula = $this->input->post("cedula");
			
			echo $cedula;
		}

		function carrera(){
			$this->load->model("carrera_model");

			$last_id = $this->carrera_model->actualizar(array('nombre_carrera'=>'de mierda','carrera_id'=>6));
			echo $last_id;
			
		}
	}
?>