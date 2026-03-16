
USE l2info;

# Suppression des tables

DROP TABLE IF EXISTS Livres;

DROP TABLE  IF EXISTS Users;

# Creation des tables 
CREATE TABLE Livres( id INT AUTO_INCREMENT,
   auteur VARCHAR(50) NOT NULL, 
   titre VARCHAR(200) NOT NULL, 
  annee INT, PRIMARY KEY(id));

CREATE TABLE Users( id INT  AUTO_INCREMENT,  login VARCHAR(30), passwd VARCHAR(30), PRIMARY KEY(id));

# on remplit les tables avec quelques données

# Livres
INSERT INTO Livres(auteur,titre,annee) VALUES('Victor Hugo','Les miserables',1860);
INSERT INTO Livres(auteur,titre,annee) VALUES('Jules Verne','Les vingt mille lieues sous les mers',1880);
INSERT INTO Livres(auteur,titre,annee) VALUES('J.R.R. Tolkien','Le seigneur des anneaux',1950);
INSERT INTO Livres(auteur,titre,annee) VALUES('Antoine Galland','Les mille et une nuits',1613);

# Users
INSERT INTO Users(login,passwd) VALUES('admin','1234');
