--SELECT * zeigt alle Spalten

SELECT * FROM Customers


--SELECT "Spaltennamen" zeigt nur angegebene Spalten an
SELECT CompanyName, City FROM Customers

SELECT City, CompanyName FROM Customers


--Sortieren von Daten mit ORDER BY; ist immer das letzte statement
SELECT City, CompanyName FROM Customers
ORDER BY City
--Standardm��ig immer aufsteigend "ascending"
--Umdrehen mit DESC "descending"

SELECT City, CompanyName FROM Customers
ORDER BY City DESC, CompanyName


--Mit SELECT k�nnen auch "Custom-Strings" oder mathematische Operationen ausgegeben werden
-- +, -, *, /
SELECT 5+10, 5*3, 'Hallo!'

SELECT (3+4)*7


--Spaltennamen k�nnen im Ergebnisfenster ge�ndert werden mit einem ALIAS

SELECT 'Hallo!' as Begr��ung

SELECT CompanyName AS Firma FROM Customers

SELECT CompanyName AS Firma, City AS Stadt FROM Customers

--Reservierte Keywords in eckige Klammern [] einbinden
SELECT * FROM [Order Details]

