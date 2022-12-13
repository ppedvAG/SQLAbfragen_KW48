--WHILE = LOOP = Schleife

WHILE 1 = 1 --Bedingung definieren; solange die Bedingung "Wahr/True" ist, wird die Schleife wiederholt
BEGIN
	SELECT 'Hallo!' --Zwischen BEGIN und END ist die Anweisung f�r den Schleifendurchlauf
END


DECLARE @var1 int = 1 --Z�hlervariable definieren

WHILE @var1 <= 5
BEGIN
	SELECT 'Hallo!'
	--SET @var1 = @var1 + 1
	SET @var1 += 1 --Erh�ht die Z�hlvariable nach jedem Durchlauf um 1
END


--Aufgabe:
--1. Orders Tabelle kopieren; 2. Freight in 10% Schritten erh�hen, 
--MAX(Freight) soll dabei nicht gr��er 1500 werden, AVG(Freight) nicht gr��er 100
--Wie oft l�uft eure Schleife durch?
SELECT * INTO BackupOrders FROM Orders

--L�sung mit "Schritt zur�ck"

While
(select Max(Freight) from BackupOrders) < 1500 and (Select AVG(Freight) from BackupOrders) <100
Begin
    Select Max(Freight), AVG (Freight) from BackupOrders
    UPDATE BackupOrders
    Set Freight = (Freight + 0.1*Freight)
End
UPDATE BackupOrders
SET Freight = Freight/1.1

--Alternative L�sung:

While
(select Max(Freight)*1.1 from BackupOrders) < 1500 AND (Select AVG(Freight)*1.1 from BackupOrders) <100
Begin
    UPDATE BackupOrders
    Set Freight = (Freight + 0.1*Freight)
	Select Max(Freight), AVG (Freight) from BackupOrders
End

