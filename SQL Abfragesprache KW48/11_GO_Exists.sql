USE Northwind
GO -- = Batchtrennzeichen

DROP TABLE IF EXISTS #t 
--löscht Tabelle (oder anderes Objekt) wenn es bereits existiert
--funktioniert nur ab SQL-Server 2019

--SQL-Server Version checken:
SELECT @@VERSION


SELECT * INTO #t FROM Customers

SELECT * FROM #t

