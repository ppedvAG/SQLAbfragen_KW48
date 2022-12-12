--JOINs = Daten aus mehr als einer Tabelle abzurufen
USE Northwind
SELECT * FROM Customers
SELECT * FROM Orders


SELECT * FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID

SELECT OrderID, CompanyName FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID

SELECT Customers.CompanyName FROM Customers

--ALIASE für Tabellen erleichtern Schreibarbeit

SELECT * FROM Orders as o
JOIN Customers as c ON c.CustomerID = o.CustomerID

--Für Spalten die in mehr als einer Tabelle existieren, muss das Tabellenschema mit angegeben werden
SELECT OrderID, CompanyName, c.CustomerID FROM Orders as o
JOIN Customers as c ON c.CustomerID = o.CustomerID


SELECT o.OrderID, CompanyName, c.CustomerID, p.ProductID, p.UnitPrice, ProductName,
Firstname + ' ' + Lastname as Bearbeiter
FROM Orders as o
INNER JOIN Customers as c ON c.CustomerID = o.CustomerID
INNER JOIN [Order Details] as od ON od.OrderID = o.OrderID
INNER JOIN Products as p ON p.ProductID = od.ProductID
JOIN Employees as e ON e.EmployeeID = o.EmployeeID
ORDER BY OrderID

--Das waren alles INNER JOINs
--INNER JOIN gibt nur  Ergebnisse aus, bei denen in beiden Tabellen zugehörige Datensätze existieren

SELECT * FROM Orders as o
JOIN Customers as c ON c.CustomerID = o.CustomerID

--LEFT/RIGHT/FULL OUTER JOIN?

SELECT * 
FROM Orders as o RIGHT JOIN Customers as c ON c.CustomerID = o.CustomerID
-- Left und Right Join sind "austauschbar" wenn Reihenfolge der Tabellen vertauscht wird
SELECT * 
FROM Customers as c LEFT JOIN Orders as o ON c.CustomerID = o.CustomerID

--FULL OUTER JOIN

SELECT * FROM Orders as o
FULL OUTER JOIN Customers as c ON c.CustomerID = o.CustomerID

--LEFT/RIGHT/FULL Invertiert:
SELECT * 
FROM Customers as c LEFT JOIN Orders as o ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL



--SELF JOIN (Subtyp von INNER JOIN); stellt Beziehungen innerhalb der selben Tabelle her
SELECT e1.EmployeeID, e1.FirstName + ' ' + e1.Lastname as Mitarbeiter, e1.ReportsTo,
e2.FirstName + ' ' + e2.Lastname as Vorgesetzter
FROM Employees as e1
JOIN Employees as e2 ON e2.EmployeeID = e1.ReportsTo


--CROSS JOIN = verknüpft ALLE Datensätze von Tabelle A mit ALLEN Datensätzen von Tabelle B
SELECT * FROM Customers
CROSS JOIN Orders


SELECT * FROM Orders
CROSS JOIN [Order Details]


--Übung: Alle Produkte (Name des Produkts) ausgeben, die Kunde 'ALFKI' bisher gekauft hat

