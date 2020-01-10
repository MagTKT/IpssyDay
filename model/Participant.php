<?php

require_once("functionBDD_model.php");

class Participant
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

	public function getOneParticipant($mail){
		$co_db=connectBDD();
		$sql=$co_db->prepare("SELECT * FROM participant WHERE in_mail_participant=:mail_participant");
		$sql->bindValue("mail_participant","$mail",PDO::PARAM_STR);
		$sql->execute();
		$oneSponsor=$sql->fetch();//PDO::FETCH_ASSOC
		return $oneSponsor;
	}

	function addParticipant(){
        $co_db=connectBDD();
        $sql = $co_db->prepare('INSERT INTO participant(par_mail,par_telephone,par_nom,par_prenom) VALUES(:mail,:tel,:nom,:prenom)');
		$sql->bindValue("nom","$this->par_Nom",PDO::PARAM_STR);
		$sql->bindValue("prenom","$this->par_Prenom",PDO::PARAM_STR);
        $sql->bindValue("mail","$this->par_Mail",PDO::PARAM_STR);
        $sql->bindValue("tel","$this->par_Telephone",PDO::PARAM_STR);
		$sql->execute();
        return true;
	}
	
	function getIdParticipant(){
		return $this->$spo_id_sponsor;
	}
}