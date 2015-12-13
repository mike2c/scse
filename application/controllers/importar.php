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
			$this->load->model("carrera_model");

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

		function subir_archivo(){

			if(!is_uploaded_file($_FILES['excel']['tmp_name'])){
				// Mostrar vista de que no se pudo subir el archivo
				$data["titulo"] = "Error de subida";
				$data["mensaje"] = "No se ha seleccionado un archivo para subir.";
				$this->load->view('templates/header');
				$this->load->view('panel/importar/errores',$data);
				return;
			}

			// Creamos una instancia de la clase Import_manager para cargar el archivo
			$this->load->library("import_manager");
			$file_name = $this->import_manager->cargar_archivo($_FILES);

			// Comprobamos que el archivo se ha subido y se encuentra en el directorio del servidor en otras palabras que exista.
			if(!file_exists($file_name)){
				$data["titulo"] = "Error del servidor";
				$data["mensaje"] = "El archivo no se ha encontrado o no existe.";
				$this->load->view('templates/header');
				$this->load->view('panel/importar/errores',$data);
				return;
			}

			// Llamamos a la funcion encargada de leer el archivo
			$php_excel = $this->leer_archivo($file_name);
			
			// Validamos de que el objeto retornado no sea null.
			if($php_excel == null){
				// Cargar vista con error
				$data["titulo"] = "Error al leer el archivo";
				$data["mensaje"] = "El archivo no se pudo leer. El archivo se ha movido o no es compatible, asegurese de que el archivo posea las extensiónes .xlsx o .xls.";
				$this->load->view('templates/header');
				$this->load->view('panel/importar/errores',$data);
				return;
			}

			if(!$this->formato_valido($php_excel)){
				
				$data["titulo"] = "Error de formato";
				$data["mensaje"] = "El archivo no coincide con el formato adecuado, porfavor revise el archivo o descargue un nuevo formato compatible.";
				$this->load->view('templates/header');
				$this->load->view('panel/importar/errores',$data);
				return;
			}
			
			// Funcion para cargar los registros en un array y facilitar su lectura
			$records = $this->cargar_registros($php_excel);
			$this->guardar_egresados($records);
		}
		
		/**
		 *Valida si el formato del archivo es el correcto
		 *retorna true si es correcto
		 */
		private function formato_valido($php_excel){

			// Verificamos si el archivo no es null o vacio
			// para que no arroje error
			if(is_null($php_excel) || empty($php_excel)){
				throw new Exception("El objeto PHPExcel no puede ser null", 1);
			}

			$active_sheet = $php_excel->getActiveSheet();
			$data["carnet"] = $active_sheet->getCell('A1')->getValue();
			$data["cedula"] = $active_sheet->getCell('B1')->getValue();
			$data["nombre"] = $active_sheet->getCell('C1')->getValue();
			$data["apellido"] = $active_sheet->getCell('D1')->getValue();
			$data["sexo"] = $active_sheet->getCell('E1')->getValue();
			$data["fecha_nacimiento"] = $active_sheet->getCell('F1')->getValue();
			$data["correo"] = $active_sheet->getCell('G1')->getValue();
			$data["telefono"] = $active_sheet->getCell('H1')->getValue();
			$data["celular"] = $active_sheet->getCell('I1')->getValue();
			$data["direccion"] = $active_sheet->getCell('J1')->getValue();
			$data["carreras"] = $active_sheet->getCell('K1')->getValue();

			foreach ($data as $key => $value) {
				if($key != $value){
					return false;
				}
			}
			
			// Regresa true al final si no se ha encontrado ningun error en el formato
			return true;
		}

		/**
	     *Funcion que regresa una arreglo con los registros de el archivo
	     */
		private function leer_archivo($file_name){
			
			$objPHPExcel = null;
			$this->load->library('PHPExcel');
			try{
			
				$objPHPExcel =	PHPExcel_IOFactory::load($file_name);
			}catch(Exception $e){
				
				// No se muestra nada
			}			

			return $objPHPExcel;
		}

		private function cargar_registros($objPHPExcel){

			$objWorkSheet = $objPHPExcel->getActiveSheet();

			$highestRow = $objWorkSheet->getHighestRow();
			$highestColumn = $objWorkSheet->getHighestColumn();

			$records = array();
			if($highestRow > 1){// Preguntamos si el archivo contiene mas de una fila

				for($row = 2; $row < $highestRow; $row++){

					$arr = array(
						"carnet"=>$objWorkSheet->getCellByColumnAndRow(0,$row)->getFormattedValue(),
						"cedula"=>$objWorkSheet->getCellByColumnAndRow(1,$row)->getFormattedValue(),
						"nombre"=>$objWorkSheet->getCellByColumnAndRow(2,$row)->getFormattedValue(),
						"apellido"=>$objWorkSheet->getCellByColumnAndRow(3,$row)->getFormattedValue(),
						"sexo"=>$objWorkSheet->getCellByColumnAndRow(4,$row)->getFormattedValue(),
						"fecha_nacimiento"=>$objWorkSheet->getCellByColumnAndRow(5,$row)->getFormattedValue(),
						"correo"=>$objWorkSheet->getCellByColumnAndRow(6,$row)->getFormattedValue(),
						"telefono"=>$objWorkSheet->getCellByColumnAndRow(7,$row)->getFormattedValue(),
						"celular"=>$objWorkSheet->getCellByColumnAndRow(8,$row)->getFormattedValue(),
						"direccion"=>$objWorkSheet->getCellByColumnAndRow(9,$row)->getFormattedValue(),
						"carrera"=>$objWorkSheet->getCellByColumnAndRow(10,$row)->getFormattedValue());
					
					// Agregamos el registro a el arreglo
					array_push($records, $arr);
				}
			}else{
				// Mensaje: El archivo no contiene registros
			}

			// Regresamos el arreglo
			return $records;
		}

		private function guardar_egresados($records){

			$this->load->model('egresado_model');
			$this->load->helper('pass_gen');
			$this->load->helper('fecha_helper');
			$this->load->library('Encrypter');
			$this->load->model('carrera_model');

			// Validamos que el registro no este vacio y sea un arreglo
			$cont = 0;
			$error = "";
			$correctos = array();// Almacena los registros que se han insertado correctamente
			$fallidos = array();// Almacena los registros que no pudieron ser insertados

			foreach ($records as $key => $value) {

				// Si encontramos una fila vacia entonces nos salimos del for
				if($this->empty_record($value)){
					break;
				}

				$error = $this->buscar_errores($value);
				// Si la variable es un string entonces retorno un error
				if(is_string($error)){

					$value["error"] = $error;
					array_push($fallidos, $value);

				}else{

					$data_persona = array(
						"nombre"=>$value['nombre'],
						"apellido"=>$value['apellido'],
						"sexo"=>$value['sexo'],
						"fecha_nacimiento"=>format_date($value['fecha_nacimiento']));
					$data_contacto = array(
						"telefono"=>$value['telefono'],
						"celular"=>$value['celular'],
						"direccion"=>$value['direccion']);
					$data_usuario = array(
						"correo"=>$value['correo'],
						"clave"=> Encrypter::encrypt(generarClave(20)));// Contraseña generada aleatoriamente,
					
					$data_egresado = null;
					if($this->carrera_model->existe_nombre_carrera($value['carrera'])){
						$data_egresado = array(
							"carnet"=>$value['carnet'],
							"cedula"=>$value['cedula'],
							"carrera_id"=> $this->carrera_model->id_carrera($value['carrera']));
					}else{
						$data_egresado = array(
							"carnet"=>$value['carnet'],
							"cedula"=>$value['cedula'],
							"carrera_id"=> $this->carrera_model->insertar(array("nombre_carrera"=>$value['carrera'])));
					}
										
					// Insertar los datos en la base de datos
					$this->egresado_model->insertarEgresado($data_egresado,$data_persona,$data_usuario,$data_contacto);
					array_push($correctos, $value);
				}

				$cont++;
			}

			$this->mostrar_resultados($cont,$correctos,$fallidos);
		}	

		/**
		 *Carga las vistas para mostrar los resultados
		 */
		private function mostrar_resultados($total,$correctos,$invalidos){

			$data["total"] = $total;
			$data["correctos"] = $correctos;
			$data["invalidos"] = $invalidos;

			$this->load->view("templates/header");
			$this->load->view("panel/importar/resultados",$data);
			$this->load->view("templates/footer");
		}

		/**
		 *Comprueba todos los campos de un registro estan vacios
		 */
		private function empty_record($arr){

			foreach ($arr as $key => $value) {

				if($value != "" || $value != null){
					return false;
				}
			}

			return true;
		}

		/**
		 *Regresa un string describiendo un error si el registro
		 *no se puede insertar
		 */
		private function buscar_errores($arr){

			// Preguntamos si existe el objeto egresado_model, sino lo creamos.
			if(isset($this->egresado_model)){
				$this->load->model('egresado_model');
			}

			// Preguntamos si no esta cargado

			// Si el arreglo esta vacio arrojamos una excepsión.
			if(empty($arr)){
				throw new Exception("El arreglo no puede ser vacio", 1);
			}

			if(empty($arr['carnet'])){
				return "El numero de carnet no puede ser vacio";
			}elseif(empty($arr['correo'])){
				return "El numero de carnet no puede ser vacio";
			}elseif(empty($arr['nombre']) || empty($arr['apellido'])){
				return "El nombre no puede ser vacio";
			}elseif(empty($arr['sexo'])){
				return "No se ha definido el genero sexual";
			}elseif($this->egresado_model->existe_correo($arr['correo'])){
				return "El correo proporcionado ya esta en uso.";
			}elseif(!empty($arr['cedula']) && $this->egresado_model->existe_cedula($arr['cedula'])){
				return "La cedula que se esta intentando registrar ya pertenece a otra persona.";
			}elseif($this->egresado_model->existe_carnet($arr['carnet'])){
				return "El numero de carnet que estas intentando ingresar ya pertenece a otro egresado.";
			}

			return false;
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

						if(!$this->carrera_model->existe_nombre_carrera($data_egresado['carrera_id'])){
							$nueva_carrera = array("nombre_carrera"=>$data_egresado['carrera_id']);
							$data_egresado["carrera_id"] = $this->carrera_model->insertar($nueva_carrera);
							echo "<br> Nueva carrera insertada ". $data_egresado["carrera_id"];
						}else{
							$data_egresado["carrera_id"] = $this->carrera_model->id_carrera($data_egresado["carrera_id"]);
							echo "<br> Carrera ya creada". $data_egresado["carrera_id"];
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