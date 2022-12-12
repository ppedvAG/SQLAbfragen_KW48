/*
Aufgabe: 'ABC' Analyse der meistverkauften Produkte (nach Umsatz)
Kategorie A: > 50.000; B: 10.000 - 50.000; C: < 10.000
Ergebnisspalten: Produktname, Gesamtumsatz, 'Kategorie'

CASE 
	WHEN ... THEN ...
	WHEN ... THEN ...
END

*/

1. Was brauch ich/Welche Tabellen/Joins?
2. Welche Spalten bzw. welche Ausgabe/Berechnungen?
3. Was muss ich gruppieren?
4. Was muss ich rausfiltern?

SELECT p.ProductName, SUM(od.Quantity*od.Unitprice) as Gesamtumsatz,
CASE
	WHEN SUM(od.Quantity*od.Unitprice) > 50000 THEN 'A'
	WHEN SUM(od.Quantity*od.Unitprice) BETWEEN 10000 AND 50000 THEN 'B'
	WHEN SUM(od.Quantity*od.Unitprice) < 10000 THEN 'C'
	ELSE 'Fehler!'
END as Kategorie
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY Kategorie, Gesamtumsatz DESC

--HAVING = WHERE für Gruppen

SELECT p.ProductName, SUM(od.Quantity*od.Unitprice) as Gesamtumsatz
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
HAVING SUM(od.Quantity*od.Unitprice) < 25000
ORDER BY Gesamtumsatz DESC

--Funktioniert genauso mit =, >, <, !=, BETWEEN usw...

--HAVING NICHT verwenden für Dinge, die im WHERE gefiltert werden können!!
--Sonst Todesstrafe!
SELECT Country, SUM(Freight) as SummeFreight FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE Country = 'Germany'
GROUP BY Country
--HAVING Country = 'Germany'
ORDER BY SummeFreight DESC


