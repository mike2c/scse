<?php
	
	class Respuesta{

		private $respuesta = null;
		private $id_respuesta = null;
		
		function __construct($respuesta = null, $id_respuesta = null){

			$this->respuesta = $respuesta;
			$this->id_respuesta = $id_respuesta;
		}

		#setters

		public function getRespuesta(){
			return $this->respuesta;
		}

		public function getIdRespuesta(){
			return $this->id_respuesta;
		}

		#getters

		public function setRespuesta($respuesta){
			$this->respuesta = $respuesta;
		}

		public function setIdRespuesta($id_respuesta){
			$this->id_respuesta = $id_respuesta;
		}
	}

?>