--CASE Keyword = "Teil des SELECTS"
--Mit CASE können Fallunterscheidungen getroffen werden 

SELECT OrderID, Freight, 
CASE
	WHEN Freight < 50 THEN 'Günstig'
	WHEN Freight BETWEEN 50 AND 90 THEN 'Ok'
	WHEN Freight > 100 THEN 'Teuer'
	ELSE 'Fehler' --ELSE Ausgabe wenn keine WHEN Bedingung "Wahr" ist, alternativ NULL
END as Einschätzung
FROM Orders
ORDER BY Einschätzung

--CASE funktioniert auch bei INSERT/UPDATE/DELETE
