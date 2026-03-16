USE l2info;

DROP TABLE IF EXISTS Seance;
DROP TABLE IF EXISTS Film;
DROP TABLE IF EXISTS Artiste;

/*** Creation des Tables ***/
CREATE TABLE Users(
	iduser INT PRIMARY KEY,
	login VARCHAR(20),
	email VARCHAR(30),	
);

CREATE TABLE Images(
	idimg INT PRIMARY KEY,
	fichier VARCHAR(40),
	keywords VARCHAR(200),
	FOREIGN KEY(iduser) REFERENCES Users(user)
 );
 

CREATE TABLE Comments(
	idcomment INT PRIMARY KEY,
	comment VARCHAR(500),
	FOREIGN KEY(idimg) REFERENCES Images(idimg),
	FOREIGN KEY(iduser) REFERENCES Users(iduser),		
);

/*** Users ***/
INSERT INTO Users VALUES(1,"Alice","alice@gigle.com");
INSERT INTO Users VALUES(2,"Bob","bob@youpi.com");
INSERT INTO Users VALUES(3,"Luke","luke@underwater.com");
INSERT INTO Users VALUES(4,"Anna","anna@sun.com");

/*** Images ***/
INSERT INTO Images VALUES(1,"img4720.jpg","vacation greece 2023",1);
INSERT INTO Images VALUES(2,"img1190.jpg","vegetarian athena 2023",1);
INSERT INTO Images VALUES(3,"img3541.jpg","fun beach 2022",1);
INSERT INTO Images VALUES(4,"img2920.jpg","hike guatemala 2019",3);


/*** Comments ***/
INSERT INTO Comments VALUES(1,"Les couleurs sont magnifiques !",1,2);
INSERT INTO Comments VALUES(2,"Ça me donne envie de partir en voyage !",1,3);
INSERT INTO Comments VALUES(3,"C était ou ca ?",3,2);
INSERT INTO Comments VALUES(3,"Que de superbe souvenir...",1,1);
INSERT INTO Comments VALUES(3,"Ca me donne faim...",2,2);
INSERT INTO Comments VALUES(3,"C est tellement paisible ...",3,4);

