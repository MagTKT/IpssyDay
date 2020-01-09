<?php

require_once("model/functionBDD.php");

class Reseaux
{
	private $id_reseau;
	private $res_libelle_reseau;
	private $res_logo_reseau;

	public function __construct(){
	}

	public function getReseau(){
		$co_db=connectBDD();
		$sql=$co_db->prepare("SELECT * FROM reseaux");
		$sql->execute();
		$reseau=$sql->fetchAll(PDO::FETCH_ASSOC);
		return $reseau;
	}

	public function getQuantiteOeuvre(){
		return $this->quantiteOeuvre;
	}

	public function setPretEffectuer(){
		$this->quantiteOeuvre=$this->quantiteOeuvre-1;
	}
}