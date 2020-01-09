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

return true;         
?>