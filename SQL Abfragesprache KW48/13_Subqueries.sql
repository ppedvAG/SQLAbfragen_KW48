--Problem:
SELECT * FROM Orders
WHERE Freight > AVG(Freight) --Alle Bestellungen deren Freight größer als AVG Freight

--Lösung: Subquery/Unterabfrage/nested query

SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

--Subqueries müssen eigenständig ausführbar sein
--Funktionieren im WHERE, SELECT, FROM
--Subqueries können auch weitere Subqueries haben
--Werden vom "innersten" zum "äußersten" ausgeführt

SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Customers)
--In Kombination mit "IN" kann eine Subquery auch mehrere Werte im WHERE ausgeben

--Im SELECT:
SELECT OrderID, (SELECT AVG(Freight) FROM Orders), Freight FROM Orders

--Im FROM:
SELECT *, Summe - Rabatt 
FROM 
(
select c.CompanyName,  o.OrderID, sum(od.Quantity * od.UnitPrice + Freight) as Summe,
sum((od.Quantity * od.UnitPrice + Freight) * od.Discount) as Rabatt,
SUM((od.Quantity*od.Unitprice*(1-Discount))+o.Freight) as Rabattiert
from Customers as c
join orders as o on c.CustomerID = o.CustomerID
join [Order Details] as od on o.OrderID = od.OrderID
join Products as p on od.ProductID = p.ProductID
group by
c.CompanyName,
o.OrderID
) as t
--Im FROM brauchen Subqueries ein ALIAS! Keine Tabelle ohne Namen!




