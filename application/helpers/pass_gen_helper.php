<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	function generarClave($longitud){
		$arr = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ12345678901234567890";
		$clave = "";
		
		for($i = 0; $i< $longitud; $i++){
			$clave = $clave . $arr{rand(0,strlen($arr)-1)};
		}

		return $clave;
	}
	
?>