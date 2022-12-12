--integrierte Aggregatfunktionen:
--MIN(), MAX(), SUM(), AVG(), COUNT()

SELECT MIN(Freight) as KleinsterWert FROM Orders

SELECT MAX(Freight) as Gr��terWert FROM Orders

SELECT SUM(Freight) as SummeFreight FROM Orders

SELECT AVG(Freight) as DurchschnittFreight FROM Orders

SELECT COUNT(Freight) as AnzahlEintr�ge FROM Orders
SELECT COUNT(*) as AnzahlEintr�ge FROM Orders
SELECT COUNT(Fax) as AnzahlEintr�ge FROM Customers --COUNT z�hlt keine NULL Werte

--Beispiel AVG selbst berechnen:
SELECT SUM(Freight) / Count(Freight) FROM Orders

--Beispiel
SELECT SUM(Freight) FROM Orders
WHERE CustomerID = 'ALFKI' OR CustomerID = 'BLONP'

SELECT CustomerID, SUM(Freight) FROM Orders

