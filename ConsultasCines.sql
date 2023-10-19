use DannaCines
go

--1. Mostrar el nombre de todas las pel�culas
SELECT Nombre FROM PELICULAS

--2. Mostrar las distintas calificaciones de edad que existen
SELECT DISTINCT(calificacionEdad) FROM PELICULAS

--3. Mostrar todas las pel�culas que no han sido calificadas
SELECT * FROM PELICULAS
WHERE calificacionEdad is NULL 
OR calificacionEdad = 0

--4. Mostrar todas las salas que no proyectan pel�culas
SELECT * FROM SALAS
WHERE Pelicula is NULL

--5. Mostrar la informaci�n de todas las salas, y si se proyecta alguna pel�cula en la sala,
--mostrar tambi�n la informaci�n de la pel�cula
SELECT * FROM SALAS
	LEFT JOIN PELICULAS
ON SALAS.Pelicula =  PELICULAS.Codigo

--6. Mostrar la informaci�n de todas las pel�culas, y si se proyecta en alguna sala,
--mostrar tambi�n la informaci�n de la sala
SELECT * FROM PELICULAS
	LEFT JOIN SALAS
ON Peliculas.Codigo =  SALAS.Pelicula

--7. Mostrar los nombres de las pel�culas que no se proyectan en ninguna sala
SELECT PELICULAS.Nombre FROM PELICULAS
	LEFT JOIN SALAS
ON Peliculas.Codigo =  SALAS.Pelicula
WHERE SALAS.Codigo IS NULL
