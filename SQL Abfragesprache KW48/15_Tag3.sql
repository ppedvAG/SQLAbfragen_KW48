--Aufgabe: "Lieferverzögerungen" anzeigen; zu jeder Bestellung die Differenz ausgeben zwischen
--RequiredDate und ShippedDate in Tagen für alle 830 Orders
--datediff
--Ergebnisse gegenprüfen!

USE Northwind
GO

Select OrderId, DATEDIFF("dd",RequiredDate, ISNULL(ShippedDate, getdate())) as Differenz from Orders
Order By Differenz desc

select * from Customers
WHERE ISNULL(Fax, '') LIKE '%'


--Weitere Agenda für Tag 3:
--BULK INSERT 
--PROCEDURES
--VARIABLEN
--VIEWS
--WHILE
--WINDOWED FUNCTIONS
--FUNKTIONEN
--IF