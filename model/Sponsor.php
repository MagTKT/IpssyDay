<?php

require_once("functionBDD_model.php");

class Sponsor
{
	private $spo_id_sponsor;
	private $spo_nom_Sponsor;
	private $spo_adresse_entreprise;
	private $spo_Code_postal_entreprise;
	private $spo_logo;
	private $spo_description;
    private $spo_telephone;
    private $spo_mail_Sponsor;
    private $spo_id_grade;

	public function __construct(string $nom,string $email,int $tel){
        $this->spo_nom_Sponsor=$nom;
		$this->spo_mail_Sponsor=$email;
        $this->spo_telephone=$tel;
	}

	public function getOneSponsor($mail){
		$co_db=connectBDD();
		$sql=$co_db->prepare("SELECT * FROM sponsor WHERE spo_mail_Sponsor=:mail_sponsor");
		$sql->bindValue("mail_sponsor","$mail",PDO::PARAM_STR);
		$sql->execute();
		$oneSponsor=$sql->fetch();//PDO::FETCH_ASSOC
		return $oneSponsor;
	}

	function addSponsor(){
        $co_db=connectBDD();
        $sql = $co_db->prepare('INSERT INTO sponsor(spo_nom_Sponsor,spo_mail_Sponsor,spo_telephone) VALUES(:nom,:mail,:tel)');
        $sql->bindValue("nom","$this->spo_nom_Sponsor",PDO::PARAM_STR);
        $sql->bindValue("mail","$this->spo_mail_Sponsor",PDO::PARAM_STR);
        $sql->bindValue("tel","$this->spo_telephone",PDO::PARAM_STR);
		$sql->execute();
        return true;
	}
	
	function getIdSponsor(){
		return $this->$spo_id_sponsor;
	}
}