--WHERE Keyword: Setzt Filter für Ergebnisausgabe

SELECT * FROM Customers
WHERE Country = 'Germany'

--WHERE "Spalte" = XX filtert nach GENAU diesem Kriterium

SELECT * FROM Customers
WHERE City = 'Paris'


--Mehrere Filter verbinden wir mit AND oder OR

--AND = ALLE Bedingungen müssen erfüllt wer´den
SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'

--OR = EINE Bedingung muss erfüllt werden
SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'France'

--AND ist "stärker bindend" als OR; Im Zweifel Klammern setzen!
SELECT * FROM Customers
WHERE (Country = 'Germany' OR Country = 'France') AND City = 'Paris'

SELECT * FROM Customers
WHERE (Country = 'Germany' OR Country = 'France') AND (City = 'Paris' OR City = 'Berlin')

--WHERE kann ebenfalls >, <, !=, >=, <=
SELECT * FROM Orders
WHERE Freight > 100

SELECT * FROM Orders
WHERE Freight < 200 AND ShipCity = 'Berlin'


--Wenn wir NULL Werte finden/ausschließen wollen = IS NULL oder IS NOT NULL

SELECT * FROM Customers
WHERE Fax IS NULL

SELECT * FROM Customers
WHERE Fax IS NOT NULL


--IN (wert1, wert2 usw...) = Mehrere OR Bedingungen
SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'France' OR Country = 'Mexico'

SELECT * FROM Customers
WHERE Country IN ('Germany','France','Mexico')

--"Reichweite" mit BETWEEN Wert1 AND Wert2
SELECT * FROM Orders
WHERE Freight > 100 AND freight < 200

SELECT * FROM Orders
WHERE Freight BETWEEN 100 AND 200 --[100, 200] Randwerte werden bei BETWEEN mitgenommen