<?php
// Check for empty fields
if(empty($_POST['name_sign_in'])      ||
   empty($_POST['email_sign_in'])     ||
   empty($_POST['phone_sign_in'])     ||
   (empty($_POST['id_link'])  && 
   empty($_POST['link']))   ||
   !filter_var($_POST['email'],FILTER_VALIDATE_EMAIL)) //Filtre une variable avec un filtre spécifique - Retourne les données filtrées, ou FALSE si le filtre échoue.
   {
    echo "No arguments Provided!";
    return false;
   }

$name = strip_tags(htmlspecialchars($_POST['name_sign_in']));
$email_address = strip_tags(htmlspecialchars($_POST['email_sign_in']));
$phone = strip_tags(htmlspecialchars($_POST['phone_sign_in']));

$id_link=strip_tags(htmlspecialchars($_POST['id_link']));
$link=strip_tags(htmlspecialchars($_POST['link']));

require_once('model/Sponsor.php');
$sponsor = new Sponsor($name, $email_address, $phone);

$verif=$sponsor->addSponsor();
if($verif===true)
{
   return false;  
}else{
   return true;
}
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
