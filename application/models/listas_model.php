<?php defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Listas_model extends CI_Model{

		function __construct(){
			parent::__construct();
			$this->load->database();
			$this->load->helper("url");
		}	

		function listarDepartamentos(){
			return $this->db->get("departamento");
		}

		function listarMunicipios($departamento_id){
			$this->db->where("departamento_id",$departamento_id);
			return $this->db->get("municipio");
		}

		function listarCarreras(){
			return $this->db->get("carrera");
		}

		function listarSociedades(){
			return $this->db->get("sociedad");
		}

		function listarAreas(){
			return $this->db->get("area");
		}

		function listarCargos($area_id){
			$this->db->where("area_id",$area_id);
			return $this->db->get("cargo");
		}

		function listarTitulos(){
			return $this->db->get("titulo");
		}

		function registrarTitulo($titulo){
			$this->db->insert("titulo",array("titulo"=>$titulo));
		}

		function registrarArea($area){

			$this->db->insert("area",array("area"=>$area));
			return $this->db->insert_id();
		}

		function registrarCargo($area,$cargo){

			$this->db->insert("cargo",array("area_id"=>$area,"cargo"=>$cargo));
			return $this->db->insert_id();
		}

		#Registros
		function registrarSociedad($sociedad){

			$this->db->insert("sociedad",array("sociedad"=>$sociedad));
			return $this->db->insert_id();
		}
	}
?>