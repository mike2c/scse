<?php

	class Usuario{

		/*Declaracion de variables globales*/
		private $id_usuario = null;
		private $correo = null;

		function __construct($id_usuario = null, $correo = null){
			
			$this->id_usuario = $id_usuario;
			$this->correo = $correo;
		}

		public function getIdUsuario(){
			return $this->id_usuario;
		}

		public function getCorreo(){
			return $this->correo;
		}

		public function setIdUsuario($id_usuario){

			$this->id_usuario = $id_usuario;
		}

		public function setCorreo($correo){

			$this->correo = $correo;
		}
	}
?>