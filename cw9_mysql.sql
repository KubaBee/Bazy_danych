CREATE DATABASE cw9;
USE cw9;

CREATE SCHEMA tabela_stratygraficzna2;

CREATE TABLE tabela_stratygraficzna2.GeoEon(id_eon INT NOT NULL AUTO_INCREMENT, nazwa_eon VARCHAR(30) NOT NULL, PRIMARY KEY (id_eon));
CREATE TABLE tabela_stratygraficzna2.GeoEra(id_era INT NOT NULL AUTO_INCREMENT, id_eon INT, nazwa_era VARCHAR(30) NOT NULL, PRIMARY KEY (id_era), FOREIGN KEY (id_eon) REFERENCES GeoEon(id_eon));
CREATE TABLE tabela_stratygraficzna2.GeoOkres(id_okres INT NOT NULL AUTO_INCREMENT, id_era INT, nazwa_okres VARCHAR(30) NOT NULL, PRIMARY KEY (id_okres), FOREIGN KEY (id_era) REFERENCES GeoEra(id_era));
CREATE TABLE tabela_stratygraficzna2.GeoEpoka(id_epoka INT NOT NULL AUTO_INCREMENT, id_okres INT, nazwa_epoka VARCHAR(30) NOT NULL, PRIMARY KEY (id_epoka), FOREIGN KEY (id_okres) REFERENCES GeoOkres(id_okres));
CREATE TABLE tabela_stratygraficzna2.GeoPietro(id_pietro INT NOT NULL AUTO_INCREMENT,id_epoka INT, nazwa_pietro VARCHAR(30) NOT NULL, PRIMARY KEY(id_pietro), FOREIGN KEY (id_epoka) REFERENCES GeoEpoka(id_epoka));

INSERT INTO tabela_stratygraficzna2.GeoEon(nazwa_eon)
VALUES ('FANEROZOIK');

INSERT INTO tabela_stratygraficzna2.GeoEra(id_eon, nazwa_era)
VALUES (1,'Kenozoik'),(1,'Mezozoik'),(1,'Paleozoik');

INSERT INTO tabela_stratygraficzna2.GeoOkres(id_era, nazwa_okres)
VALUES (1,'Czwartorząd'),(1,'Neogen'),(1,'Paleogen'),
       (2,'Kreda'),(2,'Jura'),(2,'Trias'),
       (3,'Perm'),(3,'Karbon'),(3,'Dewon'),(3,'Sylur'),(3,'Ordowik'),(3,'Kambr');

INSERT INTO tabela_stratygraficzna2.GeoEpoka(id_okres, nazwa_epoka)
VALUES (1,'Holocen'),(1,'Plejstocen'),
       (2,'Pliocen'),(2,'Miocen'),
       (3,'Oligocen'),(3,'Eocen'),(3,'Paleocen'),
       (4,'Późna'),(4,'Wczesna'),
       (5,'Późna'),(5,'Środkowa'),(5,'Wczesna'),
       (6,'Późny'),(6,'Środkowy'),(6,'Wczesny'),
       (7,'Loping'),(7,'Gwadalup'),(7,'Cisural'),
       (8,'Pensylwan'),(8,'Missisip'),
       (9,'Późny'),(9,'Środkowy'),(9,'Wczesny'),
       (10, 'Przydol'),(10, 'Ludlow'),(10, 'Wenlok'),(10, 'Landower'),
       (11,'Późny'),(11,'Środkowy'),(11,'Wczesny'),
       (12,'Furong'),(12,'Miaoling'),(12,'Jakut'),(12,'Terenew');

INSERT INTO tabela_stratygraficzna2.GeoPietro(id_epoka, nazwa_pietro)
VALUES (1, 'Megalaj'),(1, 'Nortgryp'),(1, 'Grenland'),
       (2, 'Tarant'),(2, 'Chiban'),(2, 'Kalabr'),(2, 'Gelas'),
       (3, 'Piacent'),(3, 'Zankl'),
       (4, 'Messyn'),(4, 'Torton'),(4, 'Serrawal'),(4, 'Lang'),(4, 'Burdygał'),(4, 'Akwitan'),
       (5, 'Szat'),(5, 'Rupel'),
       (6, 'Priabon	'),(6, 'Barton'),(6, 'Lutet'),(6, 'Iprez'),
       (7, 'Tanet'),(7, 'Zeland'),(7, 'Dan'),
       (8, 'Mastrych'),(8, 'Kampan'),(8, 'Santon'),(8, 'Koniak'),(8, 'Turon'),(8, 'Cenoman'),
       (9, 'Alb'),(9, 'Apt'),(9, 'Barrem'),(9, 'Hoteryw'),(9, 'Walanżyn'),(9, 'Berrias'),
       (10, 'Tyton'),(10, 'Kimeryd'),(10, 'Oksford'),
       (11, 'Kelowej'),(11, 'Baton'),(11, 'Bajos'),(11, 'Aalen'),
       (12, 'Toark'),(12, 'Pliensbach'),(12, 'Synemur'),(12, 'Hettang'),
       (13, 'Retyk'),(13, 'Noryk'),(13, 'Karnik'),
       (14, 'Ladyn'),(14, 'Anizyk'),
       (15, 'Olenek'),(15, 'Ind'),
       (16, 'Czangsing'),(16, 'Wucziaping'),
       (17, 'Kapitan'),(17, 'Word'),(17, 'Road'),
       (18, 'Kungur'),(18, 'Artinsk'),(18, 'Sakmar'),(18, 'Assel'),
       (19, 'Gżel'),(19, 'Kasimow'),(19, 'Moskow'),(19, 'Baszkir'),
       (20, 'Serpuchow'),(20, 'Wizen'),(20, 'Turnej'),
       (21, 'Famen'),(21, 'Fran'),
       (22, 'Żywet'),(22, 'Eifel'),
       (23, 'Ems'),(23, 'Prag'),(23, 'Lochkow'),
       (24, 'Przydol'),
       (25, 'Ludford'),(25, 'Gorst'),
       (26, 'Homer'),(26, 'Szejnwud'),
       (27, 'Telicz'),(27, 'Aeron'),(27, 'Ruddan'),
       (28, 'Hirnant'),(28, 'Kat'),(28, 'Sandb'),
       (29, 'Darriwil'),(29, 'Daping'),
       (30, 'Flo'),(20, 'Tremadok'),
       (31, 'Lawson'),(31, 'Dziangszan'),(31, 'Paib'),
       (32, 'Gużang'),(32, 'Drum'),(32, 'Wuliuan'),
       (33, 'Tojon'),(33, 'Atdaban'),
       (34, 'Tomot'),(34, 'Fortun');
       
CREATE TABLE tabela_stratygraficzna2.GeoTabela AS (SELECT * FROM tabela_stratygraficzna2.GeoPietro NATURAL JOIN tabela_stratygraficzna2.GeoEpoka NATURAL JOIN tabela_stratygraficzna2.GeoOkres NATURAL JOIN tabela_stratygraficzna2.GeoEra NATURAL JOIN tabela_stratygraficzna2.GeoEon );

CREATE TABLE tabela_stratygraficzna2.Dziesiec(cyfra INT ,bitt INT);
INSERT INTO tabela_stratygraficzna2.Dziesiec(cyfra)
VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);

CREATE TABLE tabela_stratygraficzna2.Milion(liczba INT,cyfra INT, bitt INT);
INSERT INTO  tabela_stratygraficzna2.Milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra + 10000*a5.cyfra + 100000*a6.cyfra 
AS liczba , a1.cyfra AS cyfra, a1.bitt AS bitt FROM tabela_stratygraficzna2.Dziesiec a1, tabela_stratygraficzna2.Dziesiec a2, 
												tabela_stratygraficzna2.Dziesiec a3, tabela_stratygraficzna2.Dziesiec a4,
                                                tabela_stratygraficzna2.Dziesiec a5, tabela_stratygraficzna2.Dziesiec a6;

-- Zapytania
 
SELECT COUNT(*) FROM tabela_stratygraficzna2.Milion INNER JOIN tabela_stratygraficzna2.GeoTabela ON
    (mod(tabela_stratygraficzna2.Milion.liczba,102)=(GeoTabela.id_pietro));
    
SELECT COUNT(*) FROM tabela_stratygraficzna2.Milion INNER JOIN tabela_stratygraficzna2.GeoPietro  ON
    (mod(Milion.liczba,102)=GeoPietro.id_pietro) NATURAL JOIN tabela_stratygraficzna2.GeoEpoka NATURAL JOIN tabela_stratygraficzna2.GeoOkres NATURAL JOIN tabela_stratygraficzna2.GeoEra NATURAL JOIN tabela_stratygraficzna2.GeoEon;

SELECT COUNT(*) FROM tabela_stratygraficzna2.Milion WHERE mod(tabela_stratygraficzna2.Milion.liczba,102) =
                                                          (SELECT id_pietro FROM tabela_stratygraficzna2.GeoTabela WHERE mod(Milion.liczba,102)=(id_pietro));

SELECT COUNT(*) FROM tabela_stratygraficzna2.Milion WHERE mod(tabela_stratygraficzna2.Milion.liczba,102) IN
                                                          (SELECT tabela_stratygraficzna2.GeoPietro.id_pietro FROM tabela_stratygraficzna2.GeoPietro NATURAL JOIN tabela_stratygraficzna2.GeoEpoka NATURAL JOIN tabela_stratygraficzna2.GeoOkres NATURAL JOIN tabela_stratygraficzna2.GeoEra NATURAL JOIN tabela_stratygraficzna2.GeoEon);
-- Indeksy


CREATE INDEX indeks5 ON tabela_stratygraficzna2.GeoTabela (id_pietro);
CREATE INDEX indeks6 ON tabela_stratygraficzna2.Milion(liczba);


-- DROP INDEX indeks5 ON tabela_stratygraficzna2.GeoTabela;
-- DROP INDEX indeks6 ON tabela_stratygraficzna2.Milion;

SELECT COUNT(*) FROM tabela_stratygraficzna2.Milion INNER JOIN tabela_stratygraficzna2.GeoTabela ON
    (mod(tabela_stratygraficzna2.Milion.liczba,102)=(GeoTabela.id_pietro));
    
SELECT COUNT(*) FROM tabela_stratygraficzna2.Milion INNER JOIN tabela_stratygraficzna2.GeoPietro  ON
    (mod(Milion.liczba,102)=GeoPietro.id_pietro) NATURAL JOIN tabela_stratygraficzna2.GeoEpoka NATURAL JOIN tabela_stratygraficzna2.GeoOkres NATURAL JOIN tabela_stratygraficzna2.GeoEra NATURAL JOIN tabela_stratygraficzna2.GeoEon;

SELECT COUNT(*) FROM tabela_stratygraficzna2.Milion WHERE mod(tabela_stratygraficzna2.Milion.liczba,102) =
                                                          (SELECT id_pietro FROM tabela_stratygraficzna2.GeoTabela WHERE mod(Milion.liczba,102)=(id_pietro));

SELECT COUNT(*) FROM tabela_stratygraficzna2.Milion WHERE mod(tabela_stratygraficzna2.Milion.liczba,102) =
                                                          (SELECT tabela_stratygraficzna2.GeoPietro.id_pietro FROM tabela_stratygraficzna2.GeoPietro NATURAL JOIN tabela_stratygraficzna2.GeoEpoka NATURAL JOIN tabela_stratygraficzna2.GeoOkres NATURAL JOIN tabela_stratygraficzna2.GeoEra NATURAL JOIN tabela_stratygraficzna2.GeoEon);

