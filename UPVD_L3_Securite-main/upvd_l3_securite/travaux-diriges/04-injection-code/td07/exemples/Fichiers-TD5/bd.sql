
USE l2info;

# Suppression des tables

DROP TABLE IF EXISTS Transaction;

DROP TABLE IF EXISTS Test;

DROP TABLE  IF EXISTS Commentaires;

# Creation des tables 
CREATE TABLE Transaction( id INT PRIMARY KEY,
   nom VARCHAR(50) NOT NULL, 
   montant INT, annee INT);

CREATE TABLE Test( id INT PRIMARY KEY,  val INT);

CREATE TABLE Achat(id INT PRIMARY KEY AUTO_INCREMENT, prix INT, quantite INT);


CREATE TABLE Commentaires(id INT AUTO_INCREMENT, 
          login VARCHAR(30), 
         commentaire VARCHAR(300),
          PRIMARY KEY(id));

# on remplit les tables

# Transactions
INSERT INTO Transaction VALUES(1,'Dupont',300,2015);
INSERT INTO Transaction VALUES(2,'Esposito',415,2012);
INSERT INTO Transaction VALUES(3,'Pinot',10100,2019);
INSERT INTO Transaction VALUES(4,'Dupont',410,2022);
INSERT INTO Transaction VALUES(5,'Pinot',35,2018);
INSERT INTO Transaction VALUES(6,'Durand',1119,2017);
INSERT INTO Transaction VALUES(7,'Dupont',1115,2016);

# Test
INSERT INTO Test VALUES(1,32719);
INSERT INTO Test VALUES(2,1792342);

# Commentaires
INSERT INTO  Commentaires(login,commentaire) VALUES("michael", "Really interisting");
INSERT INTO  Commentaires(login,commentaire) VALUES("elena", "Please provide references !!");
INSERT INTO  Commentaires(login,commentaire) VALUES("zoro", "Get out of here, the page is infected !");
INSERT INTO  Commentaires(login,commentaire) VALUES("michael", "Really ?");
