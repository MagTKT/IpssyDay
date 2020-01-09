<?php

require_once("model/functionBDD.php");

class Reseaux
{
	private $par_ID_Participant;
	private $par_Nom;
	private $par_Prenom;
	private $par_Mail;
	private $par_Telephone;
	private $par_Date;
	
	public function __construct(){
	}

	public function getOneSponsor($id){
		$sql=$co_db->prepare("SELECT * FROM sponsor WHERE spo_mail_Sponsor=:id_sponsor");
		$sql->bindValue("id_sponsor","$id",PDO::PARAM_INT);
		$sql->execute();
		$oneSponsor=$sql->fetchAll(PDO::FETCH_ASSOC);
		return $oneSponsor;
	}

	
}