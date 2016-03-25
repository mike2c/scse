<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Categoria_Pregunta_Model extends CI_Model{

		function __construct(){
			parent::__construct();
		}

		function listar_categorias(){
			
			return $this->db->get("categoria");
		}

	}
?>