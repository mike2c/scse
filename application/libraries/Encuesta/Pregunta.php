<?php
	
	class Pregunta{

		private $id_pregunta = null;
		private $pregunta = null;

		function __construct($pregunta = null, $id_pregunta = null){
			$this->pregunta = $pregunta;
			$this->id_pregunta = $id_pregunta;
		}

		/*Getter methods*/

		public function getPregunta(){
			return $this->pregunta;
		}

		public function getIdPregunta(){
			return $this->id_pregunta;
		}

		/*Setter methods*/

		public function setPregunta($pregunta){
			$this->pregunta = $pregunta;
		}

		public function setIdPregunta($id_pregunta){
			$this->id_pregunta = $id_pregunta;
		}
	}
?>