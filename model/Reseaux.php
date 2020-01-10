<?php

require_once("functionBDD.php");

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
	
	function addReseauIntervenant($id_intervenant){
        $co_db=connectBDD();
        $sql = $co_db->prepare('INSERT INTO reseau_intervenant(res-in_ID_Reseau,res-in_ID_Intervenant,res-in_Lien,in_prenom_intervenant) VALUES(:id_res,:id_int,:link)');
		$sql->bindValue("id_res","$this->par_Nom",PDO::PARAM_STR);
		$sql->bindValue("id_int","$this->par_Nom",PDO::PARAM_STR);
        $sql->bindValue("link","$this->par_Mail",PDO::PARAM_STR);
		$sql->execute();
        return true;
	}



}