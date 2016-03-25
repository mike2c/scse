<?php
	include_once "Persona.php";

	class Egresado extends Persona{

		private $id_egresado = null;
		private $cedula = null;
		private $carnet = null;
		private $titulado = null;
		private $trabaja = null;
		private $fecha_egresado = null; /* Solo se almacena el año y no el formato de fecha entero*/

		function __construct(){

		}

		/*Getter methods*/
	
		public function getIdEgresado(){
			return $this->id_egresado;
		}

		public function getCedula(){
			return $this->cedula;
		}

		public function getCarnet(){
			return $this->carnet;
		}

		public function getTitulado(){
			return $this->titulado;
		}

		public function getTrabaja(){
			return $this->trabaja;
		}

		public function getFechaEgresado(){
			return $this->fecha_egresado;
		}

		/*Setter methods*/

		public function setIdEgresado($id_egresado){
			return $this->id_egresado = $id_egresado;
		}

		public function setCedula($cedula){
			return $this->cedula = $cedula;
		}

		public function setCarnet($carnet){
			return $this->carnet = $carnet;
		}

		public function setTitulado($titulado){
			return $this->titulado = $titulado;
		}

		public function setTrabaja($trabaja){
			return $this->trabaja = $trabaja;
		}

		public function setFechaEgresado($fecha_egresado){
			return $this->fecha_egresado = $fecha_egresado;
		}
	}
?>