-- Lista de vuelos con nombre de piloto, ordenados por fecha

SELECT Nombre as NombrePiloto,Apellido as ApellidoPiloto,CodigoVuelo,FK_NombreAvion as NombreAvion,Fecha,DuracionMin,
FK_Origen as Origen,FK_Destino as Destino,FK_IdPiloto as Piloto ,FK_IdCopiloto as Copiloto FROM DatosPersonales DT
	INNER JOIN Piloto P
ON DT.IdPersonal = P.FK_IdPersonal
	INNER JOIN VUELO V
ON P.IdPiloto = V.FK_IdPiloto
ORDER BY V.Fecha

-- Num. de pasajero en cada vuelo (o en un vuelo concreto)
SELECT * FROM Pasajero
WHERE FK_CodigoVuelo = 5

-- Lista de pilotos que hacen Intercontinental
SELECT * FROM Piloto
WHERE HaceIntercontinental = 1

-- Total de asientos ocupados en cada clase para un vuelo] -- ESTE NO

-- Lista de pilotos que no vuelan
SELECT Piloto.*
FROM Piloto
	LEFT JOIN Vuelo 
ON Piloto.IdPiloto = Vuelo.FK_IdPiloto
WHERE Vuelo.FK_IdPiloto IS NULL;

-- Lista de pilotos que no tienen servicio asociado

INSERT INTO Vuelo (FK_NombreAvion,Fecha,FK_Origen,FK_Destino,FK_IdPiloto,FK_IdCopiloto,DuracionMin) VALUES
(9,'2023-10-29', 21,22,3,4,120)

-- Nombres de pilotos que hayan volado a MAD
SELECT Nombre,Apellido FROM DatosPersonales DT
	INNER JOIN Piloto P
ON DT.IdPersonal = P.FK_IdPersonal
	INNER JOIN Vuelo V
ON V.FK_IdPiloto = P.IdPiloto
WHERE V.FK_Destino = (SELECT IdCiudad 
FROM Ciudad
WHERE NombreCiudad = 'Madrid')

-- Nombres de pilotos que no hayan volado a BCN
SELECT Nombre,Apellido FROM DatosPersonales DT
	INNER JOIN Piloto P
ON DT.IdPersonal = P.FK_IdPersonal
	INNER JOIN Vuelo V
ON V.FK_IdPiloto = P.IdPiloto
WHERE V.FK_Destino != (SELECT IdCiudad 
FROM Ciudad
WHERE NombreCiudad = 'Barcelona')

-- Num. de vuelos pilotados por pilotos intercontinentales
SELECT COUNT(*) AS ConteoVuelosPorPiloto
FROM Vuelo
WHERE Vuelo.FK_IdPiloto IN (
    SELECT IdPiloto
    FROM Piloto
    WHERE HaceIntercontinental = 1)


-- Num. de vuelos con destino a BCN
SELECT COUNT(*) AS CantVueloDestinoBCN
FROM Vuelo
WHERE FK_Destino = (SELECT IdCiudad 
FROM Ciudad
WHERE NombreCiudad = 'Barcelona')
