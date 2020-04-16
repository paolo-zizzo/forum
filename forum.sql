-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 16 avr. 2020 à 13:18
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `forum`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `titre`) VALUES
(1, 'Assistance'),
(2, 'Nouvelles et informations'),
(3, 'Discussions sur le jeu');

-- --------------------------------------------------------

--
-- Structure de la table `dislikes`
--

DROP TABLE IF EXISTS `dislikes`;
CREATE TABLE IF NOT EXISTS `dislikes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_forum_reponses` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dislikes`
--

INSERT INTO `dislikes` (`id`, `id_forum_reponses`, `id_utilisateur`) VALUES
(31, 246, 5),
(30, 249, 5),
(24, 194, 1),
(14, 242, 4),
(12, 239, 4),
(32, 248, 10);

-- --------------------------------------------------------

--
-- Structure de la table `forum_reponses`
--

DROP TABLE IF EXISTS `forum_reponses`;
CREATE TABLE IF NOT EXISTS `forum_reponses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auteur` varchar(30) NOT NULL,
  `message` longtext NOT NULL,
  `date_reponse` datetime NOT NULL,
  `correspondance_sujet` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `forum_reponses`
--

INSERT INTO `forum_reponses` (`id`, `auteur`, `message`, `date_reponse`, `correspondance_sujet`) VALUES
(255, 'paolo1', 'blablabla', '2020-04-16 14:31:31', 94),
(256, 'paolo1', 'patch5.3', '2020-04-16 14:53:46', 95),
(257, 'paolo1', 'bonjour a tous', '2020-04-16 14:54:49', 96);

-- --------------------------------------------------------

--
-- Structure de la table `forum_sujets`
--

DROP TABLE IF EXISTS `forum_sujets`;
CREATE TABLE IF NOT EXISTS `forum_sujets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auteur` varchar(30) NOT NULL,
  `date_derniere_reponse` datetime NOT NULL,
  `titre` longtext NOT NULL,
  `correspondance_categorie` int(11) NOT NULL,
  `topic` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `forum_sujets`
--

INSERT INTO `forum_sujets` (`id`, `auteur`, `date_derniere_reponse`, `titre`, `correspondance_categorie`, `topic`) VALUES
(94, 'paolo1', '2020-04-16 14:31:31', 'débug', 1, 1),
(95, 'paolo1', '2020-04-16 14:53:46', 'Maj', 2, 4),
(96, 'paolo1', '2020-04-16 14:54:49', 'intro', 3, 14);

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_forum_reponses` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sous_categorie`
--

DROP TABLE IF EXISTS `sous_categorie`;
CREATE TABLE IF NOT EXISTS `sous_categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sous_categorie`
--

INSERT INTO `sous_categorie` (`id`, `titre`, `id_categorie`) VALUES
(1, 'Problème de compte et assistance technique', 1),
(2, 'Bugs : jeu, forum et site web', 1),
(3, 'Localisation / Traduction', 1),
(4, 'Acutalités et annonces', 2),
(5, 'Notes de mise à jour', 2),
(14, 'Coin de la communauté', 3),
(8, 'McM', 3),
(9, 'JcJ', 3);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `grade` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `login`, `password`, `grade`) VALUES
(10, 'paolo1', '$2y$12$0pYAPsIKo8HrNWb03dg5y.r7rgczI7C/qmpuyQMvWdw8LMt0nVk7i', 3),
(9, 'paolo', '$2y$12$ZlWs7UK5R/RxRvRsTD8XAOOrUC27ln9fUaiS7kb5LMIpDcPl.ObkO', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
