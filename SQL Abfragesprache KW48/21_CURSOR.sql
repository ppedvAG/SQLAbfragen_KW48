--CURSOR = "Zeiger", kann verwendet werden um einen Datensatz nach dem anderen "auszuwerten"

DECLARE @City varchar(20), @ID int --nötige Variablen definieren

DECLARE Cursordemo CURSOR --Cursor definieren
FOR SELECT City, ID FROM Customers --Welche Ergebnistabelle soll der Cursor behandeln

OPEN Cursordemo --"startet den Cursor"
FETCH NEXT FROM Cursordemo --"Spring in die nächste (erste) Zeile"
INTO @City, @ID --übertrage die gefundenen Werte in die jeweiligen Variablen 

WHILE @@FETCH_STATUS = 0 -- Fetch_Status = 0 bedeutet, solange es noch weitere Zeilen gibt
BEGIN
	UPDATE Suppliers
	SET City = @City 
	WHERE ID = @ID
	FETCH NEXT FROM Cursordemo INTO @City --"Spring in die nächste Zeile"
END

CLOSE Cursordemo --schließt den Cursor
DEALLOCATE Cursordemo --löscht den definierten Cursor



--Alternative Lösung ohne Cursor über "Fake-ID-Spalte":

SELECT ROW_NUMBER() OVER(ORDER BY CustomerID) as ID, * INTO #t 
FROM Customers 
--generiert zusätzlich zu den Werten eine Spalte mit der Zeilennummer

DECLARE @Counter int = 1

WHILE (SELECT COUNT(*) FROM #t) >= @Counter
BEGIN		
	SELECT * FROM #t WHERE @Counter = ID
	SET @Counter += 1
END
--Loop der alle Ergebnisse Zeile für Zeile durchläuft
