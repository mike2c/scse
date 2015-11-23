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

	}
?>