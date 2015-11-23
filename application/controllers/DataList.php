<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class DataList extends CI_Controller{

		function __construct(){
			parent::__construct();
		}


		function Index(){
			$this->load->view("cabecera");
			$this->load->view("datalist");
		}

		function Tab(){
			$this->load->view("cabecera");
			$this->load->view("tab");
		}

	}
?>