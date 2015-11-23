<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Bienvenido extends CI_Controller{

		function __construct(){
			parent::__construct();
			$this->load->library("form_validation");
			$this->load->library("session");
			$this->load->helper(array("url","sesion"));

		}

		function index(){
			$this->load->view("cabecera");
			$this->load->view("nav");
			
			$this->load->view("footer");
		}

	}
	


?>
