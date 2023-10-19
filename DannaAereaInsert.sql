use DannaAerea
GO

INSERT INTO Ciudad (NombreCiudad)
VALUES
  ('Nueva York'),
  ('Los �ngeles'),
  ('Chicago'),
  ('Houston'),
  ('Miami'),
  ('San Francisco'),
  ('Las Vegas'),
  ('Boston'),
  ('Dallas'),
  ('Seattle'),
  ('Atlanta'),
  ('Denver'),
  ('Phoenix'),
  ('Philadelphia'),
  ('San Diego'),
  ('New Orleans'),
  ('Austin'),
  ('Nashville'),
  ('Portland'),
  ('Detroit');

  INSERT INTO Avion (Modelo, Capacidad, A�oConstruccion) VALUES
    ('Boeing 747', 416, '01/01/1969'),
    ('Airbus A380', 853,'01/01/2005'),
    ('Boeing 737', 230, '01/01/1968'),
    ('Embraer E190', 114, '01/01/2002'),
    ('Cessna 172', 210, '01/01/1955'),
    ('Bombardier Global 6000', 120, '01/01/2006'),
    ('Airbus A320', 240,  '01/01/1988'),
    ('Gulfstream G650', 18,  '01/01/2012'),
    ('Boeing 777', 550,  '01/01/1994'),
    ('Cessna Citation X', 190, '01/01/1996');

	INSERT INTO CategoriaAsientos (NombreCategoria) VALUES
    ('Business'),
    ('Turista'),
    ('Primera Clase'),
    ('Econ�mica'),
	('Premium Business')

	INSERT INTO DatosPersonales (Nombre, Apellido, NIF) VALUES
    ('Juan', 'Gonz�lez', '12345678A'),
    ('Mar�a', 'L�pez', '98765432B'),
    ('Pedro', 'Mart�nez', '54321678C'),
    ('Ana', 'Rodr�guez', '87654321D'),
    ('Carlos', 'Fern�ndez', '65432187E'),
    ('Sof�a', 'P�rez', '43218765F'),
    ('Luis', 'S�nchez', '76543218G'),
    ('Laura', 'G�mez', '21876543H'),
    ('Jos�', 'Ram�rez', '32187654I'),
    ('Isabel', 'Torres', '65432187J');

	INSERT INTO Piloto (FK_IdPersonal, HaceNacional, HaceInternacional, HaceIntercontinental) VALUES
	(1, 1, 1,0),
	(2, 1, 1,1),
	(3, 1, 0,0),
	(4, 1, 1,0)

	INSERT INTO Categoria (NombreCategoria) VALUES
    ('Azafata'),
    ('Azafato'),
	('Mec�nico'),
    ('Ayudante de Cabina')

	INSERT INTO Auxiliar (FK_IdPersonal, FK_IdCategoria) VALUES
	(5, 2),
	(6, 1),
	(7, 3),
	(8, 1),
	(9, 4),
	(10, 4)

	INSERT INTO Vuelo (FK_NombreAvion,Fecha,FK_Origen,FK_Destino,FK_IdPiloto,FK_IdCopiloto,DuracionMin) VALUES
	(2,'2023/10/23',2,3,3,4,40)  

	INSERT INTO ConfiguracionVuelo (FK_IdCategoriaAsiento, FK_CodigoVuelo,FilaInicial,FilaFinal,Precio) VALUES
	(3, 5,'1A','23A', 49.99),
	(1, 5,'1B','23B', 39.99),
	(2, 5,'1C','23C', 31.99)

	INSERT INTO Pasajero (FK_CodigoVuelo, [NIF/PASSPORT], Nombre, Apellido, FechaReserva, NumeroAsiento) VALUES
    (5, '12345678A', 'Juan', 'Gonz�lez', '2023-08-20', '12A'),
    (5, '98765432B', 'Mar�a', 'L�pez', '2023-09-21', '7B'),
    (5, '54321678C', 'Pedro', 'Mart�nez', '2023-08-22', '18C'),
    (5, '87654321D', 'Ana', 'Rodr�guez', '2023-07-23', '4B'),
    (5, '65432187E', 'Carlos', 'Fern�ndez', '2023-09-24', '15A'),
    (5, '43218765F', 'Sof�a', 'P�rez', '2023-10-01', '9A'),
    (5, '76543218G', 'Luis', 'S�nchez', '2023-10-02', '23B'),
    (5, '21876543H', 'Laura', 'G�mez', '2023-10-03', '3C'),
    (5, '32187654I', 'Jos�', 'Ram�rez', '2023-10-04',' 10A'),
    (5, '65432187J', 'Isabel', 'Torres', '2023-10-05', '5B');

	INSERT INTO VueloAuxiliar (FK_IdAuxiliar,FK_CodigoVuelo) VALUES
	(1,5),
	(2,5),
	(3,5),
	(4,5)


