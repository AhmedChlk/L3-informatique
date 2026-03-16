USE l2info;

DROP TABLE IF EXISTS Comments;
DROP TABLE IF EXISTS Images;
DROP TABLE IF EXISTS Users;

/*** Creation des Tables ***/
CREATE TABLE Users(
	iduser INT PRIMARY KEY,
	login VARCHAR(20),
	email VARCHAR(30)	
);

CREATE TABLE Images(
	idimg INT PRIMARY KEY,
	fichier VARCHAR(40),
	keywords VARCHAR(200),
	iduser INT,
	FOREIGN KEY(iduser) REFERENCES Users(iduser)
 );
 

CREATE TABLE Comments(
	idcomment INT PRIMARY KEY AUTO_INCREMENT,
	comment VARCHAR(500),
	date DATE,
	idimg INT,
	iduser INT,
	FOREIGN KEY(idimg) REFERENCES Images(idimg),
	FOREIGN KEY(iduser) REFERENCES Users(iduser)		
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
INSERT INTO Images VALUES(5,"img7645.jpg","hike france 2022",2);
INSERT INTO Images VALUES(6,"img6598.jpg","christmas 2024",3);


/*** Comments ***/
INSERT INTO Comments(comment,date,idimg,iduser) VALUES("Les couleurs sont magnifiques !","2021-04-13", 1,2);
INSERT INTO Comments(comment,date,idimg,iduser) VALUES("Ça me donne envie de partir en voyage !","2022-02-2",1,3);
INSERT INTO Comments(comment,date,idimg,iduser) VALUES("C était ou ca ?","2022-09-21",3,2);
INSERT INTO Comments(comment,date,idimg,iduser) VALUES("Que de superbe souvenir...","2022-06-09",1,1);
INSERT INTO Comments(comment,date,idimg,iduser) VALUES("Ca me donne faim...","2024-07-19",2,2);
INSERT INTO Comments(comment,date,idimg,iduser) VALUES("C est tellement paisible ...","2024-12-24",3,4); -- ggggg
INSERT INTO Comments(comment,date,idimg,iduser) VALUES("Joyeux noel!","2024-12-24",6,1);
INSERT INTO Comments(comment,date,idimg,iduser) VALUES("Bonne rando! Tu nous raconteras!","2022-08-10",5,3);
INSERT INTO Comments(comment,date,idimg,iduser) VALUES("Quelle belle vue!","2022-08-07",5,1); 

