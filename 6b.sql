-- a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodając do niego kierunkowy dla Polski
-- w nawiasie (+48)
UPDATE ksiegowosc.pracownicy
SET telefon = CONCAT('(+48)', telefon );

SELECT * FROM ksiegowosc.pracownicy;

-- b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony był myślnikami wg
-- wzoru: ‘555-222-333’


UPDATE ksiegowosc.pracownicy
SET telefon = concat(substr(telefon, 1, 8), '-', substr(telefon, 9 ,3), '-',substr(telefon, 12, 3));
SELECT * FROM ksiegowosc.pracownicy;

-- c) Wyświetl dane pracownika, którego nazwisko jest najdłuższe, używając dużych liter

SELECT  upper(nazwisko), LENGTH(nazwisko) nazwisko_len FROM ksiegowosc.pracownicy order by nazwisko_len DESC , nazwisko DESC LIMIT 1;

-- d) Wyświetl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5

SELECT  md5(imie) md_imie, md5(nazwisko) md_nazwisko, md5(adres) md_adres, md5(telefon) md_telefon FROM ksiegowosc.pracownicy;

-- f) Wyświetl pracowników, ich pensje oraz premie. Wykorzystaj złączenie lewostronne.

SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensje.kwota_brutto AS pensja, premie.kwota AS premia FROM ksiegowosc.pracownicy left JOIN (ksiegowosc.pensje left JOIN (ksiegowosc.premie left JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenia.id_premii) ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji)
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika;


-- g) wygeneruj raport (zapytanie), które zwróci w wyniki treść wg poniższego szablonu:
-- Pracownik Jan Nowak, w dniu 7.08.2017 otrzymał pensję całkowitą na kwotę 7540 zł, gdzie
-- wynagrodzenie zasadnicze wynosiło: 5000 zł, premia: 2000 zł, nadgodziny: 540 zł

-- id_p, dataa, liczba godzin, all id, kwota

SELECT concat('Pracownik ', imie, ' ', nazwisko, ' w dniu ', dataa, ' otrzymał pensję całkowitą na kwotę ',
(pensje.kwota_brutto + premie.kwota), 'zł, gdzie wynagrodzenie zasadnicze wynosiło: ', CAST(pensje.kwota_brutto as VARCHAR(10)), ' premie: ',
premie.kwota, ' nadgodziny: ', premie.kwota)
FROM ksiegowosc.pracownicy INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika
INNER JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenia.id_pensji = ksiegowosc.pensje.id_pensji
INNER JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenia.id_premii = ksiegowosc.premie.id_premii