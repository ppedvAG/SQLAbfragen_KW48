--Views/Sichten
--"abgespeicherte Abfragen"

CREATE VIEW vGermanCustomers AS
SELECT * FROM Customers
WHERE Country = 'Germany'

SELECT * FROM vGermanCustomers
SELECT CustomerID, ContactName FROM vGermanCustomers
SELECT * FROM vGermanCustomers
WHERE ContactName = 'Nico'

--Nützlich für sehr häufig genutzte Abfragen
--Rechteverteilung: Vorhandene Tabellen können "zerstückelt" und als VIEW gespeichert werden

--Nachteil: Verleitet zu "Faulheit". Bei Aufruf einer View wird jedesmal die gesamte abgespeicherte Abfrage ausgeführt


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

--Löschen/verändern von VIEWS:
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

