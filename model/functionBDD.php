<?php

require_once('config/config.php');

function connectBDD ()
{
    try {
        return new PDO(
            sprintf('mysql:host=%s;dbname=%s', DATABASE_CONFIG['DB_HOSTNAME'], DATABASE_CONFIG['DB_NAME']),
            DATABASE_CONFIG['LOGIN'],
            DATABASE_CONFIG['PASS']
        );
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage() . "<br/>";
        die();
    }
}