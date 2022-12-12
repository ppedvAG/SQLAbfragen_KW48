--integrierte Aggregatfunktionen:
--MIN(), MAX(), SUM(), AVG(), COUNT()

SELECT MIN(Freight) as KleinsterWert FROM Orders

SELECT MAX(Freight) as GrößterWert FROM Orders

SELECT SUM(Freight) as SummeFreight FROM Orders

SELECT AVG(Freight) as DurchschnittFreight FROM Orders

SELECT COUNT(Freight) as AnzahlEinträge FROM Orders
SELECT COUNT(*) as AnzahlEinträge FROM Orders
SELECT COUNT(Fax) as AnzahlEinträge FROM Customers --COUNT zählt keine NULL Werte

--Beispiel AVG selbst berechnen:
SELECT SUM(Freight) / Count(Freight) FROM Orders

--Beispiel
SELECT SUM(Freight) FROM Orders
WHERE CustomerID = 'ALFKI' OR CustomerID = 'BLONP'

SELECT CustomerID, SUM(Freight) FROM Orders

