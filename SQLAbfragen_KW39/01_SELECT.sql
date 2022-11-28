--SELECT * zeigt alle Spalten

SELECT * FROM Customers


--SELECT "Spaltennamen" zeigt nur angegebene Spalten an
SELECT CompanyName, City FROM Customers

SELECT City, CompanyName FROM Customers


--Sortieren von Daten mit ORDER BY; ist immer das letzte statement
SELECT City, CompanyName FROM Customers
ORDER BY City
--Standardmäßig immer aufsteigend "ascending"
--Umdrehen mit DESC "descending"

SELECT City, CompanyName FROM Customers
ORDER BY City DESC, CompanyName


--Mit SELECT können auch "Custom-Strings" oder mathematische Operationen ausgegeben werden
-- +, -, *, /
SELECT 5+10, 5*3, 'Hallo!'

SELECT (3+4)*7


--Spaltennamen können im Ergebnisfenster geändert werden mit einem ALIAS

SELECT 'Hallo!' as Begrüßung

SELECT CompanyName AS Firma FROM Customers

SELECT CompanyName AS Firma, City AS Stadt FROM Customers

--Reservierte Keywords in eckige Klammern [] einbinden
SELECT * FROM [Order Details]

