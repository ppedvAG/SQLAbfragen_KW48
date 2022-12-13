--DDL: Data Definition Language, sprich Stammdaten anlegen/verändern/löschen

--"Backup" bzw. Kopie einer vorhandenen Tabelle erstellen

SELECT * INTO BackupCustomers FROM Customers

SELECT * FROM BackupCustomers

--Löschen von Tabellen

DROP TABLE BackupCustomers

--Damit nicht versehentlich etwas gelöscht/verändert wird, Transaktionen verwenden!

BEGIN TRAN --versetzt uns in den "Zustand" einer Transaction

SELECT @@TRANCOUNT --Gibt 1 (=Transaction) oder 0 (= keine Transaction) aus

DROP TABLE BackupCustomers

ROLLBACK
COMMIT

--Während der Transaction sind "behandelte" Tabellen gesperrt! FÜR ALLE!
--> Nicht zu lange in der Transaction aufhalten
--Erst schreiben, dann TRAN einführen, dann ROLLBACK/COMMIT nach Prüfung


--Einen vorhandenen Datensatz löschen mit DELETE

DELETE FROM BackupCustomers
WHERE CustomerID = 'ALFKI'

--WHERE Bedingung NICHT VERGESSEN!
--Am Besten immer nach Primary Key filtern
--Trick: erst normales SELECT schreiben

SELECT * --DELETE
FROM Customers
WHERE CustomerID = 'ALFKI'


--Neuen Datensatz zu vorhandener Tabelle hinzufügen mit INSERT INTO

INSERT INTO BackupCustomers (CustomerID, CompanyName, ContactName, Country)
VALUES 
('PPEDV', 'ppedv AG', 'Nico', 'Germany'),
('EDEKA', 'Edeka Markt')

SELECT * FROM BackupCustomers
WHERE CustomerID = 'ppedv'

--Mit INSERT INTO TableName SELECT xy... können Ergebnisse einer SELECT Abfrage direkt in die Tabelle geschrieben werden
INSERT INTO test
SELECT 'Hallo!'
GO 10000 --GO x führt BatchAnweisung x mal durch

DROP TABLE test


--Vorhandene Datensätze/Zellen verändern mit UPDATE
UPDATE BackupCustomers
SET City = 'Burghausen'
WHERE CustomerID = 'PPEDV'
--Selbe wie bei DELETE, WHERE Filter nicht vergessen! Am besten nach Primary Key
SELECT * FROM Backupcustomers
WHERE CustomerID = 'PPEDV'

--"Löschen" von Daten mit UPDATE SET = NULL
UPDATE BackupCustomers
SET ContactName = NULL
WHERE CustomerID = 'PPEDV'


--Erstellen von neuen Tables mit CREATE TABLE

CREATE TABLE Fuhrpark (
AutoID tinyint identity NOT NULL,
EmployeeID int NULL,
Marke varchar(20) NULL,
PS smallint NULL,
PRIMARY KEY (AutoID),
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) --Definiert Fremdschlüssel Beziehung zu Employees Table
)

SELECT * FROM Fuhrpark

--Spalten nachträglich hinzufügen
ALTER TABLE Fuhrpark
ADD Farbe varchar(20) NULL 

--Spalten nachträglich ändern
ALTER TABLE Fuhrpark
ALTER COLUMN PS datetime

INSERT INTO Fuhrpark
VALUES (1, 'Audi', getdate(), 'Blau')

INSERT INTO Fuhrpark
VALUES (10000, 'Audi', getdate(), 'Blau')

--Löschen von Datensätzen/Tabellen nicht ohne weiteres möglich, wenn diese durch Primary-/Foreign Key Beziehungen verknüpft sind
DROP TABLE Customers

DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

--CONSTRAINTS = Einschränkungen 
--CHECK Constraint definiert zulässige Eingaben für eine Spalte
ALTER TABLE Fuhrpark
ADD CONSTRAINT CHK_Farbe CHECK (Farbe = 'blau') -- als Farbe kann jetzt nur noch "blau" eingetragen werden

INSERT INTO Fuhrpark
VALUES (4, 'BMW', getdate(), 'Blau')


--UPDATE mit CASE

UPDATE Orders
SET Freight = 
CASE
	WHEN Freight < 50 THEN Freight*1.2
	WHEN Freight BETWEEN 50 AND 100 THEN Freight*1.1
	ELSE Freight
END

SELECT Freight FROM Orders

