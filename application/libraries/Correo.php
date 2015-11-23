<?php if (!defined('BASEPATH')) exit('No permitir el acceso directo al script');
	class Correo{
		function __contruct(){
			parent::__contruct();
		}
		
		public function correoPublicaciones($data){
			$CI = & get_instance();
			$CI->load->library("email");
			$CI->email->set_newline("\r\n");
			
			$CI->email->from("scseuninorte@gmail.com","Universidad Nacional de Ingeniería");
			$CI->email->reply_to("scseuninorte@gmail.com","Universidad Nacional de Ingeniería");
			$CI->email->to($data["destinatario"]);
			$CI->email->subject($data["asunto"]);
			$CI->email->message($data["mensaje"]);
	
			if (!$CI->email->send()) {
				echo "ERROR, no se pudo enviar el mensaje";
				echo $CI->email->print_debugger();
			}else {
				return TRUE;
			}
		} 
	}
?>