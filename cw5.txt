CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy(id_pracownika integer PRIMARY KEY, imie varchar(15) NOT NULL, nazwisko varchar(40) NOT NULL, adres varchar(50) NOT NULL, telefon integer NOT NULL);
COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela pracownikow';
CREATE TABLE ksiegowosc.godziny(id_godziny integer PRIMARY KEY, dataa date  NOT NULL, liczba_godzin integer NOT NULL, id_pracownika integer  NOT NULL);
COMMENT ON TABLE ksiegowosc.godziny IS 'Tabela godzin';
CREATE TABLE ksiegowosc.pensje(id_pensji integer PRIMARY KEY, stanowisko varchar(40), kwota numeric  NOT NULL, id_premii integer);
COMMENT ON TABLE ksiegowosc.pensje IS 'Tabela pensji';
CREATE TABLE ksiegowosc.wynagrodzenia(id_wynagrodzenia INT PRIMARY KEY , dataa DATE, id_pracownika INT NOT NULL , id_godziny INT NOT NULL, id_pensji INT NOT NULL, id_premii INT);
COMMENT ON TABLE ksiegowosc.wynagrodzenia IS 'Tabela wynagrodzen';
CREATE TABLE ksiegowosc.premie(id_premii integer PRIMARY KEY, rodzaj varchar(40), kwota numeric);
COMMENT ON TABLE ksiegowosc.premie IS 'Tabela premii';


INSERT INTO ksiegowosc.wynagrodzenia VALUES (1, '12 Jan 2021', 1, 1, 1, 1);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (2, '10 Jan 2021', 3, 2, 2, 2);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (3, '13 Jan 2021', 5, 3, 3, 3);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (4, '12 Jan 2021', 7, 4, 4, 4);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (5, '11 Jan 2021', 2, 5, 5, 5);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (6, '11 Jan 2021', 4, 6, 6, 6);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (7, '12 Jan 2021', 8, 7, 7, 7);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (8, '15 Jan 2021', 6, 8, 8, 8);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (9, '10 Jan 2021', 10, 9, 9, 9);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (10, '12 Jan 2021', 9, 10, 10, 10);


INSERT INTO ksiegowosc.pracownicy VALUES (1, 'Mariusz', 'Zięba', 'Kraków aleja 29 listopada 45', 889484838);
INSERT INTO ksiegowosc.pracownicy VALUES (2, 'Mateusz', 'Nowak', 'Kraków Zazamcze 45', 834499978);
INSERT INTO ksiegowosc.pracownicy VALUES (3, 'Jacek', 'Lama', 'Dąbrowa Długa 45', 734459978);
INSERT INTO ksiegowosc.pracownicy VALUES (4, 'Andrzej', 'Kompres', 'Warszawa Powstańców 57', 664455978);
INSERT INTO ksiegowosc.pracownicy VALUES (5, 'Zdzisław', 'Kowalski', 'Kraków Szeroka 65', 824499513);
INSERT INTO ksiegowosc.pracownicy VALUES (6, 'Grażyna', 'Bania', 'Kraków Inwalidów 12', 732699978);
INSERT INTO ksiegowosc.pracownicy VALUES (7, 'Anna', 'Nowak', 'Tarnów Sucharskiego 22', 632496918);
INSERT INTO ksiegowosc.pracownicy VALUES (8, 'Mateusz', 'Baza', 'Tarnów Gumińskiej 36', 534459771);
INSERT INTO ksiegowosc.pracownicy VALUES (9, 'Karolina', 'Kawa', 'Kraków Ozdobna 25', 734422178);
INSERT INTO ksiegowosc.pracownicy VALUES (10, 'Zofia', 'Mila', 'Kraków Szkolna 111', 632439971);

INSERT INTO ksiegowosc.godziny VALUES (1, '10 Jan 2021', 40, 1);
INSERT INTO ksiegowosc.godziny VALUES(2, '10 Jan 2021', 20, 3);
INSERT INTO ksiegowosc.godziny VALUES(3, '10 Jan 2021', 40, 5);
INSERT INTO ksiegowosc.godziny VALUES(4, '10 Jan 2021', 40, 2);
INSERT INTO ksiegowosc.godziny VALUES(5, '10 Jan 2021', 30, 7);
INSERT INTO ksiegowosc.godziny VALUES(6, '10 Jan 2021', 40, 4);
INSERT INTO ksiegowosc.godziny VALUES(7, '10 Jan 2021', 20, 8);
INSERT INTO ksiegowosc.godziny VALUES(8, '10 Jan 2021', 40, 9);
INSERT INTO ksiegowosc.godziny VALUES(9, '10 Jan 2021', 20, 6);
INSERT INTO ksiegowosc.godziny VALUES(10, '10 Jan 2021', 40, 10);

INSERT INTO ksiegowosc.pensje VALUES (1, 'CEO', 25000, 1);
INSERT INTO ksiegowosc.pensje VALUES (2, 'QA', 10000, 2);
INSERT INTO ksiegowosc.pensje VALUES (3, 'HR', 6000, 3);
INSERT INTO ksiegowosc.pensje VALUES (4, 'Senior Dev', 15000, 4);
INSERT INTO ksiegowosc.pensje VALUES (5, 'Mid Dev', 12000, 5);
INSERT INTO ksiegowosc.pensje VALUES (6, 'Software Tester', 9000, 6);
INSERT INTO ksiegowosc.pensje VALUES (7, 'Junior Dev', 4000, 7);
INSERT INTO ksiegowosc.pensje VALUES (8, 'Cleaning Service', 3000, 8);
INSERT INTO ksiegowosc.pensje VALUES (9, 'Intern', 1800, 9);
INSERT INTO ksiegowosc.pensje VALUES (10, 'Secretary', 4500, 10);

INSERT INTO ksiegowosc.premie VALUES (1, 'Uznaniowa', 2000);
INSERT INTO ksiegowosc.premie VALUES (2, 'Uznaniowa', 00);
INSERT INTO ksiegowosc.premie VALUES (3, 'Regulaminowa', 200);
INSERT INTO ksiegowosc.premie VALUES (4, 'Uznaniowa', 0);
INSERT INTO ksiegowosc.premie VALUES (5, 'Uznaniowa', 400);
INSERT INTO ksiegowosc.premie VALUES (6, 'Uznaniowa', 0);
INSERT INTO ksiegowosc.premie VALUES (7, 'Uznaniowa', 100);
INSERT INTO ksiegowosc.premie VALUES (8, 'Regulaminowa', 100);
INSERT INTO ksiegowosc.premie VALUES (9, 'Uznaniowa', 300);
INSERT INTO ksiegowosc.premie VALUES (10, 'Uznaniowa', 100);

ALTER TABLE ksiegowosc.godziny
	ADD FOREIGN KEY(id_pracownika)
	REFERENCES ksiegowosc.pracownicy(id_pracownika);


ALTER TABLE ksiegowosc.wynagrodzenia
    ADD FOREIGN KEY (id_pracownika)
    REFERENCES ksiegowosc.pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenia
    ADD FOREIGN KEY (id_godziny)
    REFERENCES ksiegowosc.godziny(id_godziny);

ALTER TABLE ksiegowosc.wynagrodzenia
    ADD FOREIGN KEY (id_pensji)
    REFERENCES ksiegowosc.pensje(id_pensji);

ALTER TABLE ksiegowosc.wynagrodzenia
    ADD FOREIGN KEY (id_premii)
    REFERENCES ksiegowosc.premie(id_premii);


ALTER TABLE ksiegowosc.pensje
	ADD FOREIGN KEY(id_premii)
	REFERENCES ksiegowosc.premie(id_premii);

ALTER TABLE ksiegowosc.pensje
	RENAME COLUMN kwota TO kwota_brutto;

ALTER TABLE ksiegowosc.pensje ADD kwota_netto money;
UPDATE ksiegowosc.pensje
SET kwota_netto = kwota_brutto*0.73;

ALTER TABLE ksiegowosc.wynagrodzenia
    ADD FOREIGN KEY (id_pracownika)
    REFERENCES ksiegowosc.pracownicy(id_pracownika);


-- a) Wyświetl tylko id pracownika oraz jego nazwisko.
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

-- b) Wyświetl id pracowników, których płaca jest większa niż 1000.
SELECT ksiegowosc.pracownicy.id_pracownika
FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji) ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika
WHERE ksiegowosc.pensje.kwota_brutto > 1000;

-- c) Wyświetl id pracowników nieposiadających premii, których płaca jest większa niż 2000.
SELECT ksiegowosc.pracownicy.id_pracownika
FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.pensje INNER JOIN (ksiegowosc.premie INNER JOIN ksiegowosc.wynagrodzenia ON premie.id_premii = ksiegowosc.wynagrodzenia.id_premii) ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji)
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika
where ksiegowosc.premie.kwota = 0 and ksiegowosc.pensje.kwota_brutto > 2000;

-- d) Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’.
SELECT * FROM ksiegowosc.pracownicy WHERE imie LIKE 'J%';

-- e) Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.
SELECT * FROM ksiegowosc.pracownicy WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';

-- f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy czas pracy to 160 h miesięcznie.
SELECT imie,nazwisko,(liczba_godzin*4 -160) AS liczba_nadgodzin
FROM ksiegowosc.pracownicy INNER JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
WHERE ksiegowosc.godziny.liczba_godzin*4 > 160;

-- g) Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 – 3000 PLN.
SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji) ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika
WHERE ksiegowosc.pensje.kwota_brutto >= 1500.00 AND ksiegowosc.pensje.kwota_brutto <= 3000;

-- h) Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii.
SELECT imie, nazwisko FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.godziny INNER JOIN
(ksiegowosc.premie INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenia.id_premii)
ON ksiegowosc.godziny.id_godziny = ksiegowosc.wynagrodzenia.id_godziny)
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika
WHERE ksiegowosc.godziny.liczba_godzin*4 > 160 AND ksiegowosc.premie.kwota = 0 ;

-- i) Uszereguj pracowników według pensji.
SELECT * FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji)
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika
ORDER BY ksiegowosc.pensje.kwota_brutto;

-- j) Uszereguj pracowników według pensji i premii malejąco.
SELECT * FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.pensje INNER JOIN
(ksiegowosc.premie INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenia.id_premii)
ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji)
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika
ORDER BY ksiegowosc.pensje.kwota_brutto DESC, ksiegowosc.premie.kwota DESC;

-- k) Zlicz i pogrupuj pracowników według pola ‘stanowisko’.
SELECT stanowisko, COUNT(ksiegowosc.pensje.stanowisko)
FROM ksiegowosc.pensje GROUP BY stanowisko;

-- l) Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierownik’ (jeżeli takiego nie masz, to przyjmij dowolne inne).
SELECT MAX(ksiegowosc.pensje.kwota_brutto), MIN(ksiegowosc.pensje.kwota_brutto), AVG(ksiegowosc.pensje.kwota_brutto)
FROM ksiegowosc.pensje WHERE stanowisko = 'CEO';

-- m) Policz sumę wszystkich wynagrodzeń.
SELECT SUM(ksiegowosc.pensje.kwota_brutto) FROM ksiegowosc.pensje;

-- n) Policz sumę wynagrodzeń w ramach danego stanowiska.
SELECT stanowisko, SUM(ksiegowosc.pensje.kwota_brutto) FROM ksiegowosc.pensje GROUP BY stanowisko;

-- o) Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska.
SELECT stanowisko, COUNT(ksiegowosc.premie.kwota)
FROM ksiegowosc.premie INNER JOIN (ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji)
ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenia.id_premii
GROUP BY stanowisko;