

--
-- Base de données : `cinema`
CREATE DATABASE CINEMA;

-- --------------------------------------------------------

--
-- Structure de la table `cinema`
--

CREATE TABLE IF NOT EXISTS cinema (
  id_cinema int(11) NOT NULL AUTO_INCREMENT,
  nomCinema varchar(80) NOT NULL,
  PRIMARY KEY (id_cinema)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS client (
  id_client int(11) NOT NULL AUTO_INCREMENT,
  nomClient varchar(10) NOT NULL,
  prenomClient varchar(10) NOT NULL,
  dateNaissance date NOT NULL,
  adresse_mail varchar(60) NOT NULL,
  PRIMARY KEY (id_client)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE IF NOT EXISTS film (
  titre varchar(100) NOT NULL,
  genre varchar(50) NOT NULL,
  nomAuteur varchar(50) NOT NULL,
  dateProduction date NOT NULL,
  id_film int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_film`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE IF NOT EXISTS reservation(
  id_reservation int(11) NOT NULL AUTO_INCREMENT,
  dateReservation date NOT NULL,
  tarif` float NOT NULL,
  id_client int(11) NOT NULL,
  PRIMARY KEY (id_reservation),
  foreign key id_client REFERENCES client (id_client)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE IF NOT EXISTS salle (
  id_salle int(11) NOT NULL AUTO_INCREMENT,
  nom varchar(50) NOT NULL,
  nbrePlace int(11) NOT NULL,
  id_cinema int(11) NOT NULL,
  PRIMARY KEY (id_salle),
   FOREIGN KEY (id_cinema) REFERENCES cinema(id_cinema)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Consulatation`
--

CREATE TABLE IF NOT EXISTS consultation (
  id_client int(11) NOT NULL ,
  id_film int(11)  NOT NULL,
  date_consultation int(11) NOT NULL,
  PRIMARY KEY (id_client, id_film)
  FOREIGN KEY (id_client) REFERENCES client(id_client)
  FOREIGN KEY (id_film) REFERENCES film(id_film)

) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- Structure de la table `projection`
--

CREATE TABLE IF NOT EXISTS projection (
  id_salle int(11) NOT NULL ,
  id_film int(11)  NOT NULL,
  PRIMARY KEY (id_salle, id_film)
  FOREIGN KEY (id_salle) REFERENCES salle(id_salle)
  FOREIGN KEY (id_film) REFERENCES film(id_film)

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


-- UPDATE table  `film`
 update film set nomAuteur='Lisa' where id_film = 1

-- Delete Table `film`

 delete from film  where titre = 'Matrix'
