/*
Das ist ein
Kommentar �ber
mehrere Zeilen */

--Einzeiliger Kommentar

USE Northwind --USE Datenbankname gibt an in welcher DB der SQL Server arbeiten soll
SELECT * FROM Customers

select * from Customers
SeLeCt * FRoM CustOMERS --SQL ist NICHT case sensitive

SELECT * FROM [Order Details] --Objektnamen in [] "�berschreibt" jedes Keyword

SELECT CompanyName FROM Customers

SELECT CompanyName, City, Country FROM Customers

SELECT City, Companyname, Country FROM Customers

SELECT 100
SELECT 'Hallo!'
SELECT 5*10, 6+7, 100/5
SELECT 5+(3*4-7)-5
--"Custom"-Spalten k�nnen ebenfalls ausgegeben werden
--Strings oder mathematische Operationen


--Mit ORDER BY k�nnen wir Ergebnisse sortieren

SELECT * FROM Customers
ORDER BY Country --ORDER BY immer am Ende der Abfrage, standardm��ig "aufsteigend"/ASCENDING

SELECT * FROM Customers
ORDER BY Country DESC --Absteigend mit DESC (Descending)

SELECT * FROM Customers
ORDER BY Country DESC, City


--Nur oberste X Zeilen ausgeben, mit SELECT TOP X
SELECT TOP 1000 * FROM [Order Details] --Automatische Textvervollst�ndigung mit TAB best�tigen

SELECT TOP 50 * FROM [Order Details]
ORDER BY Quantity

--SELECT "BOT" existiert nicht; unterste Zeilen mit ORDER BY DESC
SELECT TOP 50 * FROM [Order Details]
ORDER BY Quantity DESC

--DISTINCT: l�scht Duplikate im Ergebnis;
--Wichtig: ALLE Spalten m�ssen identisch sein
SELECT DISTINCT Country FROM Customers

SELECT DISTINCT Country, City FROM Customers

SELECT DISTINCT Country, City, Address FROM Customers


--UNION "verbindet" mehrere Ergebnistabellen vertikal
--Alle Abfragen m�ssen gleich viele Spalten auswerfen
--Datentypen m�ssen "kompatibel" sein
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
SELECT 'Hallo!' as Begr��ung

--Vorhandene Spalten "umbenennen" durch ALIAS
SELECT Country as Land, City as Stadt FROM Customers

--Tabellen k�nnen ALIAS haben
SELECT * FROM Customers as c