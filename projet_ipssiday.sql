-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 08 Janvier 2020 à 08:39
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet_ipssiday`
--

-- --------------------------------------------------------

--
-- Structure de la table `conference`
--

CREATE TABLE `conference` (
  `conf_ID_Conference` int(5) NOT NULL,
  `conf_ID_Intervenant` int(5) NOT NULL,
  `conf_Heure_Début` time DEFAULT NULL,
  `conf_Heure_Fin` time DEFAULT NULL,
  `conf_Numero_Salle` int(5) DEFAULT NULL,
  `conf_Places_Disponible` int(5) DEFAULT NULL,
  `conf_Date_Conference` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `date`
--

CREATE TABLE `date` (
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `date_intervenant`
--

CREATE TABLE `date_intervenant` (
  `da-in_Date` date NOT NULL,
  `da-in_ID_Intervenant` int(11) NOT NULL,
  `da-in_Heure_debut` time DEFAULT NULL,
  `da-in_Heure_fin` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `date_participant`
--

CREATE TABLE `date_participant` (
  `da-par_Date` date NOT NULL,
  `da-par_ID_Participant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `grade`
--

CREATE TABLE `grade` (
  `gra_id_grade` int(5) NOT NULL,
  `gra_nom` varchar(255) NOT NULL,
  `gra_prix` double DEFAULT NULL,
  `gra_systeme` varchar(255) NOT NULL,
  `gra_visibilite` varchar(500) NOT NULL,
  `gra_quantité` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `grade`
--

INSERT INTO `grade` (`gra_id_grade`, `gra_nom`, `gra_prix`, `gra_systeme`, `gra_visibilite`, `gra_quantité`) VALUES
(1, 'Bronze', NULL, 'Cagnotte en ligne ', 'Logo sur le site', 999),
(2, 'Silver', 400, 'Donation pour l’événement + Possibilité de produits pour la Tombola.', 'Logo sur le site - Goodies de l’entreprise distribués - Présence sur la bâche Sponsors.', 20),
(3, 'Gold', 900, 'Donation pour l’événement + Produits pour la Tombola.', 'Logo sur le site - Goodies de l’entreprise distribués - Présence sur la bâche Sponsors - Flyers positionnées sur une table à l’entrée - 1 Publication sur nos réseaux sociaux.', 10),
(4, 'Platinium', 2000, 'Donation pour l’événement + Produits pour la Tombola.', 'Logo sur le site - Goodies de l’entreprise distribués - Présence sur la bâche Sponsors - Flyers positionnées sur une table à l’entrée - 2 Publications sur nos réseaux sociaux - Présence dans une salle des plus gros donateurs avec un espace dédiés s\'ils le souhaitent.', 8),
(5, 'Ultimate', 5000, 'Donation pour l’événement + Produits pour la Tombola', 'Logo sur le site - Goodies de l’entreprise distribués - Présence sur la bâche Sponsors - Flyers positionnées sur une table à l’entrée - 2 Publications sur nos réseaux sociaux - Présence dans une salle des plus gros donateurs avec un espace dédiés s\'ils le souhaitent - Discours avant la tombola avec temps de présentation de l’entreprise (3 premiers) - Salle VIP où ils pourront manger, boire et poser leur affaire en sécurité. ', 3);

-- --------------------------------------------------------

--
-- Structure de la table `intervenant`
--

CREATE TABLE `intervenant` (
  `in_id_intervenant` int(11) NOT NULL,
  `in_mail_intervenant` varchar(50) NOT NULL,
  `in_telephone_intervenant` int(10) NOT NULL,
  `in_nom_intervenant` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

CREATE TABLE `participant` (
  `par_ID_Participant` int(11) NOT NULL,
  `par_Nom` text NOT NULL,
  `par_Prenom` text NOT NULL,
  `par_Mail` varchar(255) DEFAULT NULL,
  `par_Telephone` int(11) DEFAULT NULL,
  `par_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reseaux`
--

CREATE TABLE `reseaux` (
  `res_id_reseau` int(5) NOT NULL,
  `res_libelle_reseau` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reseau_intervenant`
--

CREATE TABLE `reseau_intervenant` (
  `res-in_ID_Reseau` int(11) NOT NULL,
  `res-in_ID_Intervenant` int(11) NOT NULL,
  `res-in_Lien` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sponsor`
--

CREATE TABLE `sponsor` (
  `spo_id_sponsor` int(5) NOT NULL,
  `spo_nom_Sponsor` varchar(255) NOT NULL,
  `spo_adresse_entreprise` varchar(255) DEFAULT NULL,
  `spo_Code_postal_entreprise` int(5) DEFAULT NULL,
  `spo_logo` varchar(255) DEFAULT NULL,
  `spo_description` varchar(255) DEFAULT NULL,
  `spo_telephone` int(10) NOT NULL,
  `spo_mail_Sponsor` varchar(255) NOT NULL,
  `spo_id_grade` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `conference`
--
ALTER TABLE `conference`
  ADD PRIMARY KEY (`conf_ID_Conference`),
  ADD KEY `ID_Intervenant` (`conf_ID_Intervenant`);

--
-- Index pour la table `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`Date`);

--
-- Index pour la table `date_intervenant`
--
ALTER TABLE `date_intervenant`
  ADD PRIMARY KEY (`da-in_Date`,`da-in_ID_Intervenant`),
  ADD KEY `da-in_Date` (`da-in_Date`),
  ADD KEY `da-in_ID_Intervenant` (`da-in_ID_Intervenant`);

--
-- Index pour la table `date_participant`
--
ALTER TABLE `date_participant`
  ADD PRIMARY KEY (`da-par_Date`,`da-par_ID_Participant`),
  ADD KEY `da-par_Date` (`da-par_Date`),
  ADD KEY `da-par_ID_Participant` (`da-par_ID_Participant`);

--
-- Index pour la table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`gra_id_grade`);

--
-- Index pour la table `intervenant`
--
ALTER TABLE `intervenant`
  ADD PRIMARY KEY (`in_id_intervenant`);

--
-- Index pour la table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`par_ID_Participant`),
  ADD KEY `par_Date` (`par_Date`);

--
-- Index pour la table `reseaux`
--
ALTER TABLE `reseaux`
  ADD PRIMARY KEY (`res_id_reseau`);

--
-- Index pour la table `reseau_intervenant`
--
ALTER TABLE `reseau_intervenant`
  ADD PRIMARY KEY (`res-in_ID_Reseau`,`res-in_ID_Intervenant`),
  ADD KEY `ID_Reseau` (`res-in_ID_Reseau`),
  ADD KEY `ID_Intervenant` (`res-in_ID_Intervenant`);

--
-- Index pour la table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`spo_id_sponsor`),
  ADD KEY `id_grade` (`spo_id_grade`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `conference`
--
ALTER TABLE `conference`
  MODIFY `conf_ID_Conference` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `grade`
--
ALTER TABLE `grade`
  MODIFY `gra_id_grade` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `intervenant`
--
ALTER TABLE `intervenant`
  MODIFY `in_id_intervenant` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `participant`
--
ALTER TABLE `participant`
  MODIFY `par_ID_Participant` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `reseaux`
--
ALTER TABLE `reseaux`
  MODIFY `res_id_reseau` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `spo_id_sponsor` int(5) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `date_intervenant`
--
ALTER TABLE `date_intervenant`
  ADD CONSTRAINT `date_intervenant_ibfk_1` FOREIGN KEY (`da-in_Date`) REFERENCES `date` (`Date`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `date_intervenant_ibfk_2` FOREIGN KEY (`da-in_ID_Intervenant`) REFERENCES `intervenant` (`in_id_intervenant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `date_participant`
--
ALTER TABLE `date_participant`
  ADD CONSTRAINT `date_participant_ibfk_1` FOREIGN KEY (`da-par_Date`) REFERENCES `date` (`Date`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `date_participant_ibfk_2` FOREIGN KEY (`da-par_ID_Participant`) REFERENCES `participant` (`par_ID_Participant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `intervenant`
--
ALTER TABLE `intervenant`
  ADD CONSTRAINT `intervenant_ibfk_1` FOREIGN KEY (`in_id_intervenant`) REFERENCES `conference` (`conf_ID_Intervenant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reseau_intervenant`
--
ALTER TABLE `reseau_intervenant`
  ADD CONSTRAINT `reseau_intervenant_ibfk_1` FOREIGN KEY (`res-in_ID_Reseau`) REFERENCES `reseaux` (`res_id_reseau`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reseau_intervenant_ibfk_2` FOREIGN KEY (`res-in_ID_Intervenant`) REFERENCES `intervenant` (`in_id_intervenant`);

--
-- Contraintes pour la table `sponsor`
--
ALTER TABLE `sponsor`
  ADD CONSTRAINT `sponsor_ibfk_1` FOREIGN KEY (`spo_id_grade`) REFERENCES `grade` (`gra_id_grade`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
