<?php
// Check for empty fields
if(empty($_POST['name'])      ||
   empty($_POST['prenom']) ||
   empty($_POST['email'])     ||
   empty($_POST['phone'])     ||
   //empty($_POST['type_sign_in']) ||
   !filter_var($_POST['email'],FILTER_VALIDATE_EMAIL)) //Filtre une variable avec un filtre spécifique - Retourne les données filtrées, ou FALSE si le filtre échoue.
   {
    echo "No arguments Provided!";
    return false;
   }

$name = htmlspecialchars($_POST['name']);
$prenom = htmlspecialchars($_POST['prenom']);
$email_address = htmlspecialchars($_POST['email']);
$phone = htmlspecialchars($_POST['phone']);


//require_once('../model/Sponsor.php');
//$sponsor = new Sponsor($name, $email_address, $phone);
//$verif=$sponsor->addSponsor();

require_once('../model/Participant.php');
$participant = new Participant($name,$prenom,$email_address, $phone);
$verif=$participant->addParticipant();


if(!empty($_POST['id_link'])&&(!empty($_POST['link']))){
  $id_link=htmlspecialchars($_POST['id_link']);
  $link=htmlspecialchars($_POST['link']);

  $reseaux=new Reseaux();
  $id_intervenant=$intervenant->getIdIntervenant();

  $reseaux->addReseauIntervenant($id_intervenant);
}else{
  $id_link='';
  $link='';
}



return true
/*

if ($this.attr("type") !== undefined && $this.attr("type").toLowerCase() === "email") {
  message = "Not a valid email address<!-- data-validator-validemail-message to override -->";
  if ($this.data("validationValidemailMessage")) {
    message = $this.data("validationValidemailMessage");
  } else if ($this.data("validationEmailMessage")) {
    message = $this.data("validationEmailMessage");
  }
  $this.data("validationValidemailMessage", message);
}

*/   
?>
