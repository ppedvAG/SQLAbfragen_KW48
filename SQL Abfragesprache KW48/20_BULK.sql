--Mit BULK INSERT k�nnen Daten aus einer CSV (Text) Datei in eine vorhandene Tabelle �bertragen werden

BULK INSERT Customers --Zieltabelle
FROM 'C:\\Dokumente\ExcelSheetName.csv' --Dateipfad
WITH (
	Firstrow = 2, --Zeile des ersten Datensatzes
	FIELDTERMINATOR = ';', --Spalten-Trennzeichen
	ROWTERMINATOR = '\n' --Zeilenumbruch/wo beginnt neuer Datensatz
	)
