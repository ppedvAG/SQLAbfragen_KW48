--eigene Funktionen schreiben
--Skalarfunktion:
CREATE FUNCTION fTaschenrechner (@Par1 float, @Par2 float) RETURNS float --welcher Datentyp wird zur�ckgegeben
AS
BEGIN
	RETURN  (SELECT @Par1 * @Par2)
END
SELECT 

SELECT dbo.fTaschenrechner(3.1, 7.3) --Funktionenaufruf muss immer mit Datenbank Schema angegeben werden (Standard dbo.)

--Skalarfunktionen d�rfen nur EINEN Wert zur�ck geben

ALTER FUNCTION fTaschenrechner -- Bestehende Funktion �ndern
DROP FUNCTION fTaschenrechner -- Bestehende Funktion l�schen


