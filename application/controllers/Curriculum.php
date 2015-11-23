<?php defined('BASEPATH') OR exit('No direct script access allowed');
	define("IS_AJAX",isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == 'xmlhttprequest');
	
	class Curriculum  extends CI_Controller{

		function __construct(){
			parent::__construct();
			$this->load->helper(array("sesion","url","form","fecha"));
			$this->load->library(array("session","form_validation"));
			$this->load->model("curriculum_model","modelo");
		}

		function Index(){
			$data_curriculo["curriculum_id"] = $this->modelo->getCurriculumID(getUsuarioId());
			if ($data_curriculo["curriculum_id"]==NULL) {
				$this->Crear();
			}else{
				$data_curriculo = $this->modelo->listarCurriculo($data_curriculo["curriculum_id"]);
				if(!$data_curriculo==null){
					$this->Editar($data_curriculo);
				}else{
					$this->Crear();
				}
			}
		}

		function Crear(){
			if(!esEgresado()){
				show_404();
			}

			if(IS_AJAX){
				$this->load->view("curriculum/registro_curriculum");
			}else{
				$this->load->view("cabecera");
				$this->load->view("nav");
				$this->load->view("curriculum/registro_curriculum");
				$this->load->view("footer");
			}
		}
		
		function Editar($data_curriculo=""){
			if(!esEgresado()){
				show_404();
			}
			if(IS_AJAX){
				$this->load->view("curriculum/actualizar_curriculum",$data_curriculo);
			}else{
				$this->load->view("cabecera");
				$this->load->view("nav");
				$this->load->view("curriculum/actualizar_curriculum",$data_curriculo);
				$this->load->view("footer");
			}
		}

		function Guardar(){
			if(!esEgresado()){
				show_404();
			}
			if($this->validarCampos()){
				#formacion academica
				$titulo = $this->input->post("titulo[]");
				$comienzo_formacion = $this->input->post("comienzo_formacion[]");
				$finalizacion_formacion = $this->input->post("finalizacion_formacion[]");
				
				#experiencia laboral
				$empresa = $this->input->post("empresa[]");
				$cargo = $this->input->post("cargo[]");
				$comienzo_laboral = $this->input->post("comienzo_laboral[]");
				$finalizacion_laboral = $this->input->post("finalizacion_laboral[]");
				
				#experiencia complementaria
				$curso = $this->input->post("curso[]");
				$comienzo_curso = $this->input->post("comienzo_curso[]");
				$finalizacion_curso = $this->input->post("finalizacion_curso[]");
				
				#idioma
				$idioma = $this->input->post("idioma[]");
				$nivel_idioma = $this->input->post("nivel_idioma[]");
				
				#informatica
				$software = $this->input->post("software[]");
				$nivel_software =$this->input->post("nivel_software[]");
				
				$egresado_id = $this->modelo->getEgresadoID(getUsuarioId());
				
				if (!$egresado_id==NULL) {
					$curr_id = $this->modelo->guardarCurriculum($egresado_id->egresado_id);
				}else {
					exit("Error, no se encuentra el Egresado");
				}
				
				for($i = 0; $i < count($this->input->post("titulo[]")); $i++){
					if ($comienzo_formacion[$i]=="" || $finalizacion_formacion[$i]=="" || $titulo[$i]=="") {
						# no guarda en caso de llevar campos vacios
					}else{
						$this->modelo->guardarFormacionAcademica(array("curriculum_id"=>$curr_id,"fecha_comienzo"=>$comienzo_formacion[$i],"fecha_finalizacion"=>$finalizacion_formacion[$i],"titulo_id"=>$titulo[$i]));
					}
				}
				for ($i=0; $i < count($this->input->post("cargo[]")) ; $i++){ 
					if ($empresa[$i]=="" || $cargo[$i]=="" || $comienzo_laboral[$i]=="" || $finalizacion_laboral[$i]=="") {
						# no guarda en caso de llevar campos vacios
					}else{
						$this->modelo->guardarExperienciaLaboral(array("curriculum_id"=>$curr_id,"empresa"=>$empresa[$i],"cargo"=>$cargo[$i],"fecha_comienzo"=>$comienzo_laboral[$i],"fecha_finalizacion"=>$finalizacion_laboral[$i]));
					}
				}
				for ($i=0; $i < count($this->input->post("curso[]")); $i++){ 
					if ($curso[$i]=="" || $comienzo_curso[$i]=="" || $finalizacion_curso[$i]=="") {
						# no guarda en caso de llevar campos vacios
					}else{
						$this->modelo->guardarformacionComplementaria(array("curriculum_id"=>$curr_id,"curso"=>$curso[$i],"fecha_comienzo"=>$comienzo_curso[$i],"fecha_finalizacion"=>$finalizacion_curso[$i]));
					}
				}
				for ($i=0; $i < count($this->input->post("idioma[]")); $i++){ 
					if ($idioma[$i]=="" || $nivel_idioma[$i]=="") {
						# no guarda en caso de llevar campos vacios
					}else{
						$this->modelo->guardarIdiomas(array("curriculum_id"=>$curr_id,"idioma"=>$idioma[$i],"nivel"=>$nivel_idioma[$i]));
					}
				}
				for ($i=0; $i < count($this->input->post("software[]")); $i++){
					if ($software[$i]=="" || $nivel_software[$i]=="") {
						# no guarda en caso de llevar campos vacios
					}else{
						$this->modelo->guardarInformatica(array("curriculum_id"=>$curr_id,"software"=>$software[$i],"nivel"=>$nivel_software[$i]));
					}
				}
				echo "
					<script stype='text/javascript'>
						alert('Guardado');
						window.location='". base_url("Perfil")."';
					</script>
				";
			}else{
				echo validation_errors();
			}
		}
		
		function Borrar(){
			$campo= $this->input->post("campo");
			$id= $this->input->post("id");
			
			if($campo=="formacion_academica"){
				$this->modelo->borrarFormacionAcademica($id);
			}
			if($campo=="experiencia_laboral"){
				$this->modelo->borrarExperienciaLaboral($id);
			}
			if($campo=="formacion_complementaria"){
				$this->modelo->borrarFormacionComplementaria($id);
			}
			if($campo=="dominio_idiomas"){
				$this->modelo->borrarIdioma($id);
			}
			if($campo=="informatica"){
				$this->modelo->borrarInformatica($id);
			}
		}

		function Actualizar(){
		 	if(!esEgresado()){
				show_404();
			}
			
			if($this->validarCampos()){
				#Se recive el ID del curriculo por medio de un campo hidden.
				$curr_id = $this->input->post("curriculum_id");
				
				$id_academico = $this->input->post("formacion_academica_id[]");
				$titulo[] = $this->input->post("titulo[]");
				$comienzo_formacion[] = $this->input->post("comienzo_formacion[]");
				$finalizacion_formacion[] = $this->input->post("finalizacion_formacion[]");
				
				$id_experiencia = $this->input->post("experiencia_laboral_id[]");
				$empresa[] = $this->input->post("empresa[]");
				$cargo[] = $this->input->post("cargo[]");
				$comienzo_laboral[] = $this->input->post("comienzo_laboral[]");
				$finalizacion_laboral[] = $this->input->post("finalizacion_laboral[]");
				
				$id_complemetario = $this->input->post("formacion_complementaria_id[]");
				$curso[] = $this->input->post("curso[]");
				$comienzo_curso[] = $this->input->post("comienzo_curso[]");
				$finalizacion_curso[] = $this->input->post("finalizacion_curso[]");
				
				$idioma_id = $this->input->post("idioma_id[]");
				$idioma[] = $this->input->post("idioma[]");
				$nivel_idioma[] = $this->input->post("nivel_idioma[]");
				
				$informatica_id=$this->input->post("informatica_id[]");
				$software[] = $this->input->post("software[]");
				$nivel_software[] =$this->input->post("nivel_software[]");
							
				for($i = 0; $i < count($this->input->post("titulo[]")); $i++){//FORMACION ACADEMICA
					if ($comienzo_formacion[0][$i]=="" || $finalizacion_formacion[0][$i]=="" || $titulo[0][$i]=="") {
							# no guarda en caso de llevar campos vacios
					}else{
						if(isset($id_academico[$i])){
							$this->modelo->actualizarFormacionAcademica(array("curriculum_id"=>$curr_id,"fecha_comienzo"=>$comienzo_formacion[0][$i],"fecha_finalizacion"=>$finalizacion_formacion[0][$i],"titulo_id"=>$titulo[0][$i]),$id_academico[$i]);
						}else{
							$this->modelo->guardarFormacionAcademica(array("curriculum_id"=>$curr_id,"fecha_comienzo"=>$comienzo_formacion[0][$i],"fecha_finalizacion"=>$finalizacion_formacion[0][$i],"titulo_id"=>$titulo[0][$i]));
						}
					}
				}
				
				for ($i=0; $i < count($this->input->post("cargo[]")) ; $i++){//EXPERIENCIA LABORAL
					if ($empresa[0][$i]=="" || $cargo[0][$i]=="" || $comienzo_laboral[0][$i]=="" || $finalizacion_laboral[0][$i]=="") {
						# no guarda en caso de llevar campos vacios
					}else{
						if(isset($id_experiencia[$i])){
							$this->modelo->actualizarExperienciaLaboral(array("curriculum_id"=>$curr_id,"empresa"=>$empresa[0][$i],"cargo"=>$cargo[0][$i],"fecha_comienzo"=>$comienzo_laboral[0][$i],"fecha_finalizacion"=>$finalizacion_laboral[0][$i]),$id_experiencia[$i]);
						}else{
							$this->modelo->guardarExperienciaLaboral(array("curriculum_id"=>$curr_id,"empresa"=>$empresa[0][$i],"cargo"=>$cargo[0][$i],"fecha_comienzo"=>$comienzo_laboral[0][$i],"fecha_finalizacion"=>$finalizacion_laboral[0][$i]));
						}					
					}
				}
				
				for ($i=0; $i < count($this->input->post("curso[]")); $i++){ //FORMACION COMPLEMENTARIA
					if ($curso[0][$i]=="" || $comienzo_curso[0][$i]=="" || $finalizacion_curso[0][$i]=="") {
						# no guarda en caso de llevar campos vacios
					}else{
						if(isset($id_complemetario[$i])){
							$this->modelo->actualizarFormacionComplementaria(array("curriculum_id"=>$curr_id,"curso"=>$curso[0][$i],"fecha_comienzo"=>$comienzo_curso[0][$i],"fecha_finalizacion"=>$finalizacion_curso[0][$i]),$id_complemetario[$i]);
						}else{
							$this->modelo->guardarformacionComplementaria(array("curriculum_id"=>$curr_id,"curso"=>$curso[0][$i],"fecha_comienzo"=>$comienzo_curso[0][$i],"fecha_finalizacion"=>$finalizacion_curso[0][$i]));
						}
						
					}
				}
				
				for ($i=0; $i < count($this->input->post("idioma[]")); $i++){ //IDIOMAS
					if ($idioma[0][$i]=="" || $nivel_idioma[0][$i]=="") {
						# no guarda en caso de llevar campos vacios
					}else{
						if(isset($idioma_id[$i])){
							$this->modelo->actualizarIdiomas(array("curriculum_id"=>$curr_id,"idioma"=>$idioma[0][$i],"nivel"=>$nivel_idioma[0][$i]),$idioma_id[$i]);
						}else{
							$this->modelo->guardarIdiomas(array("curriculum_id"=>$curr_id,"idioma"=>$idioma[0][$i],"nivel"=>$nivel_idioma[0][$i]));
						}
						
					}
				}
				
				for ($i=0; $i < count($this->input->post("software[]")); $i++){ //INFORMATICA
					if ($software[0][$i]=="" || $nivel_software[0][$i]=="") {
						# no guarda en caso de llevar campos vacios
					}else{
						if(isset($informatica_id[$i])){
							$this->modelo->actualizarInformatica(array("curriculum_id"=>$curr_id,"software"=>$software[0][$i],"nivel"=>$nivel_software[0][$i]),$informatica_id[$i]);
						}else{
							$this->modelo->guardarInformatica(array("curriculum_id"=>$curr_id,"software"=>$software[0][$i],"nivel"=>$nivel_software[0][$i]));
						} 
					}
				}
				
				echo "
					<script stype='text/javascript'>
						alert('Actualizada');
						window.location='". base_url("Perfil")."';
					</script>
				";
			}else{
				echo validation_errors();
			}
		}
		
		function validarCampos(){
			
			//Establecemos la Fecha maxima que se podra ingresar
			$anio_actual = obtener_anio_actual() + 1;
			
			//Establecemos la fecha minima que se podra ingersar
			$anio_minimo = $anio_actual - 50;
		
			$this->form_validation->set_rules("titulo[]","Nombre del Titulo","trim|required");
			$this->form_validation->set_rules("comienzo_formacion[]","Año Inicial","trim|required|integer|exact_length[4]|less_than[$anio_actual]|greater_than[$anio_minimo]|callback_periodoTitulo");
			$this->form_validation->set_rules("finalizacion_formacion[]","Año Final","trim|required|integer|exact_length[4]|less_than[$anio_actual]|greater_than[$anio_minimo]");
	
			$this->form_validation->set_rules("empresa[]","Nombre de la Empresa","trim|max_length[45]");
			$this->form_validation->set_rules("cargo[]","Cargo","trim|max_length[45]");
			$this->form_validation->set_rules("comienzo_laboral[]","Año Inicial","trim|integer|exact_length[4]|less_than[$anio_actual]|greater_than[$anio_minimo]|callback_periodoCargo");
			$this->form_validation->set_rules("finalizacion_laboral[]","Año Final","trim|integer|exact_length[4]|less_than[$anio_actual]|greater_than[$anio_minimo]");
			
			$this->form_validation->set_rules("curso[]","Nombre del Curso","trim|max_length[45]");
			$this->form_validation->set_rules("comienzo_curso[]","Año Inicial","trim|integer|exact_length[4]|less_than[$anio_actual]|greater_than[$anio_minimo]|callback_periodoCurso");
			$this->form_validation->set_rules("finalizacion_curso[]","Año Final","trim|integer|exact_length[4]|less_than[$anio_actual]|greater_than[$anio_minimo]");
			
			$this->form_validation->set_rules("idioma[]","Idioma","trim|max_length[10]");
			
			$this->form_validation->set_rules("software[]","Software","trim|max_length[45]");
			
			if ($this->form_validation->run()==FALSE){
				return FALSE;
			}else {
				return TRUE;
			}
		}
		

		/*Mostrar curriculum*/
		function Ver($id){

			$this->load->model("privacidad_model","privacidad");
			$this->load->model("egresado_model","egresado");
			$priv = $this->privacidad->consultar_privacidad($id);
		
			if($priv == FALSE){
				exit("<p>Esta información no esta disponible en este momento.</p>");
			}else{
				if($priv["info_curriculum"] == "empresas"){
					if(!esPublicador() && !esEmpresa() && !esAdministrador()){
						exit("<p>Esta información no esta disponible para tí.</p>");
					}
				}elseif($priv["info_curriculum"] == "privada"){
					exit("<p>Esta información no esta disponible para tí.</p>");
				}
			}

			$curriculum_id = $this->modelo->getCurriculumID($id);
			$data["egresado"] = $this->egresado->listar(array("usuario_id"=>$id))->row();
			$data["curriculum"] = $this->modelo->listarCurriculo($curriculum_id);
			$data["privacidad"] = $priv;

			$this->load->view("cabecera");
			$this->load->view("nav");
			$this->load->view("curriculum/ver_curriculum",$data);
			$this->load->view("footer");

		}

		function periodoTitulo(){
			$comienzo = $this->input->post("comienzo_formacion[]");
			$finalizacion = $this->input->post("finalizacion_formacion[]");
			for ($i=0; $i < count($this->input->post("comienzo_formacion[]")) ; $i++) { 
				$periodoTitulo = menor_o_igual($comienzo[$i],$finalizacion[$i]);
				if (!$periodoTitulo==TRUE){
					$this->form_validation->set_message("periodoTitulo","El campo Año Inicial debe ser menor que el Año Final en la Seccion de <strong>Formacion Academica</strong>");
					return FALSE;
				}
			}
			return true;
		}
		
		function periodoCargo(){
			$comienzo = $this->input->post("comienzo_laboral[]");
			$finalizacion = $this->input->post("finalizacion_laboral[]");
			for ($i=0; $i < count( $this->input->post("comienzo_laboral[]")) ; $i++) {
				$periodoCargo = menor_o_igual($comienzo[$i],$finalizacion[$i]);
				if(!$periodoCargo==TRUE){
					$this->form_validation->set_message("periodoCargo","El campo Año Inicial debe ser menor que el Año Final en la Seccion de <strong>Experiencia Laboral</strong>");
					return FALSE;
				}
			}
			return true;
		}
		
		function periodoCurso(){
			$comienzo = $this->input->post("comienzo_curso[]");
			$finalizacion = $this->input->post("finalizacion_curso[]");
			for ($i=0; $i < count($this->input->post("comienzo_curso[]")) ; $i++) { 
				$periodoCurso = menor_o_igual($comienzo[$i],$finalizacion[$i]);
				if(!$periodoCurso==TRUE){
					$this->form_validation->set_message("periodoCurso","El campo Año Inicial debe ser menor que el Año Final en la Seccion de <strong>Formacion Complementaria</strong>");
					return FALSE;
				}
			}
			return true;
		}
	}
?>