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
A�oEscritura date,
Editorial varchar(50),
A�oEdicion DATE,
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
    ('Juan', 'P�rez', '555123456', 'Calle 123, Ciudad Ejemplo', '1234567890'),
    ('Mar�a', 'Rodr�guez', '55587654', 'Avenida Principal, Otra Ciudad', '0987654321'),
    ('Carlos', 'G�mez', '555456789', 'Calle Principal, Ciudad Imaginaria', '4567890123'),
    ('Laura', 'Mart�nez', '555654321', 'Calle Secundaria, Pueblo Ficticio', '7654321098'),
    ('Roberto', 'S�nchez', '555789123', 'Avenida Principal, Ciudad de los Sue�os', '2345678901');

INSERT INTO Libro (Titulo, Editorial, A�oEscritura, Autor, A�oEdicion, IBSN) VALUES
    ('El Gran Libro de la Ciencia', 'Editorial Imaginaria', '2005-03-15', 'Alberto P�rez', '2007-06-20', '97812367890'),
    ('Historia del Arte Moderno', 'Ediciones Creativas', '2010-12-10', 'Mar�a Rodr�guez', '2012-08-05', '97807654321'),
    ('La Aventura Espacial', 'Ediciones Estelares', '1999-05-30', 'Carlos G�mez', '2001-11-17', '97845890123'),
    ('El Jard�n Secreto', 'Libros M�gicos', '1992-08-22', 'Laura Mart�nez', '1994-04-14', '9787654398'),
    ('Cocina del Mundo', 'Editorial Gastron�mica', '2008-07-03', 'Roberto S�nchez', '2010-10-25', '97823458901');

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