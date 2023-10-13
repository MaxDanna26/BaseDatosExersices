	USE DannaLimpieza
	Go

INSERT INTO Cliente (Nombre, Apellido, Telefono, CIF, Domicilio, Actividad) VALUES
  ('Juan', 'P�rez', 1234567890, 'A1234567B', 'Calle Alegre 123', 'Servicios de oficina'),
  ('Mar�a', 'Garc�a', 9876543210, 'B2345678C', 'Av. Principal 456', 'Limpieza dom�stica'),
  ('Antonio', 'L�pez', 5551237890, 'C3456789D', 'Calle del Sol 789', 'Limpieza industrial'),
  ('Laura', 'Rodr�guez', 1112223333, 'D4567890E', 'Paseo de la Luna 1', 'Limpieza de ventanas'),
  ('Jos�', 'S�nchez', 7778889999, 'E5678901F', 'Av. de la Playa 56', 'Limpieza de jardines'),
  ('Carmen', 'Mart�nez', 3334445555, 'F6789012G', 'Plaza Mayor 789', 'Limpieza de piscinas'),
  ('Juan Carlos', 'Garc�a', 9998887777, 'G7890123H', 'Calle Estrecha 12', 'Limpieza de veh�culos'),
  ('Marta', 'Gonz�lez', 7773331111, 'H8901234I', 'Av. del Bosque 45', 'Limpieza de hoteles'),
  ('Pedro', 'Fern�ndez', 5556664444, 'I9012345J', 'Paseo del R�o 23', 'Limpieza de restaurantes'),
  ('Rosa', 'D�az', 2224446666, 'J0123456K', 'Calle Angosta 56', 'Limpieza de tiendas');

  INSERT INTO Factura (Fecha, EstaPagado, Importe, FK_IdCliente) VALUES
  ('2023-10-01', 1, 100.50, 1), 
  ('2023-10-02', 0, 75.25, 2), 
  ('2023-10-03', 1, 120.00, 3),   
  ('2023-10-04', 1, 50.75, 4),   
  ('2023-10-05', 0, 90.30, 5), 
  ('2023-10-06', 1, 65.00, 6),  
  ('2023-10-07', 0, 85.60, 7),
  ('2023-10-08', 1, 150.00, 8),  
  ('2023-10-09', 0, 45.75, 9), 
  ('2023-10-10', 1, 55.20, 10); 

  INSERT INTO Limpiador (Nombre, Apellido, NIF, Telefono, Domicilio) VALUES
  ('Luisa', 'Mart�nez', 'A1234567X', 123456789, 'Calle Limpia 1'),
  ('Javier', 'Fern�ndez', 'B2345678Y', 234567890, 'Av. de la Limpieza 2'),
  ('Sof�a', 'L�pez', 'C3456789Z', 345678901, 'Paseo del Barrio 3'),
  ('Miguel', 'Gonz�lez', 'D4567890W', 456789012, 'Calle Principal 4'),
  ('Ana', 'S�nchez', 'E5678901V', 567890123, 'Av. del Sol 5'),
  ('Carlos', 'Ram�rez', 'F6789012U', 678901234, 'Calle del R�o 6'),
  ('Mar�a', 'G�mez', 'G7890123T', 789012345, 'Plaza Grande 7'),
  ('Pedro', 'D�az', 'H8901234S', 890123456, 'Paseo del Parque 8'),
  ('Isabel', 'Rodr�guez', 'I9012345R', 901234567, 'Av. de la Monta�a 9'),
  ('Luis', 'Torres', 'J0123456Q', 123456789, 'Calle Estrecha 10');

  INSERT INTO Servicio (NomServicio) VALUES
  ('Limpieza de Oficinas'),
  ('Limpieza Dom�stica'),
  ('Limpieza Industrial'),
  ('Limpieza de Ventanas'),
  ('Limpieza de Jardines'),
  ('Limpieza de Piscinas'),
  ('Limpieza de Veh�culos'),
  ('Limpieza de Hoteles'),
  ('Limpieza de Restaurantes'),
  ('Limpieza de Tiendas');

    INSERT INTO Contrato(FK_IdCliente,Coste,Periocidad) VALUES
	(1,25.00,'Semanal'),
	(1,54.99,'Quincenal'),
	(1,54.99,'Quincenal'),
	(1,25.00,'Semanal'),
	(1,80.99,'Mensual'),
	(1,54.99,'Quincenal'),
	(1,25.00,'Semanal'),
	(1,25.00,'Semanal'),
	(1,25.00,'Semanal'),
	(1,54.99,'Quincenal');

	INSERT INTO ContratoServicio(Fk_Contrato,Fk_Servicio)VALUES
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8),
	(9,9),
	(10,10);

	INSERT INTO Trabajo(Fk_Limpiador,FK_IdContratoServicio,FechaRealizada)VALUES
	(1,1,07/10/2023),
	(1,2,15/09/2023),
	(1,3,15/02/2023),
	(1,4,07/03/2023),
	(1,5,01/04/2023),
	(1,6,15/05/2023),
	(1,7,07/06/2023),
	(1,8,07/07/2023),
	(1,9,07/08/2023),
	(1,10,15/09/2023);



