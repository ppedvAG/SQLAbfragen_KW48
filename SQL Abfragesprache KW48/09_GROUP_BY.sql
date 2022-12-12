--GROUP BY Klausel: gruppiert unsere Ergebnisse zusammen

SELECT CustomerID, SUM(Freight) as SummeFreight FROM Orders
--WHERE
GROUP BY CustomerID
ORDER BY SummeFreight DESC


SELECT CustomerID, 
SUM(Freight) as SummeFreight, 
COUNT(*) as AnzahlBestellungen,
AVG(Freight) as AvgFreight FROM Orders
--WHERE
GROUP BY CustomerID
ORDER BY SummeFreight DESC

SELECT Country, SUM(Freight) as SummeFreight FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY Country
ORDER BY SummeFreight DESC


SELECT Country, City, SUM(Freight) as SummeFreight, COUNT(o.CustomerID) FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY Country, City
ORDER BY Country 


--Aufgabe: Eine Tabelle die den Gesamtumsatz pro Kunde ausgibt
--Umsatz = Summe aller Bestellpositionen(Order_Details); Quantity*Unitprice
--Ergebnis: 89 Zeilen

--Zusatz: "Rechnungssumme" pro Bestellung (+Freight), 
--mit Discount (Order_Details)verrechnet
--Ergebnis: 830 Zeilen

SELECT c.CustomerID, SUM(Quantity*UnitPrice) as GesamtUmsatz FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
ORDER BY GesamtUmsatz DESC

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

