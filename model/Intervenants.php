<?php

require_once("functionBDD_model.php");

class Intervenant
{
	private $par_ID_Participant;
	private $par_Nom;
	private $par_Prenom;
	private $par_Mail;
	private $par_Telephone;
	
	public function __construct(string $name,string $firstname, string $email_address, string $phone){
		$this->par_Nom=$name;
		$this->par_Prenom=$firstname;
		$this->par_Mail=$email_address;
		$this->par_Telephone=$phone;
	}

	public function getOneIntervenant($mail){
		$co_db=connectBDD();
		$sql=$co_db->prepare("SELECT * FROM intervenant WHERE in_mail_intervenant=:mail_intervenant");
		$sql->bindValue("mail_intervenant","$mail",PDO::PARAM_STR);
		$sql->execute();
		$oneSponsor=$sql->fetch();//PDO::FETCH_ASSOC
		return $oneSponsor;
	}

	function addIntervenant(){
        $co_db=connectBDD();
        $sql = $co_db->prepare('INSERT INTO intervenant(in_mail_intervenant,in_telephone_intervenant,in_nom_intervenant,in_prenom_intervenant) VALUES(:mail,:tel,:nom,:prenom)');
		$sql->bindValue("nom","$this->par_Nom",PDO::PARAM_STR);
		$sql->bindValue("prenom","$this->par_Prenom",PDO::PARAM_STR);
        $sql->bindValue("mail","$this->par_Mail",PDO::PARAM_STR);
        $sql->bindValue("tel","$this->par_Telephone",PDO::PARAM_STR);
		$sql->execute();
        return true;
	}
	
	function getIdIntervenant(){
		return $this->$spo_id_sponsor;
	}
}