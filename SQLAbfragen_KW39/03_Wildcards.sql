--Wildcards

--Generell können wir "ungenaue" Filter anwenden mit LIKE

--"%" steht für beliebiges Symbol, beliebig viele

SELECT * FROM Customers
WHERE CompanyName LIKE 'A%'

SELECT * FROM Customers
WHERE CompanyName LIKE 'A%E'

--"_" genau EIN beliebigs Symbol

SELECT * FROM Customers
WHERE CompanyName LIKE '_a%'

--"[]" nimmt ein Symbol aus den Klammern

SELECT * FROM Customers
WHERE CompanyName LIKE '[abc]%'

--"[^]" schließt alle Symbole in den Klammer aus

SELECT * FROM Customers
WHERE CompanyName LIKE '[^abc]%'

--"[a-g]", "[^a-g]", "[0-5]"

SELECT * FROM Customers
WHERE PostalCode LIKE '[0-3]%' AND Country = 'Germany'



WHERE Nachname LIKE 'M[eay][iye][ea]r%'


UPDATE Customers SET CompanyName = 'Alfred´s Futterkiste%' WHERE CustomerID = 'ALFKI'

--Suche nach "%" oder "'" im Namen
SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'

SELECT * FROM Customers
WHERE CompanyName LIKE '%''%'