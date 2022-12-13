--(stored) Procedures/(gespeicherte) Prozeduren

--Prozeduren sind quasi gespeicherte Abfragen/Anweisungen die jedesmal gleich ausgeführt werden
--Können mit Parametern angelegt werden
--Funktionieren mit SELECT, DELETE, INSERT, UPDATE usw.
--Werden auf dem Server (der Datenbank) gespeichert, und sind für alle sichtbar/verwendbar

CREATE PROC spDemo @var1 varchar(20)
AS
SELECT * FROM Customers
WHERE Country = @var1

EXEC spDemo France --führt Prozedur aus


--Prozeduren mit mehreren Variablen und Default Wert:

ALTER PROC spDemo @var1 varchar(20) = 'Germany', @var2 varchar(20) = 'Berlin'
AS
SELECT * FROM Customers
WHERE Country = @var1 AND City = @var2

EXEC spDemo Spain, Madrid


SELECT * INTO BackupCustomers FROM Customers --Backup der Customer Tabelle

--Prozedur mit DELETE Anweisung:
CREATE PROC spDelCus @CusID char(5)
AS
DELETE FROM BackupCustomers
WHERE CustomerID = @CusID

EXEC spDelCus PARIS

SELECT * FROM BackupCustomers

--Vorteil von PROC: "Fahrplan", also Executionplan des SQL-Servers wird abgespeichert
--und muss bei erneuter Ausführung nicht neu berechnet werden



--Aufgabe: Prozedur erstellen, die einen Kunden aus der Customers Tabelle löscht (INPUT CustomerID)
--Tipp: Subqueries; Kürzere Abfrage als vielleicht vermutet
--Procedure kann mehrere "eigenständige" Anweisungen durchführen

CREATE PROC spDelCustomer @var1 char(5)
AS
DELETE FROM [Order Details] WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @var1)
DELETE FROM Orders WHERE CustomerID = @var1
DELETE FROM Customers WHERE CustomerID = @var1

EXEC spDelCustomer ALFKI