/*
Das ist ein
Kommentar über
mehrere Zeilen */

--Einzeiliger Kommentar

USE Northwind --USE Datenbankname gibt an in welcher DB der SQL Server arbeiten soll
SELECT * FROM Customers

select * from Customers
SeLeCt * FRoM CustOMERS --SQL ist NICHT case sensitive

SELECT * FROM [Order Details] --Objektnamen in [] "überschreibt" jedes Keyword

SELECT CompanyName FROM Customers

SELECT CompanyName, City, Country FROM Customers

SELECT City, Companyname, Country FROM Customers

SELECT 100
SELECT 'Hallo!'
SELECT 5*10, 6+7, 100/5
SELECT 5+(3*4-7)-5
--"Custom"-Spalten können ebenfalls ausgegeben werden
--Strings oder mathematische Operationen


--Mit ORDER BY können wir Ergebnisse sortieren

SELECT * FROM Customers
ORDER BY Country --ORDER BY immer am Ende der Abfrage, standardmäßig "aufsteigend"/ASCENDING

SELECT * FROM Customers
ORDER BY Country DESC --Absteigend mit DESC (Descending)

SELECT * FROM Customers
ORDER BY Country DESC, City


--Nur oberste X Zeilen ausgeben, mit SELECT TOP X
SELECT TOP 1000 * FROM [Order Details] --Automatische Textvervollständigung mit TAB bestätigen

SELECT TOP 50 * FROM [Order Details]
ORDER BY Quantity

--SELECT "BOT" existiert nicht; unterste Zeilen mit ORDER BY DESC
SELECT TOP 50 * FROM [Order Details]
ORDER BY Quantity DESC

--DISTINCT: löscht Duplikate im Ergebnis;
--Wichtig: ALLE Spalten müssen identisch sein
SELECT DISTINCT Country FROM Customers

SELECT DISTINCT Country, City FROM Customers

SELECT DISTINCT Country, City, Address FROM Customers


--UNION "verbindet" mehrere Ergebnistabellen vertikal
--Alle Abfragen müssen gleich viele Spalten auswerfen
--Datentypen müssen "kompatibel" sein
SELECT * FROM Customers
UNION ALL --UNION ALL ist ohne DISTINCT
SELECT * FROM Customers

SELECT * FROM Customers
UNION  --UNION alleine ist automatisch mit DISTINCT
SELECT * FROM Customers

SELECT * FROM Customers
UNION
SELECT * FROM Orders


--ALIAS zuweisen, mit AS
SELECT 'Hallo!' as Begrüßung

--Vorhandene Spalten "umbenennen" durch ALIAS
SELECT Country as Land, City as Stadt FROM Customers

--Tabellen können ALIAS haben
SELECT * FROM Customers as c