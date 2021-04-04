CREATE SCHEMA rozliczenia;

CREATE TABLE rozliczenia.pracownicy(id_pracownika integer PRIMARY KEY, imie varchar(15) NOT NULL, nazwisko varchar(40) NOT NULL, adres varchar(50) NOT NULL, telefon integer NOT NULL);
CREATE TABLE rozliczenia.godziny(id_godziny integer PRIMARY KEY, dataa date  NOT NULL, liczba_godzin integer NOT NULL, id_pracownika integer  NOT NULL);
CREATE TABLE rozliczenia.pensje(id_pensji integer PRIMARY KEY, stanowisko varchar(40), kwota real  NOT NULL, id_premii integer);
CREATE TABLE rozliczenia.premie(id_premii integer PRIMARY KEY, rodzaj varchar(40), kwota real);

INSERT INTO rozliczenia.pracownicy VALUES (1, 'Mariusz', 'Zięba', 'Kraków aleja 29 listopada 45', 889484838);
INSERT INTO rozliczenia.pracownicy VALUES (2, 'Mateusz', 'Nowak', 'Kraków Zazamcze 45', 834499978);
INSERT INTO rozliczenia.pracownicy VALUES (3, 'Jacek', 'Lama', 'Dąbrowa Długa 45', 734459978);
INSERT INTO rozliczenia.pracownicy VALUES (4, 'Andrzej', 'Kompres', 'Warszawa Powstańców 57', 664455978);
INSERT INTO rozliczenia.pracownicy VALUES (5, 'Zdzisław', 'Kowalski', 'Kraków Szeroka 65', 824499513);
INSERT INTO rozliczenia.pracownicy VALUES (6, 'Grażyna', 'Bania', 'Kraków Inwalidów 12', 732699978);
INSERT INTO rozliczenia.pracownicy VALUES (7, 'Anna', 'Nowak', 'Tarnów Sucharskiego 22', 632496918);
INSERT INTO rozliczenia.pracownicy VALUES (8, 'Mateusz', 'Baza', 'Tarnów Gumińskiej 36', 534459771);
INSERT INTO rozliczenia.pracownicy VALUES (9, 'Karolina', 'Kawa', 'Kraków Ozdobna 25', 734422178);
INSERT INTO rozliczenia.pracownicy VALUES (10, 'Zofia', 'Mila', 'Kraków Szkolna 111', 632439971);

INSERT INTO rozliczenia.godziny VALUES (1, '10 Jan 2021', 40, 1);
INSERT INTO rozliczenia.godziny VALUES(2, '10 Jan 2021', 20, 3);
INSERT INTO rozliczenia.godziny VALUES(3, '10 Jan 2021', 40, 5);
INSERT INTO rozliczenia.godziny VALUES(4, '10 Jan 2021', 40, 2);
INSERT INTO rozliczenia.godziny VALUES(5, '10 Jan 2021', 30, 7);
INSERT INTO rozliczenia.godziny VALUES(6, '10 Jan 2021', 40, 4);
INSERT INTO rozliczenia.godziny VALUES(7, '10 Jan 2021', 20, 8);
INSERT INTO rozliczenia.godziny VALUES(8, '10 Jan 2021', 40, 9);
INSERT INTO rozliczenia.godziny VALUES(9, '10 Jan 2021', 20, 6);
INSERT INTO rozliczenia.godziny VALUES(10, '10 Jan 2021', 40, 10);

INSERT INTO rozliczenia.pensje VALUES (1, 'CEO', 25000, 1);
INSERT INTO rozliczenia.pensje VALUES (2, 'QA', 10000, 2);
INSERT INTO rozliczenia.pensje VALUES (3, 'HR', 6000, 3);
INSERT INTO rozliczenia.pensje VALUES (4, 'Senior Dev', 15000, 4);
INSERT INTO rozliczenia.pensje VALUES (5, 'Mid Dev', 12000, 5);
INSERT INTO rozliczenia.pensje VALUES (6, 'Software Tester', 9000, 6);
INSERT INTO rozliczenia.pensje VALUES (7, 'Junior Dev', 4000, 7);
INSERT INTO rozliczenia.pensje VALUES (8, 'Cleaning Service', 3500, 8);
INSERT INTO rozliczenia.pensje VALUES (9, 'Intern', 1800, 9);
INSERT INTO rozliczenia.pensje VALUES (10, 'Secretary', 4500, 10);

INSERT INTO rozliczenia.premie VALUES (1, 'Uznaniowa', 2000);
INSERT INTO rozliczenia.premie VALUES (2, 'Uznaniowa', 400);
INSERT INTO rozliczenia.premie VALUES (3, 'Regulaminowa', 200);
INSERT INTO rozliczenia.premie VALUES (4, 'Uznaniowa', 200);
INSERT INTO rozliczenia.premie VALUES (5, 'Uznaniowa', 400);
INSERT INTO rozliczenia.premie VALUES (6, 'Regulaminowa', 50);
INSERT INTO rozliczenia.premie VALUES (7, 'Uznaniowa', 100);
INSERT INTO rozliczenia.premie VALUES (8, 'Regulaminowa', 100);
INSERT INTO rozliczenia.premie VALUES (9, 'Uznaniowa', 300);
INSERT INTO rozliczenia.premie VALUES (10, 'Uznaniowa', 100);

ALTER TABLE rozliczenia.godziny
	ADD FOREIGN KEY(id_pracownika)
	REFERENCES rozliczenia.pracownicy(id_pracownika);
	
ALTER TABLE rozliczenia.pensje
	ADD FOREIGN KEY(id_premii)
	REFERENCES rozliczenia.premie(id_premii);
	
SELECT nazwisko, adres FROM rozliczenia.pracownicy;

ALTER TABLE rozliczenia.pensje
	RENAME COLUMN kwota TO kwota_brutto;
	
ALTER TABLE rozliczenia.pensje ADD kwota_netto integer;
UPDATE rozliczenia.pensje
SET kwota_netto = kwota_brutto*0.73;

 SELECT dataa, EXTRACT(MONTH FROM dataa)
 FROM rozliczenia.godziny
-- Odnośnie polecenia 6.a z nieznanych mi przyczyn nie byłem w stanie go zrobić gdyż poecenia typu 
-- SELECT dataa, EXTRACT(DOW FROM DATE dataa) FROM rozliczenia.godziny modyfikowane na tysiąc sposobów za każdym razem
-- zwracały albo błąd albo zero w kolumnach
