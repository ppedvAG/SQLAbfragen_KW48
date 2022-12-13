--eigene Funktionen schreiben
--Skalarfunktion:
CREATE FUNCTION fTaschenrechner (@Par1 float, @Par2 float) RETURNS float --welcher Datentyp wird zurückgegeben
AS
BEGIN
	RETURN  (SELECT @Par1 * @Par2)
END
SELECT 

SELECT dbo.fTaschenrechner(3.1, 7.3) --Funktionenaufruf muss immer mit Datenbank Schema angegeben werden (Standard dbo.)

--Skalarfunktionen dürfen nur EINEN Wert zurück geben

ALTER FUNCTION fTaschenrechner -- Bestehende Funktion ändern
DROP FUNCTION fTaschenrechner -- Bestehende Funktion löschen


