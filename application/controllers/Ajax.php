<?php defined('BASEPATH') OR exit('No direct script access allowed');
	define("IS_AJAX",isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == 'xmlhttprequest');

	class Ajax extends CI_Controller{

		function __construct(){
			parent::__construct();
			$this->load->model("listas_model","registro");
		}

		function index(){
			$data["departamentos"] = $this->registro->listarDepartamentos();
			$this->load->view("ajax.php",$data);

		}

		function CargarDepartamentos($selected = ""){
			$query = $this->registro->listarDepartamentos();
			echo "<select id='departamento' name='departamento'>";
			foreach($query->result() as $row){
				if($row->departamento_id == $selected){
					echo "<option selected value='$row->departamento_id'>$row->departamento</option>";
				}else{
					echo "<option value='$row->departamento_id'>$row->departamento</option>";
				}
				
			}
			echo "</select>";
			
		}

		function RegistrarSociedad(){

			if(IS_AJAX){
				$sociedad = $this->input->post("sociedad");
				if(!empty($sociedad)){
					$this->registro->registrarSociedad($sociedad);
				}
			}
		}

		function RegistrarArea(){

			if(IS_AJAX){
				$area = $this->input->post("area");
				if(!empty($area)){
					$this->registro->registrarArea($area);
				}
			}
		}

		function RegistrarCargo(){

			if(IS_AJAX){
				$area = $this->input->post("area");
				$cargo = $this->input->post("cargo");

				if(!empty($area) && !empty($cargo)){
					$this->registro->registrarCargo($area,$cargo);
				}
			}
		}

		function CargarMunicipios($municipio_id,$selected = ""){
			$query = $this->registro->listarMunicipios($municipio_id);
			echo "<select required name='municipio' id='municipio'>";
			foreach($query->result() as $row){
				if($row->municipio_id == $selected){
					echo "<option selected value='$row->municipio_id'>$row->municipio</option>";
				}else{
					echo "<option value='$row->municipio_id'>$row->municipio</option>";
				}
			
			}
			echo "</select>"; 
		}

		function CargarCarreras($selected = ""){
			$query = $this->registro->listarCarreras();
			echo "<select required name='carrera' id='carrera'>";
				foreach ($query->result() as $row) {
					if($selected == $row->carrera_id){
						echo "<option selected value='$row->carrera_id'>$row->nombre_carrera</option>";
					}else{
						echo "<option value='$row->carrera_id'>$row->nombre_carrera</option>";
					}
					
				}
			echo "</select>";
		}

		function CargarSociedades($selected = ""){

			$query = $this->registro->listarSociedades();
			echo "<select required name='sociedad' id='sociedad'>";
			foreach ($query->result() as $row) {
				if($selected == $row->sociedad_id){
					echo "<option selected value='$row->sociedad_id'>$row->sociedad</option>";
				}else{
					echo "<option value='$row->sociedad_id'>$row->sociedad</option>";
				}
				
			}
			echo "</select>";

		}

		function CargarAreas($selected = ""){
			$query = $this->registro->listarAreas();

			if($query->num_rows()){
				echo "<select required name='area' id='area'>";
				foreach($query->result() as $row){
					if($selected == $row->area_id){
						echo "<option selected value='$row->area_id'>$row->area</option>";
					}else{
						echo "<option value='$row->area_id'>$row->area</option>";
					}
				}
				echo "</selected>";
			}else{
				echo "No hay registros de areas";
			}
			
		}

		function CargarCargos($id_area,$selected = ""){
			$query = $this->registro->listarCargos($id_area);

			if($query->num_rows()){
				echo "<select required name='cargo' id='cargo'>";
				foreach($query->result() as $row){
					if($selected == $row->cargo_id){
						echo "<option selected value='$row->cargo_id'>$row->cargo</option>";
					}else{
						echo "<option value='$row->cargo_id'>$row->cargo</option>";
					}
				}
				echo "</selected>";
			}else{
				echo "No se han registrado cargos en esa area";
			}
			
		}

		function CargarTitulos($selected = ""){
			$query = $this->registro->listarTitulos();

			if($query->num_rows() > 0){
				echo "<select required name='titulo[]' id='titulo'>";
				foreach($query->result() as $row){
					if($selected == $row->titulo_id){
						echo "<option selected value='$row->titulo_id'>$row->titulo</option>";
					}else{
						echo "<option value='$row->titulo_id'>$row->titulo</option>";
					}
				}
				echo "</selected>";
			}else{
				echo "No se han encontrador registros";
			}
		}

		function RegistrarTitulo(){
			$titulo = $this->input->post("titulo");
			if($titulo != ""){
				$this->registro->registrarTitulo($titulo);	
			}
		}

		function ReporteEgresadosTrabajando(){
			$this->load->model("egresado_model");
			$data = $this->egresado_model->getReporteEgresadosTrabajando();

			echo '' . json_encode($data) . '';
		}

		function ReporteEgresadosTitulaos(){

		}

		function lista_egresados(){

			$this->load->model("egresado_model");
			$query =  $this->egresado_model->listar(array("activo"=>TRUE),null,null,null,array("usuario_id","correo","concat(nombre,' ',apellido) as nombre"));
			
			$this->crear_lista($query,"nombre","usuario_id","destinatario","destinatario");
		}

		function lista_publicadores(){

			$this->load->model("publicador_model");
			$query =  $this->publicador_model->listar(array("activo"=>TRUE),null,null,null,array("usuario_id","correo","concat(nombre,' ',apellido) as nombre"));
			
			$this->crear_lista($query,"nombre","usuario_id","destinatario","destinatario");
		}

		function lista_administradores(){

			$this->load->model("admin_model");
			$query =  $this->admin_model->listar(array("activo"=>TRUE),null,null,null,array("usuario_id","concat(nombre,' ',apellido) as nombre"));
			
			$this->crear_lista($query,"nombre","usuario_id","destinatario","destinatario");
		}

		function lista_empresas(){

			$this->load->model("empresa_model");
			$query =  $this->empresa_model->listar(array("activo"=>TRUE),null,null,null,array("usuario_id","nombre_empresa as nombre"));
			
			$this->crear_lista($query,"nombre","usuario_id","destinatario","destinatario");
		}

		private function crear_lista($result_set,$display_member,$value_member,$name,$id){

			echo "<select required name='$name' id='$id' multiple style='width:300px'>";
			foreach ($result_set->result_array() as $row) {
				echo "<option value='$row[$value_member]'>$row[$display_member]</option>";
			}
			echo "</select>";
		}

	}	
?>