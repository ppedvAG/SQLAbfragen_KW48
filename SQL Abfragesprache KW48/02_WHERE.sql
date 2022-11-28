--WHERE Keyword: Filtert Ergebnisse einer Abfrage

SELECT * FROM Customers
WHERE Country = 'Germany'

SELECT * FROM Orders
WHERE Freight > 100

SELECT * FROM Orders
WHERE Freight < 100

SELECT * FROM Orders
WHERE Freight >= 100

SELECT * FROM Customers
WHERE Country != 'Germany'

--WHERE funktioniert mit =, <, >, <=, >=, != (ungleich)

SELECT * FROM Customers
WHERE Country = 'France' AND City = 'Paris'

--Mehrere WHERE Filter verknüpfen mit AND oder OR

SELECT * FROM Orders
WHERE Freight <= 100 AND Freight >= 50
-- Beide Abfragen selbes Ergebnis
SELECT * FROM Orders
WHERE Freight BETWEEN 50 AND 100 --BETWEEN inkludiert Randwerte (selbe wie >= & <=)


SELECT * FROM Customers
WHERE Country = 'Spain' OR Country = 'France'

SELECT * FROM Customers
WHERE Country = 'Spain' OR Country = 'France'


SELECT * FROM Customers
WHERE Country = 'France' AND (City = 'Paris' OR City = 'Berlin')

--AND ist "stärker bindend", d.h. eventuell Klammern setzen


SELECT * FROM Customers
WHERE Country = 'France' OR Country = 'Germany' OR Country = 'Spain' OR Country ='Argentina'
--Beide Abfragen selbes Ergebnis
SELECT * FROM Customers
WHERE Country IN ('France', 'Germany', 'Spain', 'Argentina')

--Mit IN(Wert1, Wert2 usw.) können mehrere OR Bedingungen zusammengefasst werden


--NULL = Fehlender Wert/kein Wert wurde eingetragen.
--NICHT das selbe wie "Leerzeichen"

SELECT * FROM Customers
WHERE Fax IS NULL --Sucht NULL Werte

SELECT * FROM Customers
WHERE Fax IS NOT NULL --Schließt NULL Werte aus


