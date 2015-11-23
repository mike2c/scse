<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Inicio extends CI_Controller{

		function __construct(){
			parent::__construct();
			$this->load->library("form_validation");
			$this->load->helper("url");
		}

		function index(){
			$this->load->view("top");
		}

		function contacto(){
			$this->load->view("contacto");
			$this->load->view("bottom");
		}

		function egresados(){
			$this->load->view("egresado");
			$this->load->view("bottom");
		}

		function empresas(){
			$this->load->view("empresa");
			$this->load->view("bottom");
		}
	}
	


?>
