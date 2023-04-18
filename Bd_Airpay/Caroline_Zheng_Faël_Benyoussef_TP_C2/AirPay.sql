



/*


Ce script est un script permettant de créer la base de donnée de l'entreprise Airpay.


Airpay est une entreprise spécialisé dans la vente de pièce détaché d'avion dans le domaine aéronautique.


L'entreprise nous à sollicité afin de pouvoir mettre en place une base de donnée permettant de pouvoir récupérer leurs chiffres d'affaires, ainsi que l'ensemble des dépenses et des recettes sur chaque mois.


Un chiffre d'affaire sur un mois correspond au total de la somme des recette + la somme des dépenses sur ce mois.


Une recette correspond à une transaction (une vente de l'entreprise à un particulier où à une entreprise tierce) ayant eu lieu sur une date précise.


Une dépense correspond à une transaction (un achat ou une rétribution en l'échange d'un service) de la part de l'entreprise envers une entreprise tierce.


Les données que vous verrez dans ce schéma ont étaient générés aléatoirement toute en essayant de correspondre au maximum à la réalité et aux résultats attendus par l'entreprise AirPay.


*/

-- Création de la base de données

-- a)

drop schema if exists AirPay cascade;

create schema AirPay;

set search_path to AirPay;

create table produits(
 idproduit SERIAL,
 nom varchar(50),
 type varchar(50),
CONSTRAINT produits_PK PRIMARY KEY (idproduit)
);


create table postesDepenses(
 idPostDepenses serial,
 nomDest varchar(50),
 typeDepense varchar(50),
 CONSTRAINT postesDepenses_PK PRIMARY KEY (idPostDepenses)
);


create table chiffreAffaire(
 idCa serial,
 chiffreAffaire float not null,
 dateCa Date,
 CONSTRAINT chiffreAffaire_PK PRIMARY KEY (idCa)
);


create table transaction(
 idTransac serial,
 prixTransac int not null,
 dateTransac date,
 CONSTRAINT transaction_PK PRIMARY KEY (idTransac)
);


create table recette(
 idRecette serial,
 idTransac int not null,
 idProduit int not null,
 CONSTRAINT recette_PK PRIMARY KEY (idRecette),
 CONSTRAINT fk_recette_transaction FOREIGN KEY (idTransac) REFERENCES transaction (idTransac) ON UPDATE CASCADE,
CONSTRAINT fk_recette_produit FOREIGN KEY (idProduit) REFERENCES produits (idProduit) ON UPDATE CASCADE
);


create table depense(
 idDepenses serial,
 idTransac int not null,
 idPostDepenses int not null,
 CONSTRAINT depense_PK PRIMARY KEY (idDepenses),
 CONSTRAINT fk_depense_transaction FOREIGN KEY (idTransac) REFERENCES transaction (idTransac) ON UPDATE CASCADE,
CONSTRAINT fk_depense_postesDepenses FOREIGN KEY (idPostDepenses) REFERENCES postesDepenses (idPostDepenses) ON UPDATE CASCADE
);


--b)


insert INTO produits(nom,type) values
 ('Gouverne_Airbus_A320','Gouverne_de_direction'),
 ('Moteur_Hélicoptère_Tigre','Moteur'),
 ('Aileron_Boeing_770','Aileron_externe'),
 ('Roue_Airbus_A380','Roue_Avant'),
 ('Cockpit_Concorde','Cockpit'),
 ('Helice_Helicoptère_beta','Helice'),
 ('Winglet_Dassault_Rafale','Winglet'),
 ('Voiture_Dassault Mirage', 'Voiture'),
 ('Emplanature_Lockheed_Martin','Emplanature'),
 ('Mitrailleurse_Apache','Mitrailleuse');

--c)


insert INTO postesDepenses(nomDest,typeDepense) values
 ('Engie','éléctricité'),
 ('Maintenance','Maintenance'),
 ('Sodec','Entretien'),
 ('Etat','Impôts'),
 ('Employé','Salaire'),
 ('ParisHabitat','Loyer'),
 ('AviationEquipement','Achat équipement');



 create table temp(prixTransac int not null, dateTransac date);


insert into temp values
  (1480000,'2021-04-01'),--
  (1488000,'2021-04-02'),
  (-4452000,'2021-04-03'),
  (2004000,'2022-04-01'),
  (2204000,'2022-04-04'),
  (-6312000,'2022-04-07'),
  (2000000,'2022-07-25'),
  (500000,'2022-07-15'),
  (-3164000,'2022-07-31'),
  (50000,'2023-01-14'),
  (10000,'2023-01-8'),--
  (-96000,'2023-01-31'),
(2004000,'2022-04-01'),
(2204000,'2022-04-04'),
(-6312000,'2022-04-07'),
(140000,'2022-05-01'),
(180000,'2022-05-11'),
(-75000,'2022-05-21'),
(300000,'2022-06-01'),
(340000,'2022-06-08'),
(-110000,'2022-06-22'),
(2000000,'2022-07-25'),
(500000,'2022-07-15'),
(-3164000,'2022-07-31'),
(70000,'2022-08-01'),
(80000,'2022-08-16'),
(-20000,'2022-08-23'),
(90000,'2022-09-01'),
(100000,'2022-09-13'),
(-35000,'2022-09-28'),
(50000,'2023-01-14'),--
(10000,'2023-01-8'),--
(-96000,'2023-01-31'),--
(110000,'2023-02-01'),--
(120000,'2023-02-14'),
(-55000,'2023-02-27'),
(170000,'2023-03-01'),
(180000,'2023-03-09'),
(-90000,'2023-03-25');--




INSERT INTO transaction(prixTransac,dateTransac) values

  (1480000,'2021-04-01'),--
  (1488000,'2021-04-02'),
  (-4452000,'2021-04-03'),
  (2004000,'2022-04-01'),
  (2204000,'2022-04-04'),
  (-6312000,'2022-04-07'),
  (2000000,'2022-07-25'),
  (500000,'2022-07-15'),
  (-3164000,'2022-07-31'),
  (50000,'2023-01-14'),
  (10000,'2023-01-8'),--
  (-96000,'2023-01-31'),
  (2004000,'2022-04-01'),
(2204000,'2022-04-04'),
(-6312000,'2022-04-07'),
(140000,'2022-05-01'),
(180000,'2022-05-11'),
(-75000,'2022-05-21'),
(300000,'2022-06-01'),
(340000,'2022-06-08'),
(-110000,'2022-06-22'),
(2000000,'2022-07-25'),
(500000,'2022-07-15'),
(-3164000,'2022-07-31'),
(70000,'2022-08-01'),
(80000,'2022-08-16'),
(-20000,'2022-08-23'),
(90000,'2022-09-01'),
(100000,'2022-09-13'),
(-35000,'2022-09-28'),
(50000,'2023-01-14'),--
(10000,'2023-01-8'),--
(-96000,'2023-01-31'),--
(110000,'2023-02-01'),--
(120000,'2023-02-14'),
(-55000,'2023-02-27'),
(170000,'2023-03-01'),
(180000,'2023-03-09'),
(-90000,'2023-03-25');--


select sum(prixTransac) from temp where prixTransac>0;  
select sum(prixTransac) from temp where prixTransac<0;  


UPDATE transaction SET prixTransac = prixTransac -18384000
WHERE idtransac = (SELECT idtransac FROM transaction WHERE prixTransac <0 ORDER BY idtransac LIMIT 1);


UPDATE transaction SET prixTransac = prixTransac +23981000
WHERE idtransac = (SELECT idtransac FROM transaction WHERE prixTransac >0 ORDER BY idtransac LIMIT 1);


\COPY chiffreAffaire(chiffreAffaire) from 'chiffreAffaire.csv' delimiter ' ' CSV HEADER;




update chiffreAffaire set chiffreAffaire = cast(chiffreAffaire*1000000 as bigint);
UPDATE chiffreAffaire
SET  dateCa = date_trunc('month', current_date) -((idCa - 1) *interval '1 month');


\COPY transaction(prixTransac) from 'DataTransaction.csv' delimiter ',' CSV HEADER;

-- attribue une date à chaque transaction

UPDATE transaction SET dateTransac = '2022-02-15';

-- étape 4 :  Récupérer tous les id des transactions ayant une valeurs positives et les mettre en clé étrangère dans la table recette et mettre aléatoirement un idproduit compris entre 1 et 10.

INSERT INTO recette (idTransac,idProduit)
SELECT transaction.idTransac, ROUND(random() * 9 + 1)
FROM transaction
WHERE transaction.prixTransac >0;

-- etape 5 :  Récupérer les idTransac des valeurs négatives et les mettre en clé étrangère dans la table dépense et mettre aléatoirement un postDepense compris entre 1 et 10

INSERT INTO depense (idTransac,idPostDepenses)
SELECT transaction.idTransac,ROUND(random() * 6 + 1)
FROM transaction
WHERE transaction.prixTransac < 0;

\echo '1/ Création de la base de données\n'

\echo ': Création d une view  maxCa cherchant le chiffre d affaire le plus élevé parmi les 100 mois\n'

CREATE VIEW maxCa AS SELECT chiffreAffaire,dateCa
FROM chiffreAffaire
WHERE chiffreAffaire =(Select Max(chiffreAffaire) from chiffreAffaire);

\echo '\n Affichage de la views maxCa qui nous retourne le chiffre d affaire max\n'

SELECT * FROM maxCa;

/*
chiffreaffaire |   dateca 
----------------+------------
 24700000 | 2022-03-01
 24700000 | 2016-12-01


*/
-- on vérifie alors que la somme des transactions est égale au chiffre d'affaire max.

\echo '\n Requête vérifiant que la somme des transactions sur le mois ayant le chiffre d affaire le plus élevé est égale au chiffre d affaire max\n'

SELECT sum(prixTransac) as chiffreAffaireMAx from transaction;

--  Requêtes SQL


\echo '\n 2/ Requêtes SQL\n'


\echo 'Création de la vue sommeDepenses qui nous renvoie la somme des dépenses de l entreprise\n'

CREATE VIEW SommeDepenses AS

SELECT idDepenses,idPostDepenses,sum(prixTransac) over (ORDER BY idDepenses) AS CumulSomme
FROM depense NATURAL JOIN transaction;

\echo '\n récupère la somme des dépenses de l entreprise à partir de la view SommeDepenses créer auparavant\n'
SELECT * FROM SommeDepenses;


\echo 'On récupère la somme des dépenses à partir de la table transaction : \n'
SELECT sum(prixTransac) as sommeDepense FROM transaction WHERE prixTransac<0;



\echo 'Création de la vue differenceMoyenneRecette qui nous renvoie la moyenne des recettes\n'

CREATE VIEW differenceMoyenneRecette AS

SELECT idRecette,idTransac,prixTransac-avg(prixTransac)over () AS differencePrixEtMoy

FROM Transaction NATURAL JOIN recette

WHERE prixTransac>0

GROUP BY idrecette, idtransac;


\echo '\ Affichage de la vue differenceMoyenneRecette\n'


SELECT * FROM differenceMoyenneRecette;



\echo 'Création de la vue bilanTrimestrielle1 qui calcul le bilan trimestrielle sur 2 ans à partir de la table chiffreAffaire\n'


CREATE view bilanTrimestrielle as
SELECT
 DATE_TRUNC('quarter', dateCa) AS trimestre,
 SUM(chiffreAffaire) AS chiffre_affaire_trimestriel
FROM
 chiffreAffaire
WHERE
 dateCa >= (CURRENT_DATE - INTERVAL '24 month')
GROUP BY
 trimestre
 ORDER BY
 trimestre;

\echo '\n Affichage de la vue bilanTrimestrielle\n'

SELECT * FROM bilanTrimestrielle;


\echo 'Création de la vue BilantriNegCaNeg qui récupère tout les bilans trimestriels négatifs\n'

CREATE VIEW BilantriNegCaNeg AS
Select dateca, chiffreAffaire
FROM  chiffreAffaire
WHERE dateca in (select dateca from bilanTrimestrielle where chiffre_affaire_trimestriel<0);

\echo '\ Affichage de la vue BilantriNegCaNeg\n'

select * from BilantriNegCaNeg;


/*   dateca   | chiffreaffaire
------------+----------------
2021-04-01 |   -1484000
2022-04-01 |   -2104000
2022-07-01 |   -1664000
2023-01-01 |   -36000
(4 lignes)


*/

\echo 'Création d une vue qui récupére les mois contenue dans les bilan trimestriels négatifs\n'


create view moisDansTriNeg as
SELECT dateca
FROM BilantriNegCaNeg
WHERE (dateca >= '2021-04-01' AND dateca < '2021-07-01')
 OR (dateca >= '2022-04-01' AND dateca < '2022-07-01')
 OR (dateca >= '2022-07-01' AND dateca < '2022-10-01')
 OR (dateca >= '2023-01-01' AND dateca < '2023-04-01');


\echo '\n Affiche la vue moisDansTriNeg : l ensemble des mois contenue dans chaque bilan trimestrielle négatif\n'


select * from moisDansTriNeg;


 --
/*   dateca 
------------
2023-03-01
2023-02-01
2023-01-01
2022-09-01
2022-08-01
2022-07-01
2022-06-01
2022-05-01
2022-04-01
2021-06-01
2021-05-01
2021-04-01
(12 lignes)
*/

\echo 'Création de la vue difRecMoyNeg qui affiche les mois dont la différence entre la somme des recettes et moyenne des recettes est aussi négatif\n'


create view difRecMoyNeg as
SELECT EXTRACT(MONTH FROM mois_transac) AS mois
FROM (
 SELECT
  DATE_TRUNC('month', dateTransac) AS mois_transac,
  SUM(CASE WHEN prixTransac > 0 THEN prixTransac ELSE 0 END) AS total_positif,
  AVG(CASE WHEN prixTransac > 0 THEN prixTransac ELSE NULL END) FILTER (WHERE prixTransac > 0) AS moyenne_positif
 FROM transaction
 WHERE EXTRACT(MONTH FROM dateTransac) IN (SELECT EXTRACT(MONTH FROM dateca) FROM moisDansTriNeg)
 GROUP BY mois_transac
) subquery
WHERE total_positif - moyenne_positif < 0;


\echo '\n Affichage des mois dont la différence entre la somme des recettes mensuelles et la moyenne des recettes est négative\n'


select * from difRecMoyNeg;



--1 ère requête imbriquée


\echo ': requete imbriquée\n'


\echo 'première requête imbriquée: on donne les mois faisant parti des 5 chiffres d affaires les plus faibles\n'




SELECT  dateCa,chiffreaffaire
FROM chiffreaffaire WHERE chiffreaffaire in
(SELECT chiffreaffaire FROM chiffreaffaire ORDER BY chiffreaffaire desc) ORDER BY chiffreAffaire LIMIT 5;

/*
 dateca   | chiffreaffaire
------------+----------------
2015-04-01 |   -24670000
2017-03-01 |   -23200000
2022-05-01 |   -22850000
2016-01-01 |   -22570000
2019-09-01 |   -21900000
(5 rows)
*/


-- ATTENTION !!! Les résultats que vous aurez en lançant le script ne seront pas les mêmes que les notres, car les clés étrangéres (idProduit,idPostDepense)  sont générées aléatoirements à chaque lancement du script.


\echo ' ATTENTION !!! Les résultats que vous allez voir pour les deux requêtes suivantes ne sont  ne pas les mêmes que les notres,  les clés étrangéres (idProduit,idPostDepense) sont générées aléatoirements à chaque lancement du script.\n'


-- 2 ème requête imbriquée

\echo 'Deuxième requête imbriquée : recupère les transactions où le produit vendu est le produit ayant l id = 4\n'




SELECT idTransac,prixTransac,dateTransac
FROM transaction NATURAL JOIN recette
WHERE idProduit in (SELECT idProduit FROM transaction NATURAL JOIN recette where idProduit = 4);

-- verification :
\echo 'verification de la 1 ère requête imbriquée : récupère toutes les transactions ayant un id produit = 4 et étant dans la table recette\n'

SELECT idTransac,idproduit
FROM transaction NATURAL JOIN recette
where idProduit = 4;


-- 3 requête imbriquée


\echo 'troisième requête imbriquée : on récupére la somme des dépenses ou le typePostdepense à pour nom "équipements"\n'

SELECT typeDepense, sum(prixTransac)
FROM depense NATURAL JOIN postesDepenses INNER JOIN transaction USING(idTransac) WHERE typeDepense IN (SELECT typeDepense FROM postesDepenses WHERE typeDepense LIKE '%équipement%')GROUP BY typeDepense;


/*

 typedepense |   sum  
------------------+----------
Achat équipement | -1274560
(1 row)

*/









