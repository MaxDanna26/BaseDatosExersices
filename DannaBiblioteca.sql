USE DannaBiblioteca
GO

CREATE TABLE Personas
(IdSocio int NOT NULL  IDENTITY(1,1) PRIMARY KEY,
Nombre varchar(30),
Apellido varchar (30),
Telefono int,
Direccion varchar(50),
DNI nchar(10)
)

CREATE TABLE Libro
(IdLibro INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Titulo varchar(50),
Autor varchar(30),
AñoEscritura date,
Editorial varchar(50),
AñoEdicion DATE,
IBSN INT
)

CREATE TABLE Prestamo
(IdPrestamo INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
FechaAlquiler DATE,
FechaTope DATE,
FechaDevolucion DATE
)

CREATE TABLE LibroPrestamo
(FK_IdLibro INT FOREIGN KEY REFERENCES Libro(IdLibro),
FK_IdPrestamo INT FOREIGN KEY REFERENCES Prestamo(IdPrestamo))

CREATE TABLE Volumen
(IdVolumen INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
FK_IdLibro INT FOREIGN KEY REFERENCES Libro(IdLibro),
EsUtilizable BIT
)

CREATE TABLE PrestamoPersona
(FK_IdPrestamo INT FOREIGN KEY REFERENCES Prestamo(IdPrestamo),
FK_IdPersona INT FOREIGN KEY REFERENCES Personas(IdSocio))

INSERT INTO Personas (Nombre, Apellido, Telefono, Direccion, DNI) VALUES
    ('Juan', 'Pérez', '555123456', 'Calle 123, Ciudad Ejemplo', '1234567890'),
    ('María', 'Rodríguez', '55587654', 'Avenida Principal, Otra Ciudad', '0987654321'),
    ('Carlos', 'Gómez', '555456789', 'Calle Principal, Ciudad Imaginaria', '4567890123'),
    ('Laura', 'Martínez', '555654321', 'Calle Secundaria, Pueblo Ficticio', '7654321098'),
    ('Roberto', 'Sánchez', '555789123', 'Avenida Principal, Ciudad de los Sueños', '2345678901');

INSERT INTO Libro (Titulo, Editorial, AñoEscritura, Autor, AñoEdicion, IBSN) VALUES
    ('El Gran Libro de la Ciencia', 'Editorial Imaginaria', '2005-03-15', 'Alberto Pérez', '2007-06-20', '97812367890'),
    ('Historia del Arte Moderno', 'Ediciones Creativas', '2010-12-10', 'María Rodríguez', '2012-08-05', '97807654321'),
    ('La Aventura Espacial', 'Ediciones Estelares', '1999-05-30', 'Carlos Gómez', '2001-11-17', '97845890123'),
    ('El Jardín Secreto', 'Libros Mágicos', '1992-08-22', 'Laura Martínez', '1994-04-14', '9787654398'),
    ('Cocina del Mundo', 'Editorial Gastronómica', '2008-07-03', 'Roberto Sánchez', '2010-10-25', '97823458901');

INSERT INTO Volumen (FK_IdLibro, EsUtilizable) VALUES
    (1, 1),
    (2, 1), 
    (3, 1), 
    (4, 1), 
    (5, 0); 

INSERT INTO Prestamo (FechaAlquiler, FechaTope, FechaDevolucion) VALUES
    ('2023-10-10', DATEADD(DAY,15,'2023-10-10'), '2023-10-20'), 
    ('2023-10-12', DATEADD(DAY,15,'2023-10-12'), '2023-10-25'), 
    ('2023-10-15', DATEADD(DAY,15,'2023-10-15'), '2023-10-28'), 
    ('2023-10-18', DATEADD(DAY,15,'2023-10-18'), '2023-10-30'),
    ('2023-10-20', DATEADD(DAY,15,'2023-10-20'), '2023-10-30');

INSERT INTO LibroPrestamo (FK_IdLibro, FK_IdPrestamo) VALUES
	(1,1),
	(2,2),
	(3,3),
	(4,5),
	(5,4)

INSERT INTO PrestamoPersona(FK_IdPrestamo, FK_IdPersona) VALUES
	(1,2),
	(2,3),
	(3,4),
	(4,5),
	(5,6)

CREATE TABLE Autor
(IdAutor INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Nombre	VARCHAR(30),
Apellido VARCHAR(30))

INSERT INTO Autor(Nombre, Apellido) VALUES
('Alberto', 'Pérez'),
('Maria', 'Rodriguez'),
('Carlos', 'Gomez'),
('Laura', 'Martinez'),
('Roberto', 'Sanchez')

CREATE TABLE Editorial
(IdEditorial INT IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(50))

INSERT INTO Editorial(Nombre) VALUES
('Ediciones Imaginarias'),
('Ediciones Misticas'),
('Ediciones Creativas'),
('Libros magicos'),
('Editorial gastronomicas')

UPDATE Libro
SET Editorial = NULL

UPDATE Libro
SET Autor = NULL

ALTER TABLE Libro
ALTER COLUMN Autor int

ALTER TABLE Libro
ALTER COLUMN Autor int

ALTER TABLE Libro
ADD CONSTRAINT Autor FOREIGN KEY REFERENCES Autor(IdAutor) 

ALTER TABLE Libro
ADD CONSTRAINT Editorial FOREIGN KEY REFERENCES Editorial(IdEditorial) 


-- Correccion editorial

UPDATE Libro
SET Editorial = 1 
WHERE IdLibro = 1

UPDATE Libro
SET Editorial = 2 
WHERE IdLibro = 2

UPDATE Libro
SET Editorial = 3 
WHERE IdLibro = 3

UPDATE Libro
SET Editorial = 4 
WHERE IdLibro = 4

UPDATE Libro
SET Editorial = 5 
WHERE IdLibro = 5

-- Correccion autor

UPDATE Libro
SET Autor = 1 
WHERE IdLibro = 1

UPDATE Libro
SET Autor = 2
WHERE IdLibro = 2

UPDATE Libro
SET Autor = 3
WHERE IdLibro = 3

UPDATE Libro
SET Autor = 4
WHERE IdLibro = 4

UPDATE Libro
SET Autor = 5
WHERE IdLibro = 5

-- Función para sacar cuantos libro se prestaron entre 2 fechas
CREATE FUNCTION LibrosEntreFechas
(@fechaUno date,
@fechaDos date)
RETURNS int
AS
BEGIN 
	DECLARE @resultado int;
	SET @resultado = (SELECT COUNT(*) FROM Prestamo WHERE FechaAlquiler BETWEEN @fechauno AND @fechados);
	RETURN @resultado;
END

SELECT dbo.LibrosEntreFechas('2023-10-01','2023-12-01')

-- SP para insertar un prestamo nuevo

CREATE PROCEDURE NuevoPrestamo
@FechaAlquiler DATE,
@FechaTope DATE,
@FechaDevolucion DATE,
@IdPersona INT,
@IdLibro INT
AS
BEGIN
	INSERT INTO Prestamo(FechaAlquiler,FechaTope,FechaDevolucion) VALUES
	(@FechaAlquiler,@FechaTope,@FechaDevolucion)

	DECLARE @IdPrestamo int;
    SET @IdPrestamo = SCOPE_IDENTITY();

	INSERT INTO LibroPrestamo (FK_IdLibro,FK_IdPrestamo) VALUES
	(@IdLibro, @IdPrestamo)

	INSERT INTO PrestamoPersona (FK_IdPrestamo,FK_IdPersona) VALUES
	(@IdPersona,@IdPrestamo)
END

EXEC NuevoPrestamo @FechaAlquiler = '2023-10-25', @FechaTope = DATEADD(DAY,15,@FechaAlquiler),
@FechaDevolucion = '2023-11-01', @IdPersona = 2, @IdLibro = 2


-- SP para marcar/quitar la marca 'Deteriorado' a todos los ejemplares de libros 

--   de un autor, o de una editorial, o a un ejemplar concreto