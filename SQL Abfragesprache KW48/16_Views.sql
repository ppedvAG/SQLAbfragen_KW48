--Views/Sichten
--"abgespeicherte Abfragen"

CREATE VIEW vGermanCustomers AS
SELECT * FROM Customers
WHERE Country = 'Germany'

SELECT * FROM vGermanCustomers
SELECT CustomerID, ContactName FROM vGermanCustomers
SELECT * FROM vGermanCustomers
WHERE ContactName = 'Nico'

--N�tzlich f�r sehr h�ufig genutzte Abfragen
--Rechteverteilung: Vorhandene Tabellen k�nnen "zerst�ckelt" und als VIEW gespeichert werden

--Nachteil: Verleitet zu "Faulheit". Bei Aufruf einer View wird jedesmal die gesamte abgespeicherte Abfrage ausgef�hrt


CREATE VIEW vRechnungen AS
select c.CompanyName,  o.OrderID, sum(od.Quantity * od.UnitPrice + Freight) as Summe,
sum((od.Quantity * od.UnitPrice + Freight) * od.Discount) as Rabatt,
SUM((od.Quantity*od.Unitprice*(1-Discount))+o.Freight) as Rabattiert
from Customers as c
join orders as o on c.CustomerID = o.CustomerID
join [Order Details] as od on o.OrderID = od.OrderID
join Products as p on od.ProductID = p.ProductID
--where od.Discount <> 0
--c.CustomerID = 'ALFKI'
group by
c.CompanyName,
o.OrderID


SELECT DISTINCT CompanyName FROM vRechnungen
SELECT CompanyName FROM Customers

--L�schen/ver�ndern von VIEWS:
DROP VIEW vGermanCustomers

ALTER VIEW vRechnungen AS
select c.CompanyName,  o.OrderID, sum(od.Quantity * od.UnitPrice + Freight) as Summe,
sum((od.Quantity * od.UnitPrice + Freight) * od.Discount) as Rabatt
from Customers as c
join orders as o on c.CustomerID = o.CustomerID
join [Order Details] as od on o.OrderID = od.OrderID
join Products as p on od.ProductID = p.ProductID
--where od.Discount <> 0
--c.CustomerID = 'ALFKI'
group by
c.CompanyName,
o.OrderID

