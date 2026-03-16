
USE l2info;

DROP TABLE IF EXISTS Taches;
DROP TABLE IF EXISTS Users;

-- Table Users
CREATE TABLE Users(id INT PRIMARY KEY, login VARCHAR(30), password VARCHAR(30));
INSERT INTO Users VALUES(1,'Marc','1234');
INSERT INTO Users VALUES(2,'Anna','2345');
INSERT INTO Users VALUES(3,'Eric','3456');


-- Table Transactions
CREATE TABLE Taches(id INT,date DATE,   tache VARCHAR(200), FOREIGN KEY(id) REFERENCES Users(id), PRIMARY KEY(id, date) );
INSERT INTO Taches VALUES(1,  '2022-04-12', 'Livraison Mr Robert');
INSERT INTO Taches VALUES(2,   '2022-04-12', 'Accueil Client Mr Customer');
INSERT INTO Taches VALUES(1,   '2022-04-13', 'Livraison Papetterie Gribouille');
INSERT INTO Taches VALUES(3,   '2022-04-12', 'Presentation bilan annuel');
INSERT INTO Taches VALUES(2,   '2022-04-14', 'Reunion avec DRH');
INSERT INTO Taches VALUES(1,   '2022-04-15', 'Livraison Epicerie Le Bocal');
