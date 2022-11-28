--LIKE = können "ungenaue" Werte gesucht/gefiltert werden
--Mithilfe sogenannter Wildcards

SELECT * FROM Customers
WHERE CompanyName LIKE 'A%'
--'%' steht für beliebiges Symbol, davon beliebig viele

SELECT * FROM Customers
WHERE CompanyName LIKE 'A_A%'
--'_' steht für EIN beliebiges Symbol
SELECT * FROM Customers
WHERE CompanyName LIKE 'A_____t%'

SELECT * FROM Customers
WHERE CompanyName LIKE '[abcdef]%'

SELECT * FROM Customers
WHERE CompanyName LIKE '[a-f]%'

--'[abc] oder [a-c]' steht für EINE Stelle, zulässige Symbole befinden sich in der Klammer


SELECT * FROM Customers
WHERE CompanyName LIKE '[^abcdef]%'

SELECT * FROM Customers
WHERE CompanyName LIKE '[^a-f]%'

--'[^abc] oder [^a-c]' steht für EINE Stelle, UNzulässige Symbole befinden sich in der Klammer
-- = Umkehrmenge


SELECT * FROM Customers
WHERE PostalCode LIKE '[0-4]%' AND Country = 'Germany'

LIKE 'M[eay][iy]%'