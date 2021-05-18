

--
-- Base de données : `cinema`
CREATE DATABASE CINEMA;

-- --------------------------------------------------------

--
-- Structure de la table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
CREATE TABLE IF NOT EXISTS `cinema` (
  `nomCinema` varchar(80) NOT NULL,
  PRIMARY KEY (`nomCinema`(50))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(10) NOT NULL,
  `prenomClient` varchar(10) NOT NULL,
  `dateNaissance` date NOT NULL,
  `adresse_mail` varchar(60) NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `titre` varchar(100) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `nomAuteur` varchar(50) NOT NULL,
  `dateProduction` date NOT NULL,
  `id_film` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_film`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id_reservation` int(11) NOT NULL AUTO_INCREMENT,
  `dateReservation` date NOT NULL,
  `tarif` float NOT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `id_client` (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id_salle` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `nbrePlace` int(11) NOT NULL,
  `id_cinema` int(11) NOT NULL,
  PRIMARY KEY (`id_salle`),
  KEY `id_cinema` (`id_cinema`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Structure de la table `Users`
--
CREATE TABLE users
(
    email VARCHAR(254) NOT NULL UNIQUE,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(60) NOT NULL
);



/*******
*********Requettage de la base********
***************************************
*************************************/

-- insertion données de la table `reservation`


INSERT INTO `reservation` ( `dateReservation`, `tarif`, `id_client`) VALUES
(2, '2021-05-16', 10.5);


--  insertion  données de la table `client`


INSERT INTO `client` ( `nomClient`, `prenomClient`, `dateNaissance`, `adresse_mail`) VALUES
( 'negib', 'seyid', '1985-12-31', '5 rue richemont Locmine 50500'),
('NEGIB', 'nevissa', '1993-03-08', '5 rue richemont Locmine 50500');


------insertion table fILM

INSERT INTO `film` (`titre`, `genre`, `nomAuteur`, `dateProduction`, `id_film`) VALUES
('Matrix ', 'action', 'Lilly Wachowski', '1999-03-31');


-- UPDATE  dans la table  `film`
 update film set nomAuteur='Lisa' where id_film = 1

-- Delete de la Table `film`

 delete from film  where titre = 'Matrix'
