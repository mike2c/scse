<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Pages extends CI_Controller{

		function __construct(){
			parent::__construct();
		}

		function index(){
			$this->page();
		}

		function page($page = "inicio"){
			$this->load->model("ficha_model");
			if ( ! file_exists(APPPATH.'/views/pages/'.$page.'.php')){
            	show_404();
        	}

        	$data['title'] = ucfirst($page); // Capitalize the first letter
			$data['publicaciones'] = $this->ficha_model->listarUltimasPublicaciones();
			$this->load->view('templates/header');
			$this->load->view('templates/menu');	 
	        $this->load->view('pages/'.$page, $data);
	        $this->load->view('templates/footer');
		}
	}
?>