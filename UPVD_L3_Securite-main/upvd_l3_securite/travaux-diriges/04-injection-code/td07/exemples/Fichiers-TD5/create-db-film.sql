USE l2info;

DROP TABLE IF EXISTS Film;
DROP TABLE IF EXISTS Artiste;

 CREATE TABLE Artiste(
	idartiste INT PRIMARY KEY,
	nom VARCHAR(20)
	);
	
CREATE TABLE Film(
	idfilm INT PRIMARY KEY,
	titre VARCHAR(40),
	idrealisateur INT,
	FOREIGN KEY(idrealisateur) REFERENCES Artiste(idartiste)
 );


INSERT INTO Artiste VALUES(1,"Kubrick");
INSERT INTO Artiste VALUES(2,"Lynch");
INSERT INTO Artiste VALUES(3,"Polanski");
INSERT INTO Artiste VALUES(4,"Bunuel");
INSERT INTO Artiste VALUES(5,"Gilliam");
INSERT INTO Artiste VALUES(6,"Tarantino");
INSERT INTO Artiste VALUES(7,"Donner");
INSERT INTO Artiste VALUES(8,"Miller");

INSERT INTO Film VALUES(1,"Orange Mecanique",1);
INSERT INTO Film VALUES(2,"Mululholland Drive",2);
INSERT INTO Film VALUES(3,"Le Locataire",3);
INSERT INTO Film VALUES(4,"Superman 2",7);
INSERT INTO Film VALUES(5,"Las vegas Parano",5);
INSERT INTO Film VALUES(6,"Brazil",5);
INSERT INTO Film VALUES(7,"Kill Bill",6);
INSERT INTO Film VALUES(8,"Orange Mecanique",1);
INSERT INTO Film VALUES(9,"Les sentiers de la gloire",1);
INSERT INTO Film VALUES(10,"Sin City",8);

