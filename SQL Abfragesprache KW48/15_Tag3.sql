--Aufgabe: "Lieferverz�gerungen" anzeigen; zu jeder Bestellung die Differenz ausgeben zwischen
--RequiredDate und ShippedDate in Tagen f�r alle 830 Orders
--datediff
--Ergebnisse gegenpr�fen!

USE Northwind
GO

Select OrderId, DATEDIFF("dd",RequiredDate, ISNULL(ShippedDate, getdate())) as Differenz from Orders
Order By Differenz desc

select * from Customers
WHERE ISNULL(Fax, '') LIKE '%'


--Weitere Agenda f�r Tag 3:
--BULK INSERT 
--PROCEDURES
--VARIABLEN
--VIEWS
--WHILE
--WINDOWED FUNCTIONS
--FUNKTIONEN
--IF