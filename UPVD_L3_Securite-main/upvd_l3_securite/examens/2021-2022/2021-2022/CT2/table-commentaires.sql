USE l2info;
DROP TABLE  IF EXISTS Commentaires;

CREATE TABLE Commentaires(id INT AUTO_INCREMENT, 
          login VARCHAR(30), 
         commentaire VARCHAR(300),
          PRIMARY KEY(id));

INSERT INTO  Commentaires(login,commentaire) VALUES("michael", "Really article");
INSERT INTO  Commentaires(login,commentaire) VALUES("elena", "Please provide references !!");
INSERT INTO  Commentaires(login,commentaire) VALUES("zoro", "Get out of here, the page is infected !");
INSERT INTO  Commentaires(login,commentaire) VALUES("michael", "Really ?");
