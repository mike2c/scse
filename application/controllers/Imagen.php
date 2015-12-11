<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Imagen extends CI_Controller{

		function __construct(){
			parent::__construct();

			$this->load->model("imagen_model","imagenes");
			$this->load->helper("imagen");
		}

		function index(){
			echo "hola";
		}
		function Cargar($imagen_id){
			
			$data = $this->imagenes->mostrar($imagen_id);
			header("CONTENT-TYPE: $data[tipo]");
			echo $data["data"];
		}

		function DeFichaOcupacional($ficha_id){
			$data = $this->imagenes->DeFichaOcupacional($ficha_id);
			$this->load->view("imagen",$data);
		}

		function MostrarFormulario(){

			echo"<form method='post' action='" . base_url('Imagen/GuardarImagen')."' enctype='multipart/form-data' >
				<input type='file' name='imagen'>
				<input type='submit' value='subir'>

			</form>" ;
		}

		function GuardarImagen(){
			$this->load->helper("imagen");
			$this->load->model("imagen_model","imagenes");
			$data= escaparImagen("imagen");
			$this->imagenes->guardar($data);
		}

	}
?>