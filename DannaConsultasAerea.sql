use DannaAerea
GO

-- Num pasajeros en cada vuelo

SELECT FK_CodigoVuelo,COUNT(*)
FROM Pasajero
GROUP BY Pasajero.FK_CodigoVuelo

-- num de asientos ocupados en cada clase para un vuelo

SELECT CA.NombreCategoria,V.CodigoVuelo AS 'Codigo Vuelo', COUNT(*) AS 'Asientos ocupados'
FROM ConfiguracionVuelo CV
	INNER JOIN Pasajero P
ON P.NumeroAsiento BETWEEN CV.FilaInicial AND CV.FilaFinal 
	INNER JOIN CategoriaAsientos CA
ON CA.IdCategoriaAsiento = CV.FK_IdCategoriaAsiento
	INNER JOIN Vuelo V
ON CV.FK_CodigoVuelo = V.CodigoVuelo
GROUP BY CA.NombreCategoria, CA.IdCategoriaAsiento,V.CodigoVuelo