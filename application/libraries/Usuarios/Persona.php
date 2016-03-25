<?php
	include_once "Usuario.php";// Nos aseguramos de agregarlo solo una vez
	
	class Persona extends Usuario{

		private $id_persona = null;
		private $nombre = null;
		private $apellido = null;
		private $genero = null;

		function __construct($nombre = null, $apellido = null, $genero =null){
			
			$this->nombre = $nombre;
			$this->apellido = $apellido;
			$this->genero = $genero;
		}

		/*Getters methods*/

		public function getIdPersona(){
			return $this->id_persona;
		}

		public function getNombreCompleto(){
			return $this->nombre. " ". $this->apellido;
		}

		public function getNombre(){
			return $this->nombre;
		}

		public function getApellido(){
			return $this->apellido;
		}

		public function getGenero(){
			return $this->genero;
		}

		/*Setters methods*/
		public function setIdPersona($id_persona){
			$this->id_persona´= $id_persona;
		}

		public function setNombre($nombre){
			$this->nombre = $nombre;
		}

		public function setApellido($apellido){
			$this->apellido = $apellido;
		}

		public function setGenero($genero){
			$this->genero = $genero;
		}

	}
?>