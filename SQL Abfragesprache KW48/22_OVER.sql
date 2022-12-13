--OVER (ORDER/PARTITION BY)
--Mit OVER(PARTITION BY Spaltenname) können "Fenster" definiert werden, für die ein Aggregat angewendet werden soll

SELECT 
c.CustomerID,
Freight,
SUM(Freight) OVER(PARTITION BY c.CustomerID) as SumFreightPerCustomer, --OVER(PARTITION BY CustomerID) = "Aggregat über die Gruppen CustomerID"
SUM(Freight) OVER() as SumFreightAllCustomer, --OVER() = "Aggregat über alle Datensätze"
AVG(Freight) OVER(PARTITION BY c.CustomerID) as AvgFreightPerCustomer,
AVG(Freight) OVER() as AvgFreightAllCustomer
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, o.Freight
