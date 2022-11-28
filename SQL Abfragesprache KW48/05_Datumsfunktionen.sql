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

