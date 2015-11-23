<?php

  class Sesion_model extends CI_Model{

  function __construct(){
    parent:: __construct();
    $this->load->library('session');
    $this->load->database();
  }

  function esAdministrador($data_usuario){

   $query = $this->db->query("select imagen,usuario.usuario_id,correo,concat(nombre,' ',apellido) as nombre from admin,usuario,persona where usuario.correo='$data_usuario[correo]' and usuario.clave='$data_usuario[clave]' and usuario.usuario_id = admin.usuario_id and persona.persona_id = admin.persona_id;");

   if($query->num_rows()>0){
    return $query->row_array();
   }
   return null;
  }                                                             

  function esEgresado($data_usuario){
   $query = $this->db->query("select imagen,usuario_id,correo,nombre,apellido from listar_egresados where correo = '$data_usuario[correo]' and clave = '$data_usuario[clave]';");
   if($query->num_rows()>0){
    return $query->row_array();
   }
   return null;
  }

  function esEmpresa($data_usuario){
   $query = $this->db->query("select imagen,usuario_id, nombre_empresa as nombre, correo from  listar_empresas where correo = '$data_usuario[correo]' and clave = '$data_usuario[clave]';");
   
   if($query->num_rows()>0){
    return $query->row_array();
   }
   return null;
  }

  function esPublicador($data){
   
   $query = $this->db->query("select imagen,nombre,apellido,usuario_id,correo from listar_publicadores where clave='$data[clave]' and correo='$data[correo]'");
   if($query->num_rows()>0){
    return $query->row_array();
   }
   return null;
  }

  function getSesion_id($user_id){
   $this->session->set_userdata($user_id['usuario_id']);
   $this->session->set_userdata('tipo_usuario',$user_id['tipo_usuario']);
  }

  function actualizarInfoUsuario($usuario){
  
    $this->db->query("update usuario set activo = TRUE where usuario_id='$usuario';");
    $this->db->query("update usuario set ultima_sesion='" . date('Y-m-d') . "' where usuario_id='$usuario';");

  }

}
