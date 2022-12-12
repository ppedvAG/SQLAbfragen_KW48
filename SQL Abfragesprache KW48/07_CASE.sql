--CASE Keyword = "Teil des SELECTS"
--Mit CASE k�nnen Fallunterscheidungen getroffen werden 

SELECT OrderID, Freight, 
CASE
	WHEN Freight < 50 THEN 'G�nstig'
	WHEN Freight BETWEEN 50 AND 90 THEN 'Ok'
	WHEN Freight > 100 THEN 'Teuer'
	ELSE 'Fehler' --ELSE Ausgabe wenn keine WHEN Bedingung "Wahr" ist, alternativ NULL
END as Einsch�tzung
FROM Orders
ORDER BY Einsch�tzung

--CASE funktioniert auch bei INSERT/UPDATE/DELETE
