<?php defined('BASEPATH') OR exit('No direct script access allowed');
define("IS_AJAX",isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == 'xmlhttprequest');
	
class Correo extends CI_Controller{

	function __construct(){
		parent::__construct();

		$this->load->model("mensaje_model","mensaje");
		$this->load->library("session");
		$this->load->helper("sesion");
					
		if(!sesionIniciada()){
			show_404();
		}
	}

	function index(){

		$this->Inbox();
		/*	$this->load->model("perfil_model");
		$this->load->model("mensaje_model");

		$data["lista_egresados"] = $this->perfil_model->getUsuarioEgresados();
		$data["lista_empresas"] = $this->perfil_model->getUsuarioEmpresas();
		$data["lista_publicadores"] = $this->perfil_model->getUsuarioPublicadores();
		
		$data["no_inbox"] = $this->mensaje_model->listarInbox(array("usuario_id"=>getUsuarioId()))->num_rows();
		$data["no_sent"] = $this->mensaje_model->listarSent(array("usuario_id"=>getUsuarioId()))->num_rows();
		$data["no_drafts"] = $this->mensaje_model->listarDrafts(array("usuario_id"=>getUsuarioId()))->num_rows();

		$this->load->view("cabecera");
		$this->load->view("nav");
		$this->load->view("mensaje/correo",$data);
		$this->load->view("mensaje/nuevo_mensaje");
		$this->load->view("footer");*/
	}

	function Inbox(){
	
		$where = array(
			"usuario_id"=>getUsuarioId());
		$like = array();
		if(isset($_POST['busqueda']) && !empty($_POST['busqueda'])){
			$like["asunto"] = $this->input->post("busqueda");
		}

		$result = $this->mensaje->listarInbox($where,$like);
		
		$data["cantidad_inbox"] = $this->mensaje->contar_inbox(getUsuarioId());
		$data["cantidad_sent"] = $this->mensaje->contar_sent(getUsuarioId());
		$data["cantidad_drafts"] = $this->mensaje->contar_drafts(getUsuarioId());

		$data["mensajes"] = $result;
		$this->load->view("templates/header");
		$this->load->view("templates/menu");
		$this->load->view("correo/inbox",$data);
		$this->load->view("correo/redactar_mensaje",$data);
		$this->load->view("templates/footer");
		
	}

	function Sent(){

		$filtro = array(
			"usuario_id"=>getUsuarioId());

		$like = array();
		if(isset($_POST['busqueda']) && !empty($_POST['busqueda'])){
			$like["asunto"] = $this->input->post("busqueda");
		}

		$result = $this->mensaje->listarSent($filtro,$like);

		$data["mensajes"] = $result;
		$data["cantidad_inbox"] = $this->mensaje->contar_inbox(getUsuarioId());
		$data["cantidad_sent"] = $this->mensaje->contar_sent(getUsuarioId());
		$data["cantidad_drafts"] = $this->mensaje->contar_drafts(getUsuarioId());

		$this->load->view("templates/header");
		$this->load->view("templates/menu");
		$this->load->view("correo/sent",$data);
		$this->load->view("correo/redactar_mensaje",$data);
		$this->load->view("templates/footer");
	}

	function Drafts(){

		$filtro = array(
			"usuario_id"=>getUsuarioId());
		$like = array();
		if(isset($_POST['busqueda']) && !empty($_POST['busqueda'])){
			$like["asunto"] = $this->input->post("busqueda");
		}

		$result = $this->mensaje->listarDrafts($filtro,$like);
			
		$data["cantidad_inbox"] = $this->mensaje->contar_inbox(getUsuarioId());
		$data["cantidad_sent"] = $this->mensaje->contar_sent(getUsuarioId());
		$data["cantidad_drafts"] = $this->mensaje->contar_drafts(getUsuarioId());
		
		$data["mensajes"] = $result;
		$this->load->view("templates/header");
		$this->load->view("templates/menu");
		$this->load->view("correo/drafts",$data);
		$this->load->view("correo/redactar_mensaje",$data);
		$this->load->view("templates/footer");
	}

	function eliminar_mensajes(){
		
		$mensajes = $this->input->post("mensajes");
		if(is_array($mensajes)){
			if($mensajes){
				for($i = 0; $i < count($mensajes); $i++){
					if(is_numeric($mensajes[$i])){
						$this->mensaje->actualizarTablaEliminados(getUsuarioId(),$mensajes[$i],true);
					}
				}
			}
		}else{
			if(is_numeric($mensajes)){
				$this->mensaje->actualizarTablaEliminados(getUsuarioId(),$mensajes[$i],true);
			}
		}	
	}

	function leer_inbox(){
		
		$data_mensaje = array(
			"mensaje_id"=>$this->input->post("mensaje_id"));
		
		$result = $this->mensaje->listarInbox($data_mensaje);
		if($result->num_rows() > 0){
			$data["mensaje"] = $result->row();
			$this->load->view("correo/leer_inbox",$data);

			$this->mensaje->registrar_leido(getUsuarioId(),$this->input->post("mensaje_id"));
		}
	}

	function leer_sent(){

		$data_mensaje = array(
			"mensaje_id"=>$this->input->post("mensaje_id"));
		
		$result = $this->mensaje->listarSent($data_mensaje);
		if($result->num_rows() > 0){
			$data["mensaje"] = $result->row();
			$this->load->view("correo/leer_sent",$data);
		}
	}

	function enviar_mensaje(){

		if(isset($_POST["mensaje_id"])){
			$this->mensaje->destruirBorrador($this->input->post("mensaje_id"));
		}

		$data_mensaje["usuario_id"] = getUsuarioId();
		$data_mensaje["asunto"]	= $this->input->post("asunto");
		$data_mensaje["mensaje"] = nl2br($this->input->post("mensaje"));
		$data_mensaje["fecha_envio"] = date("Y-m-d");
		$data_mensaje["curr_adjuntado"] = FALSE;

		if($_POST["curr_adj"] == 'true'){
			$data_mensaje["curr_adjuntado"] = TRUE;
		}
		
		$data_destino["mensaje_id"] = $this->mensaje->insertarMensaje($data_mensaje);//insertamos y caputarmos el ultimo id generado
		$arr_usuarios = $this->input->post("usuarios");
		
		foreach ($arr_usuarios as $key => $value) {
			$data_destino["usuario_id"] = $value;

			#Insertamos el id del destinatario y el id del mensaje
			$this->mensaje->insertarDestinoMensaje($data_destino);

			#Actualizamos la tabla de mensajes eliminados
			$this->mensaje->registrarEnTablaEliminados(getUsuarioId(),$data_destino["mensaje_id"]);
			$this->mensaje->registrarEnTablaEliminados($data_destino["usuario_id"],$data_destino["mensaje_id"]);
		}
	}	

	function guardar_borrador(){

		$data_mensaje["asunto"]	= $this->input->post("asunto");
		$data_mensaje["mensaje"] = $this->input->post("mensaje");
		$data_mensaje["usuario_id"] = getUsuarioId();
		$data_mensaje["curr_adjuntado"] = FALSE;

		if(isset($_POST["curr_adjuntado"]) && $_POST["curr_adjuntado"] == 'true'){
			$data_mensaje["curr_adjuntado"] = TRUE;
		}

		$data_borrador["mensaje_id"] = $this->mensaje->insertarMensaje($data_mensaje);
		
		$data_borrador["usuario_id"] = getUsuarioId();
		$data_borrador["fecha_creacion"] = date("Y-m-d");
		$this->mensaje->insertarBorrador($data_borrador);
	}

	function destruir_borradores(){
		
		$mensajes = $this->input->post("mensajes");
		foreach ($mensajes as $key => $value) {
			$this->mensaje->destruirBorrador($value);
		}
	}

	function CargarBorrador(){
	
		$mensaje_id = $this->input->get("mensaje");
		$query = $this->mensaje->listarDrafts(array("mensaje_id"=>$mensaje_id));
		
		if($query->num_rows() > 0){
		
			$row = $query->row();
			echo json_encode(array("asunto"=>$row->asunto,"mensaje"=>$row->mensaje,"mensaje_id"=>$row->mensaje_id,"curr_adjuntado"=>$row->curr_adjuntado));
		}
	}

	function ActualizarMensaje(){
		
		$data_mensaje["asunto"]	= $this->input->post("asunto");
		$data_mensaje["mensaje"] = $this->input->post("mensaje");

		$data_borrador["mensaje_id"] = $this->mensaje->guardarMensaje($data_mensaje);
	}

	function buscar_inbox(){

		if($_POST["campo"] == "correo"){
			$campo = "remitente";
		}else{
			$campo = $this->input->post("campo");	
		}
		
		$busqueda = $this->input->post("busqueda");

		$data = array(
			$campo=>$busqueda);

		$result = $this->mensaje->listarInbox(array("usuario_id"=>getUsuarioId()),$data);
		$data["mensajes"] = $result;
		$this->load->view("mensaje/listar_inbox",$data);
	}

	function BuscarSent(){

		if(isset($_POST["campo"]) && $_POST["campo"] =="correo"){
			$campo = "destinatario";
		}else{
			$campo = $this->input->post("campo");	
		}

		$busqueda = $this->input->post("busqueda");

		$data = array(
			$campo=>$busqueda);

		$result = $this->mensaje->listarSent(array("usuario_id"=>getUsuarioId()),$data);
		$data["mensajes"] = $result;
		$this->load->view("mensaje/listar_sent",$data);
	}

	function BuscarDrafts(){

		if($this->input->post("campo") == "correo"){
			return;
		}
		$campo = $this->input->post("campo");
		$busqueda = $this->input->post("busqueda");

		$filtro = array($campo=>$busqueda);
		$result = $this->mensaje->listarDrafts(array("usuario_id"=>getUsuarioId()),$filtro);
		$data["mensajes"] = $result;
		$this->load->view("mensaje/listar_drafts",$data);
	}

	function BuscarEnviados(){
		$data["sent"] = $this->mensajes->getMensajes(array("remitente_id"=>getUsuarioID()),$_POST);
		if($data["sent"]->num_rows() > 0){
			$this->load->view("mensaje/listar_mensajes",$data);
		}else{
			echo "<br><br><h3 class='text-center'>[No se han encontrado resultados]</h3>";
		}
		
	}
	
	function BuscarBorrador(){
		$data["drafts"] = $this->mensajes->getMensajes(array("remitente_id"=>getUsuarioID(),"borrador"=>true),$_POST);
		if($data["drafts"] != null){
			$this->load->view("mensaje/listar_mensajes",$data);
		}else{
			echo "<br><br><h3 class='text-center'>[No se han encontrado resultados]</h3>";
		}
		
	}
}
?>