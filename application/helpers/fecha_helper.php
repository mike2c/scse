<?php
	function format_date($old_date){
		$fecha = date(str_replace("/", "-", $old_date));
		$newfecha = new DateTime($fecha);
		return date_format($newfecha,"Y-m-d");
	}
	
	function menor_o_igual($fechaInicio,$fechaFinal){
		if ($fechaInicio==null && $fechaFinal==null) {
			return TRUE;	
		}elseif($fechaInicio>$fechaFinal){
			return FALSE;
		}elseif ($fechaInicio==$fechaFinal){
			return TRUE;
		}else{
			return TRUE;
		}
	}
	
	/*anio plox*/
	function obtener_anio_actual(){
		$timestamp = strtotime('Y');
		return idate('Y',$timestamp);
	}
	/*retorna false en caso de que la fecha ingresada no sea 16 años menor que el año actual*/
	function validarFechaNacimiento($fecha){
		$anio_actual = obtener_anio_actual();
		$anio_correcto = $anio_actual - 16;
		$anio_ingresado = date("Y", strtotime($fecha));
		
		if($anio_ingresado>$anio_correcto){
			return false;
		}
		return true;
	}

	/*Convierte una fecha Y-m-d a d-m-Y.
     *Toma como paramentro un string con la fecha en formato Y-m-d*/
	function date_toDMY($str_date){
		
		$d8 = date_create($str_date);
		return date_format($d8,"d/m/Y");
	}
?>