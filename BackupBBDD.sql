USE [DannaAerea]
GO
/****** Object:  UserDefinedFunction [dbo].[DayToday]    Script Date: 23/10/2023 19:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[DayToday]
()
RETURNS int
AS
BEGIN 
	DECLARE @resultado int;
	SET @resultado = DAY(getdate());
	RETURN @resultado;
END
GO
/****** Object:  UserDefinedFunction [dbo].[FechaDeHoy]    Script Date: 23/10/2023 19:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FechaDeHoy]
( 
)
RETURNS date
AS
BEGIN 
	DECLARE @resultado date;
	SET @resultado = getdate();
	RETURN @resultado;
END
GO
/****** Object:  UserDefinedFunction [dbo].[ValorDeHoy]    Script Date: 23/10/2023 19:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ValorDeHoy](@opcion int)
RETURNS INT
AS
BEGIN 
DECLARE @resultado INT;
SET @resultado = 
CASE @opcion
	WHEN 1 THEN DAY(getdate())
	WHEN 2 THEN MONTH(getdate())
	WHEN 3 THEN YEAR(getdate())
END
	RETURN @resultado
END
GO
/****** Object:  Table [dbo].[Auxiliar]    Script Date: 23/10/2023 19:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auxiliar](
	[IdAuxiliar] [int] IDENTITY(1,1) NOT NULL,
	[FK_IdPersonal] [int] NULL,
	[FK_IdCategoria] [int] NULL,
 CONSTRAINT [PK_Auxiliar] PRIMARY KEY CLUSTERED 
(
	[IdAuxiliar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avion]    Script Date: 23/10/2023 19:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avion](
	[NombreAvion] [int] IDENTITY(1,1) NOT NULL,
	[Modelo] [varchar](30) NULL,
	[Capacidad] [int] NULL,
	[AñoConstruccion] [date] NULL,
 CONSTRAINT [PK_Avion] PRIMARY KEY CLUSTERED 
(
	[NombreAvion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 23/10/2023 19:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [varchar](30) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriaAsientos]    Script Date: 23/10/2023 19:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaAsientos](
	[IdCategoriaAsiento] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [varchar](30) NULL,
 CONSTRAINT [PK_CategoriaAsientos] PRIMARY KEY CLUSTERED 
(
	[IdCategoriaAsiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 23/10/2023 19:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[IdCiudad] [int] IDENTITY(1,1) NOT NULL,
	[NombreCiudad] [varchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IdCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfiguracionVuelo]    Script Date: 23/10/2023 19:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfiguracionVuelo](
	[IdConfiVuelo] [int] IDENTITY(1,1) NOT NULL,
	[FK_IdCategoriaAsiento] [int] NULL,
	[FK_CodigoVuelo] [int] NULL,
	[FilaFinal] [nchar](10) NULL,
	[FilaInicial] [nchar](10) NULL,
	[Precio] [decimal](6, 2) NULL,
 CONSTRAINT [PK_ConfiguracionVuelo] PRIMARY KEY CLUSTERED 
(
	[IdConfiVuelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatosPersonales]    Script Date: 23/10/2023 19:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatosPersonales](
	[IdPersonal] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[NIF] [nchar](10) NULL,
 CONSTRAINT [PK_DatosPersonales] PRIMARY KEY CLUSTERED 
(
	[IdPersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 23/10/2023 19:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajero](
	[IdPasajero] [int] IDENTITY(1,1) NOT NULL,
	[FK_CodigoVuelo] [int] NULL,
	[NIF/PASSPORT] [nchar](12) NULL,
	[Nombre] [varchar](30) NULL,
	[Apellido] [varchar](30) NULL,
	[FechaReserva] [datetime] NULL,
	[NumeroAsiento] [nchar](5) NULL,
 CONSTRAINT [PK_Pasajeros] PRIMARY KEY CLUSTERED 
(
	[IdPasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piloto]    Script Date: 23/10/2023 19:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piloto](
	[IdPiloto] [int] IDENTITY(1,1) NOT NULL,
	[FK_IdPersonal] [int] NULL,
	[HaceNacional] [bit] NULL,
	[HaceInternacional] [bit] NULL,
	[HaceIntercontinental] [bit] NULL,
 CONSTRAINT [PK_Piloto] PRIMARY KEY CLUSTERED 
(
	[IdPiloto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelo]    Script Date: 23/10/2023 19:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelo](
	[CodigoVuelo] [int] IDENTITY(1,1) NOT NULL,
	[FK_NombreAvion] [int] NULL,
	[Fecha] [date] NULL,
	[FK_Origen] [int] NULL,
	[FK_Destino] [int] NULL,
	[FK_IdPiloto] [int] NULL,
	[FK_IdCopiloto] [int] NULL,
	[DuracionMin] [int] NULL,
 CONSTRAINT [PK_Vuelo] PRIMARY KEY CLUSTERED 
(
	[CodigoVuelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VueloAuxiliar]    Script Date: 23/10/2023 19:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VueloAuxiliar](
	[FK_IdAuxiliar] [int] NOT NULL,
	[FK_CodigoVuelo] [int] NOT NULL,
 CONSTRAINT [PK_VueloAuxiliar] PRIMARY KEY CLUSTERED 
(
	[FK_IdAuxiliar] ASC,
	[FK_CodigoVuelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Auxiliar] ON 
GO
INSERT [dbo].[Auxiliar] ([IdAuxiliar], [FK_IdPersonal], [FK_IdCategoria]) VALUES (1, 5, 2)
GO
INSERT [dbo].[Auxiliar] ([IdAuxiliar], [FK_IdPersonal], [FK_IdCategoria]) VALUES (2, 6, 1)
GO
INSERT [dbo].[Auxiliar] ([IdAuxiliar], [FK_IdPersonal], [FK_IdCategoria]) VALUES (3, 7, 3)
GO
INSERT [dbo].[Auxiliar] ([IdAuxiliar], [FK_IdPersonal], [FK_IdCategoria]) VALUES (4, 8, 1)
GO
INSERT [dbo].[Auxiliar] ([IdAuxiliar], [FK_IdPersonal], [FK_IdCategoria]) VALUES (5, 9, 4)
GO
INSERT [dbo].[Auxiliar] ([IdAuxiliar], [FK_IdPersonal], [FK_IdCategoria]) VALUES (6, 10, 4)
GO
SET IDENTITY_INSERT [dbo].[Auxiliar] OFF
GO
SET IDENTITY_INSERT [dbo].[Avion] ON 
GO
INSERT [dbo].[Avion] ([NombreAvion], [Modelo], [Capacidad], [AñoConstruccion]) VALUES (1, N'Boeing 747', 416, CAST(N'1969-01-01' AS Date))
GO
INSERT [dbo].[Avion] ([NombreAvion], [Modelo], [Capacidad], [AñoConstruccion]) VALUES (2, N'Airbus A380', 853, CAST(N'2005-01-01' AS Date))
GO
INSERT [dbo].[Avion] ([NombreAvion], [Modelo], [Capacidad], [AñoConstruccion]) VALUES (3, N'Boeing 737', 230, CAST(N'1968-01-01' AS Date))
GO
INSERT [dbo].[Avion] ([NombreAvion], [Modelo], [Capacidad], [AñoConstruccion]) VALUES (4, N'Embraer E190', 114, CAST(N'2002-01-01' AS Date))
GO
INSERT [dbo].[Avion] ([NombreAvion], [Modelo], [Capacidad], [AñoConstruccion]) VALUES (5, N'Cessna 172', 210, CAST(N'1955-01-01' AS Date))
GO
INSERT [dbo].[Avion] ([NombreAvion], [Modelo], [Capacidad], [AñoConstruccion]) VALUES (6, N'Bombardier Global 6000', 120, CAST(N'2006-01-01' AS Date))
GO
INSERT [dbo].[Avion] ([NombreAvion], [Modelo], [Capacidad], [AñoConstruccion]) VALUES (7, N'Airbus A320', 240, CAST(N'1988-01-01' AS Date))
GO
INSERT [dbo].[Avion] ([NombreAvion], [Modelo], [Capacidad], [AñoConstruccion]) VALUES (8, N'Gulfstream G650', 18, CAST(N'2012-01-01' AS Date))
GO
INSERT [dbo].[Avion] ([NombreAvion], [Modelo], [Capacidad], [AñoConstruccion]) VALUES (9, N'Boeing 777', 550, CAST(N'1994-01-01' AS Date))
GO
INSERT [dbo].[Avion] ([NombreAvion], [Modelo], [Capacidad], [AñoConstruccion]) VALUES (10, N'Cessna Citation X', 190, CAST(N'1996-01-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Avion] OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 
GO
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria]) VALUES (1, N'Azafata')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria]) VALUES (2, N'Azafato')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria]) VALUES (3, N'Mecánico')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria]) VALUES (4, N'Ayudante de Cabina')
GO
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoriaAsientos] ON 
GO
INSERT [dbo].[CategoriaAsientos] ([IdCategoriaAsiento], [NombreCategoria]) VALUES (1, N'Business')
GO
INSERT [dbo].[CategoriaAsientos] ([IdCategoriaAsiento], [NombreCategoria]) VALUES (2, N'Turista')
GO
INSERT [dbo].[CategoriaAsientos] ([IdCategoriaAsiento], [NombreCategoria]) VALUES (3, N'Primera Clase')
GO
INSERT [dbo].[CategoriaAsientos] ([IdCategoriaAsiento], [NombreCategoria]) VALUES (4, N'Económica')
GO
INSERT [dbo].[CategoriaAsientos] ([IdCategoriaAsiento], [NombreCategoria]) VALUES (5, N'Premium Business')
GO
SET IDENTITY_INSERT [dbo].[CategoriaAsientos] OFF
GO
SET IDENTITY_INSERT [dbo].[Ciudad] ON 
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (1, N'Nueva York')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (2, N'Los Ángeles')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (3, N'Chicago')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (4, N'Houston')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (5, N'Miami')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (6, N'San Francisco')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (7, N'Las Vegas')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (8, N'Boston')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (9, N'Dallas')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (10, N'Seattle')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (11, N'Atlanta')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (12, N'Denver')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (13, N'Phoenix')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (14, N'Philadelphia')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (15, N'San Diego')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (16, N'New Orleans')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (17, N'Austin')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (18, N'Nashville')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (19, N'Portland')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (20, N'Detroit')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (21, N'Madrid')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [NombreCiudad]) VALUES (22, N'Barcelona')
GO
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
GO
SET IDENTITY_INSERT [dbo].[ConfiguracionVuelo] ON 
GO
INSERT [dbo].[ConfiguracionVuelo] ([IdConfiVuelo], [FK_IdCategoriaAsiento], [FK_CodigoVuelo], [FilaFinal], [FilaInicial], [Precio]) VALUES (7, 3, 5, N'10A       ', N'1A        ', CAST(49.99 AS Decimal(6, 2)))
GO
INSERT [dbo].[ConfiguracionVuelo] ([IdConfiVuelo], [FK_IdCategoriaAsiento], [FK_CodigoVuelo], [FilaFinal], [FilaInicial], [Precio]) VALUES (8, 1, 5, N'23B       ', N'1B        ', CAST(39.99 AS Decimal(6, 2)))
GO
INSERT [dbo].[ConfiguracionVuelo] ([IdConfiVuelo], [FK_IdCategoriaAsiento], [FK_CodigoVuelo], [FilaFinal], [FilaInicial], [Precio]) VALUES (9, 2, 5, N'23C       ', N'1C        ', CAST(31.99 AS Decimal(6, 2)))
GO
SET IDENTITY_INSERT [dbo].[ConfiguracionVuelo] OFF
GO
SET IDENTITY_INSERT [dbo].[DatosPersonales] ON 
GO
INSERT [dbo].[DatosPersonales] ([IdPersonal], [Nombre], [Apellido], [NIF]) VALUES (1, N'Juan', N'González', N'12345678A ')
GO
INSERT [dbo].[DatosPersonales] ([IdPersonal], [Nombre], [Apellido], [NIF]) VALUES (2, N'María', N'López', N'98765432B ')
GO
INSERT [dbo].[DatosPersonales] ([IdPersonal], [Nombre], [Apellido], [NIF]) VALUES (3, N'Pedro', N'Martínez', N'54321678C ')
GO
INSERT [dbo].[DatosPersonales] ([IdPersonal], [Nombre], [Apellido], [NIF]) VALUES (4, N'Ana', N'Rodríguez', N'87654321D ')
GO
INSERT [dbo].[DatosPersonales] ([IdPersonal], [Nombre], [Apellido], [NIF]) VALUES (5, N'Carlos', N'Fernández', N'65432187E ')
GO
INSERT [dbo].[DatosPersonales] ([IdPersonal], [Nombre], [Apellido], [NIF]) VALUES (6, N'Sofía', N'Pérez', N'43218765F ')
GO
INSERT [dbo].[DatosPersonales] ([IdPersonal], [Nombre], [Apellido], [NIF]) VALUES (7, N'Luis', N'Sánchez', N'76543218G ')
GO
INSERT [dbo].[DatosPersonales] ([IdPersonal], [Nombre], [Apellido], [NIF]) VALUES (8, N'Laura', N'Gómez', N'21876543H ')
GO
INSERT [dbo].[DatosPersonales] ([IdPersonal], [Nombre], [Apellido], [NIF]) VALUES (9, N'José', N'Ramírez', N'32187654I ')
GO
INSERT [dbo].[DatosPersonales] ([IdPersonal], [Nombre], [Apellido], [NIF]) VALUES (10, N'Isabel', N'Torres', N'65432187J ')
GO
SET IDENTITY_INSERT [dbo].[DatosPersonales] OFF
GO
SET IDENTITY_INSERT [dbo].[Pasajero] ON 
GO
INSERT [dbo].[Pasajero] ([IdPasajero], [FK_CodigoVuelo], [NIF/PASSPORT], [Nombre], [Apellido], [FechaReserva], [NumeroAsiento]) VALUES (1, 5, N'12345678A   ', N'Juan', N'González', CAST(N'2023-08-20T00:00:00.000' AS DateTime), N'12A  ')
GO
INSERT [dbo].[Pasajero] ([IdPasajero], [FK_CodigoVuelo], [NIF/PASSPORT], [Nombre], [Apellido], [FechaReserva], [NumeroAsiento]) VALUES (2, 5, N'98765432B   ', N'María', N'López', CAST(N'2023-09-21T00:00:00.000' AS DateTime), N'7B   ')
GO
INSERT [dbo].[Pasajero] ([IdPasajero], [FK_CodigoVuelo], [NIF/PASSPORT], [Nombre], [Apellido], [FechaReserva], [NumeroAsiento]) VALUES (3, 5, N'54321678C   ', N'Pedro', N'Martínez', CAST(N'2023-08-22T00:00:00.000' AS DateTime), N'18C  ')
GO
INSERT [dbo].[Pasajero] ([IdPasajero], [FK_CodigoVuelo], [NIF/PASSPORT], [Nombre], [Apellido], [FechaReserva], [NumeroAsiento]) VALUES (4, 5, N'87654321D   ', N'Ana', N'Rodríguez', CAST(N'2023-07-23T00:00:00.000' AS DateTime), N'4B   ')
GO
INSERT [dbo].[Pasajero] ([IdPasajero], [FK_CodigoVuelo], [NIF/PASSPORT], [Nombre], [Apellido], [FechaReserva], [NumeroAsiento]) VALUES (5, 5, N'65432187E   ', N'Carlos', N'Fernández', CAST(N'2023-09-24T00:00:00.000' AS DateTime), N'15A  ')
GO
INSERT [dbo].[Pasajero] ([IdPasajero], [FK_CodigoVuelo], [NIF/PASSPORT], [Nombre], [Apellido], [FechaReserva], [NumeroAsiento]) VALUES (6, 5, N'43218765F   ', N'Sofía', N'Pérez', CAST(N'2023-10-01T00:00:00.000' AS DateTime), N'9A   ')
GO
INSERT [dbo].[Pasajero] ([IdPasajero], [FK_CodigoVuelo], [NIF/PASSPORT], [Nombre], [Apellido], [FechaReserva], [NumeroAsiento]) VALUES (7, 5, N'76543218G   ', N'Luis', N'Sánchez', CAST(N'2023-10-02T00:00:00.000' AS DateTime), N'23B  ')
GO
INSERT [dbo].[Pasajero] ([IdPasajero], [FK_CodigoVuelo], [NIF/PASSPORT], [Nombre], [Apellido], [FechaReserva], [NumeroAsiento]) VALUES (8, 5, N'21876543H   ', N'Laura', N'Gómez', CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'3C   ')
GO
INSERT [dbo].[Pasajero] ([IdPasajero], [FK_CodigoVuelo], [NIF/PASSPORT], [Nombre], [Apellido], [FechaReserva], [NumeroAsiento]) VALUES (9, 5, N'32187654I   ', N'José', N'Ramírez', CAST(N'2023-10-04T00:00:00.000' AS DateTime), N' 10A ')
GO
INSERT [dbo].[Pasajero] ([IdPasajero], [FK_CodigoVuelo], [NIF/PASSPORT], [Nombre], [Apellido], [FechaReserva], [NumeroAsiento]) VALUES (10, 5, N'65432187J   ', N'Isabel', N'Torres', CAST(N'2023-10-05T00:00:00.000' AS DateTime), N'5B   ')
GO
SET IDENTITY_INSERT [dbo].[Pasajero] OFF
GO
SET IDENTITY_INSERT [dbo].[Piloto] ON 
GO
INSERT [dbo].[Piloto] ([IdPiloto], [FK_IdPersonal], [HaceNacional], [HaceInternacional], [HaceIntercontinental]) VALUES (1, 1, 1, 1, 0)
GO
INSERT [dbo].[Piloto] ([IdPiloto], [FK_IdPersonal], [HaceNacional], [HaceInternacional], [HaceIntercontinental]) VALUES (2, 2, 1, 1, 1)
GO
INSERT [dbo].[Piloto] ([IdPiloto], [FK_IdPersonal], [HaceNacional], [HaceInternacional], [HaceIntercontinental]) VALUES (3, 3, 1, 0, 0)
GO
INSERT [dbo].[Piloto] ([IdPiloto], [FK_IdPersonal], [HaceNacional], [HaceInternacional], [HaceIntercontinental]) VALUES (4, 4, 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Piloto] OFF
GO
SET IDENTITY_INSERT [dbo].[Vuelo] ON 
GO
INSERT [dbo].[Vuelo] ([CodigoVuelo], [FK_NombreAvion], [Fecha], [FK_Origen], [FK_Destino], [FK_IdPiloto], [FK_IdCopiloto], [DuracionMin]) VALUES (5, 1, CAST(N'2023-10-23' AS Date), 2, 3, 1, 2, 40)
GO
INSERT [dbo].[Vuelo] ([CodigoVuelo], [FK_NombreAvion], [Fecha], [FK_Origen], [FK_Destino], [FK_IdPiloto], [FK_IdCopiloto], [DuracionMin]) VALUES (7, 9, CAST(N'2023-10-29' AS Date), 21, 22, 3, 4, 120)
GO
SET IDENTITY_INSERT [dbo].[Vuelo] OFF
GO
INSERT [dbo].[VueloAuxiliar] ([FK_IdAuxiliar], [FK_CodigoVuelo]) VALUES (1, 5)
GO
INSERT [dbo].[VueloAuxiliar] ([FK_IdAuxiliar], [FK_CodigoVuelo]) VALUES (2, 5)
GO
INSERT [dbo].[VueloAuxiliar] ([FK_IdAuxiliar], [FK_CodigoVuelo]) VALUES (3, 5)
GO
INSERT [dbo].[VueloAuxiliar] ([FK_IdAuxiliar], [FK_CodigoVuelo]) VALUES (4, 5)
GO
ALTER TABLE [dbo].[Auxiliar]  WITH CHECK ADD  CONSTRAINT [FK_Auxiliar_Categoria] FOREIGN KEY([FK_IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Auxiliar] CHECK CONSTRAINT [FK_Auxiliar_Categoria]
GO
ALTER TABLE [dbo].[Auxiliar]  WITH CHECK ADD  CONSTRAINT [FK_Auxiliar_DatosPersonales] FOREIGN KEY([FK_IdPersonal])
REFERENCES [dbo].[DatosPersonales] ([IdPersonal])
GO
ALTER TABLE [dbo].[Auxiliar] CHECK CONSTRAINT [FK_Auxiliar_DatosPersonales]
GO
ALTER TABLE [dbo].[ConfiguracionVuelo]  WITH CHECK ADD  CONSTRAINT [FK_ConfiguracionVuelo_CategoriaAsientos] FOREIGN KEY([FK_IdCategoriaAsiento])
REFERENCES [dbo].[CategoriaAsientos] ([IdCategoriaAsiento])
GO
ALTER TABLE [dbo].[ConfiguracionVuelo] CHECK CONSTRAINT [FK_ConfiguracionVuelo_CategoriaAsientos]
GO
ALTER TABLE [dbo].[ConfiguracionVuelo]  WITH CHECK ADD  CONSTRAINT [FK_ConfiguracionVuelo_Vuelo1] FOREIGN KEY([FK_CodigoVuelo])
REFERENCES [dbo].[Vuelo] ([CodigoVuelo])
GO
ALTER TABLE [dbo].[ConfiguracionVuelo] CHECK CONSTRAINT [FK_ConfiguracionVuelo_Vuelo1]
GO
ALTER TABLE [dbo].[Pasajero]  WITH CHECK ADD  CONSTRAINT [FK_Pasajero_Vuelo] FOREIGN KEY([FK_CodigoVuelo])
REFERENCES [dbo].[Vuelo] ([CodigoVuelo])
GO
ALTER TABLE [dbo].[Pasajero] CHECK CONSTRAINT [FK_Pasajero_Vuelo]
GO
ALTER TABLE [dbo].[Piloto]  WITH CHECK ADD  CONSTRAINT [FK_Piloto_DatosPersonales] FOREIGN KEY([FK_IdPersonal])
REFERENCES [dbo].[DatosPersonales] ([IdPersonal])
GO
ALTER TABLE [dbo].[Piloto] CHECK CONSTRAINT [FK_Piloto_DatosPersonales]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelo_Avion] FOREIGN KEY([FK_NombreAvion])
REFERENCES [dbo].[Avion] ([NombreAvion])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelo_Avion]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelo_Ciudad] FOREIGN KEY([FK_Origen])
REFERENCES [dbo].[Ciudad] ([IdCiudad])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelo_Ciudad]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelo_Ciudad1] FOREIGN KEY([FK_Destino])
REFERENCES [dbo].[Ciudad] ([IdCiudad])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelo_Ciudad1]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelo_Piloto] FOREIGN KEY([FK_IdPiloto])
REFERENCES [dbo].[Piloto] ([IdPiloto])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelo_Piloto]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelo_Piloto1] FOREIGN KEY([FK_IdCopiloto])
REFERENCES [dbo].[Piloto] ([IdPiloto])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelo_Piloto1]
GO
ALTER TABLE [dbo].[VueloAuxiliar]  WITH CHECK ADD  CONSTRAINT [FK_VueloAuxiliar_Auxiliar] FOREIGN KEY([FK_IdAuxiliar])
REFERENCES [dbo].[Auxiliar] ([IdAuxiliar])
GO
ALTER TABLE [dbo].[VueloAuxiliar] CHECK CONSTRAINT [FK_VueloAuxiliar_Auxiliar]
GO
ALTER TABLE [dbo].[VueloAuxiliar]  WITH CHECK ADD  CONSTRAINT [FK_VueloAuxiliar_Vuelo] FOREIGN KEY([FK_CodigoVuelo])
REFERENCES [dbo].[Vuelo] ([CodigoVuelo])
GO
ALTER TABLE [dbo].[VueloAuxiliar] CHECK CONSTRAINT [FK_VueloAuxiliar_Vuelo]
GO
