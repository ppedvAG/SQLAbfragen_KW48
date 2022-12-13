--Datumsfunktionen
--Datum immer als String in Hochkommas '', amerikanisches Format YYYYMMDD

SELECT getdate() --gibt (Server)Systemzeit aus

--datediff() = Differenz zwischen 2 Datums

SELECT datediff(dd, '19930224', getdate()) 

--dateadd = Addiert "Zeitraum" zu einem Datum

SELECT dateadd(dd, 14, getdate())
SELECT dateadd(dd, -14, getdate())

--datepart

SELECT datepart(quarter, '20220401')

--datename

SELECT datename(weekday, getdate())

--Datum "zerteilen"; gibt nur den angegebenen Teil eines Datums aus
year(), month(), day(), quarter()
SELECT year(orderdate) FROM Orders



--Datentypen umwandeln in einer Abfrage

SELECT CAST(Freight as decimal(10,2)) FROM Orders
SELECT CAST(Freight as int) FROM Orders
SELECT CAST(CompanyName as int) FROM Customers
SELECT CAST(OrderDate as varchar(40)) FROM Orders

SELECT CAST(OrderDAte as date) FROM Orders

SELECT CONVERT(varchar(20), OrderDate, 103) FROM Orders
--mit CONVERT kann ein Datum vom US Format in anderen Formaten ausgegeben werden (103 bspw. European)

