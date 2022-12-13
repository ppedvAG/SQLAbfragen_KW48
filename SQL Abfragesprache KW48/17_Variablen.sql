--Variablen
--@ = lokal, @@ = global
--Datentyp der Varbiablen muss angegeben werden
--Das DECLARE Statement muss mit der restlichen Abfrage ausgeführt werden
DECLARE @var1 varchar(20), @var2 int, @var3 datetime

SET @var1 = 'Germany'

SELECT * FROM Customers
WHERE Country = @var1

--Default Wert bzw. Startwert einer Variable:
DECLARE @var4 varchar(20) = 'France'

SELECT * FROM Customers
WHERE Country = @var4

