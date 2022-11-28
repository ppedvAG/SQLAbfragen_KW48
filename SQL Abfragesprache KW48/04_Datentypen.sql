/*
String Datentypen:
-char(10) = 'Otto      '
-nchar()
-varchar(10) = 'Otto'
-nvarchar(10)

Char eigentlich obsolet
"n" bedeuetet UNICODE Codierung, benötigt doppelt soviel Speicher

-varchar(MAX) (8000)
-nvarchar(MAX) (4000)

Zahlen Datentypen:
-tinyint
-smallint
-int
-bigint
-binary = 1 oder 0
-float
-decimal(x,y); bspw decimal(10,2)
(-money)

Datums Datentypen:
-datetime = bis in Milisekundenbereich
-datetime2 = bis in Nanosekundenbereich
-date (yyyymmdd)
-smalldatetime = bis in Minutenbereich
-time

*/


--STRING Manipulation

--ltrim/rtrim = "entfernen" Leerzeichen links oder rechts vom String

'Otto ' WHERE Name = 'Otto'

SELECT rtrim('Otto   ')
SELECT ltrim('    Otto') -- SELECT '    Otto'

SELECT rtrim(CompanyName) as CompanyName FROM Customers

--left/right = Gibt die ersten oder letzten X Symbole eines Strings aus

SELECT left(CompanyName, 3) FROM Customers
SELECT right(CompanyName, 3) FROM Customers

--stuff = Ersetzt Teile eines Strings mit, wenn gewünscht, Replacement Value
SELECT stuff(CompanyName, 3, 3, 'XXXXX') FROM Customers

SELECT stuff(Phone, 1, 6, 'XXXXXX') FROM Customers


--substring = "nimmt" angegebenen Teil eines Strings
SELECT substring(Phone, 4, 3) FROM Customers

--reverse = "dreht" String um
SELECT reverse(12345)

--len
SELECT len(CompanyName) FROM Customers

--Aufgabe: Alle Telefonnummern der Customers Tabelle ausgeben, aber nur die
--letzten 4 Ziffern, alles davor soll mit 'X' zensiert sein

select stuff (Phone,1 , (len(Phone)-4), 'XXXXX') as CensoredPhonenumbers From Customers

--PATINDEX = sucht nach einem "Schema" innerhalb eines Strings, und gibt die Position aus wo es gefunden wurde
SELECT PATINDEX('%[0-9]%', Address) FROM Customers

--CONCAT = fügt Strings zusammen
SELECT CONCAT(FirstName, ' ', LastName, ' ', 'ist toll') as GanzerName FROM Employees
SELECT Firstname + ' ' + Lastname FROM Employees