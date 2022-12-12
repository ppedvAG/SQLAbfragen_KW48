--Temporäre Tabellen

select c.CompanyName,  o.OrderID, sum(od.Quantity * od.UnitPrice + Freight) as Summe,
sum((od.Quantity * od.UnitPrice + Freight) * od.Discount) as Rabatt,
SUM((od.Quantity*od.Unitprice*(1-Discount))+o.Freight) as Rabattiert

INTO #TempTable

from Customers as c
join orders as o on c.CustomerID = o.CustomerID
join [Order Details] as od on o.OrderID = od.OrderID
join Products as p on od.ProductID = p.ProductID
--where od.Discount <> 0
--c.CustomerID = 'ALFKI'
group by
c.CompanyName,
o.OrderID

SELECT *, Summe - Rabatt FROM #TempTable

--SELECT * INTO #TempTableName: Speichert Abfrageergebnisse in (lokaler) Temporärer Tabelle
--Existiert nur im Zwischenspeicher, nur in diesem AbfrageTab
--> wird gelöscht wenn Tab geschlossen wird

--Globale Temp Tables mit ##TempTableName
--Funktionieren auch in anderen Tabs, 
--bleiben bestehen bis Verbindung zur ServerInstanz geschlossen wird

SELECT * INTO ##Global FROM Customers

/*
--Vorteile von #/##: 
- Weiterarbeiten mit Aliasen
- Performance, temp tables sind sehr effizient
- "Zerteilen" von komplexen Aufgaben in "Checkpoints"

Nachteile:
- Evtl. veraltete Daten, da sich Temp Tables nicht automatisch aktualisieren

--Manuell löschen:
*/

DROP TABLE ##Global

