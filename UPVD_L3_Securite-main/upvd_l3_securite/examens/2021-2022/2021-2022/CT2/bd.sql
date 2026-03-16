
USE l2info;

DROP TABLE IF EXISTS Transaction;
DROP TABLE IF EXISTS tab;


CREATE TABLE Transaction(id INT PRIMARY KEY, nom VARCHAR(30), montant INT);
INSERT INTO Transaction VALUES(1,'Durant',30);
INSERT INTO Transaction VALUES(2,'Martin',50);
INSERT INTO Transaction VALUES(3,'Durant',20);
INSERT INTO Transaction VALUES(4,'Martin',-10);
INSERT INTO Transaction VALUES(5,'Esposito',20);
INSERT INTO Transaction VALUES(6,'Durant',-50);

/*CREATE TABLE Transaction(id INT PRIMARY KEY, nom VARCHAR(30), montant INT);*/