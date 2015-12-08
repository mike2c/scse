<?php defined('BASEPATH') OR exit('No direct script access allowed');
	//DEFINIENDO LA CONSTANTE  IS_AJAX
	define("IS_AJAX",isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == 'xmlhttprequest');
	
	class Importar extends CI_Controller{
	
		function __construct(){

			parent::__construct();
			$this->load->helper("url");
			$this->load->library(array("form_validation","Encrypter"));
			$this->load->helper(array("form_helper","sesion","fecha","pass_gen_helper"));
			$this->load->model("egresado_model");

		}

		function Index(){

			if(IS_AJAX){
				$this->load->view("panel/importar/importar_egresados");
			}else{

				$this->load->view("cabecera");
				$this->load->view("nav");
				$this->load->view("panel/importar/importar_egresados");
				$this->load->view("footer");
			}
		
		}

		function importarEgresados(){

			if(is_uploaded_file($_FILES['excel']['tmp_name'])){
				
				$this->load->library("import_manager");
				$filename = $this->import_manager->cargar_archivo($_FILES);
				//Cargar PHPExcel library
				$obj_excel = PHPExcel_IOFactory::load($filename);       
				$sheetData = $obj_excel->getActiveSheet()->toArray(null,true,true,true);
				
				$data_egresado = array();
				$data_persona = array();
				$data_usuario = array();
				$data_contacto = array();
				$data["registros_correctos"] = array();
				$data["registros_incorrectos"] = array();

				$cont = null;
				//llenamos los arreglos con la informacion del archivo excel.
				foreach ($sheetData as $index => $value) { 
					$cont += 1;
					//La primer fila del archivo excel deben ser los encabezados.           
					if ( $index != 1){
						$data_egresado = array(
							'carnet'  => $value['A'],
							'cedula'  =>  $value['B'],
							'carrera_id' => $value['K']					                                  
						); 
						//convertimos la fecha del archivo de excel a el formato de Mysql.
						$fecha = format_date($value['F']);
						$data_persona = array(
							'nombre' =>  $value['C'],
							'apellido'  =>  $value['D'],
							'sexo'  =>  $value['E'],
							'fecha_nacimiento'  =>  $fecha
						);
						$data_contacto = array(
							'telefono'  =>  $value['H'],
							'celular'  =>  $value['I'],
							'direccion'  =>  $value['J']
						);
						$data_usuario = array(
							'correo'  =>  $value['G'],
							'clave' => Encrypter::encrypt(generarClave(20))
						);

						foreach ($data_egresado as $llave => $valor) {
							$data_egresado[$llave] = $valor;
						}
						foreach ($data_persona as $llave2 => $valor2) {
							$data_persona[$llave2] = $valor2;
						}
						foreach ($data_contacto as $llave3 => $valor3) {
							$data_contacto[$llave3] = $valor3;
						}
						foreach ($data_usuario as $llave4 => $valor4) {
							$data_usuario[$llave4] = $valor4;
						}

						if(!$this->carrera_model->exist_carrera($data_egresado['carrera_id'])){
							$data_egresado["carrera_id"] = $this->carrera_model->insert();
						}

						if($data_egresado["carnet"]!=""|| $data_persona["nombre"]!="" || $data_persona["apellido"]!="" || $data_persona["sexo"]!=""){
							
							$error = $this->has_error($data_egresado,$data_usuario);
							if(!$error){
								$this->egresado_model->insertarEgresado($data_egresado,$data_persona,$data_usuario,$data_contacto);									
								array_push($data["registros_correctos"], 
									array($data_egresado['carnet'],$data_egresado['cedula'],
										$data_persona['nombre']. " ". $data_persona['apellido'],
										$data_usuario['correo']));
							}else{
								array_push($data["registros_incorrectos"], 
									array($data_egresado['carnet'],$data_egresado['cedula'],
										$data_persona['nombre']. " ". $data_persona['apellido'],
										$data_usuario['correo'],
										$error));
							}

							/*
							if($this->validarCampos($data_egresado)){
								
								echo "Se guardo el Registro N#". $index."<br/>";
							}else{
								echo "Los campos Cedula o Carnet del registro N#".$index." ya se encuentran registrados en la base de datos <br/>" ;
								$cont -= 1; 
							}*/
						}else{
							$cont -= 1; 
						}
					}
				}

				if($cont > 1){
					#echo "Datos importados Correctamente";
				}else{
					#echo "No se encontraron datos a importar, revise que el archivo contenga datos a importar";
				}
				unlink($filename);

				$this->load->view('templates/header');
				$this->load->view('templates/upload_results',$data);
			}else{
				$data['title'] = 'ERROR';
				$data['errors'] = 'No se ha proporcionado el archivo de excel';
				
				$this->load->view("templates/header");
				$this->load->view("errors/html/error_upload",$data);
			}
		}
		
		private function has_error($data_egresado,$data_usuario){

			if($this->egresado_model->existe_carnet($data_egresado["carnet"])){
				return "El carnet ingresado ya se encuentra asignado a otro egresado.";
			}elseif($this->egresado_model->existe_cedula($data_egresado["cedula"])){
				return "La cedula ingresada pertenece a otro egresado.";
			}elseif($this->egresado_model->existe_correo($data_usuario["correo"])){
				return "El correo ingresado ya esta en uso";
			}

			return false;
		}

	}/*Fin de la clase*/
?>