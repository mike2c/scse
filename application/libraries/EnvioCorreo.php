<?php if (!defined('BASEPATH')) exit('No permitir el acceso directo al script');
	class EnvioCorreo{
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

		public function correoMensaje($data){
			$CI = & get_instance();
			$CI->load->library(array("email","Session"));
			$CI->email->set_newline("\r\n");
			$CI->load->helper("sesion");
			
			$CI->email->from(getCorreo(),getNombreCompleto());
			$CI->email->reply_to(getCorreo(),getNombreCompleto());
			$CI->email->to($data["destinatario"]);
			$CI->email->subject($data["asunto"]);
			$CI->email->message($data["mensaje"]);
		
			$CI->email->send() or die();
		}

		/*if () {
			// Devuelve verdadero si el mensaje se envio
			
			# "ERROR, no se pudo enviar el mensaje";
			# $CI->email->print_debugger();
		}else {
			return TRUE;
		}*/
	}
?>