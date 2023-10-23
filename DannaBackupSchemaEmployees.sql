USE [DannaEmployees]
GO
/****** Object:  UserDefinedFunction [dbo].[NomDepartamento]    Script Date: 23/10/2023 19:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[NomDepartamento](@id INT)
RETURNS VARCHAR(20)
AS
BEGIN 
DECLARE @resultado VARCHAR(20);
SET @resultado = (SELECT departments.department_name FROM departments WHERE department_id = @id)
RETURN @resultado
END
GO
/****** Object:  UserDefinedFunction [dbo].[NumEmpleados]    Script Date: 23/10/2023 19:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[NumEmpleados](@id INT)
RETURNS INT
AS
BEGIN 
DECLARE @resultado INT;
SET @resultado = (SELECT COUNT(*) FROM employees WHERE department_id = @id)
RETURN @resultado
END
GO
/****** Object:  UserDefinedFunction [dbo].[NumEmpsCiudad]    Script Date: 23/10/2023 19:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[NumEmpsCiudad](@Ciudad varchar(20))
RETURNS INT
AS
BEGIN 
DECLARE @resultado INT;
SET @resultado = (
	SELECT Count(*)
	FROM employees E
		INNER JOIN departments D
		ON E.department_id = D.department_id
		INNER JOIN locations L
	ON D.location_id = L.location_id
	WHERE L.city = @Ciudad
)
RETURN @resultado
END
GO
/****** Object:  UserDefinedFunction [dbo].[NumEmpsPosteriorA]    Script Date: 23/10/2023 19:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[NumEmpsPosteriorA](@data date)
RETURNS INT
AS
BEGIN 
	DECLARE @resultado INT;
	SET @resultado = (SELECT Count(*) 
	FROM employees WHERE hire_date > @data)
	RETURN @resultado
END
GO
/****** Object:  Table [dbo].[countries]    Script Date: 23/10/2023 19:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[country_id] [char](2) NOT NULL,
	[country_name] [varchar](40) NULL,
	[region_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 23/10/2023 19:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[department_name] [varchar](30) NOT NULL,
	[location_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dependents]    Script Date: 23/10/2023 19:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dependents](
	[dependent_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[relationship] [varchar](25) NOT NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dependent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 23/10/2023 19:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](20) NULL,
	[last_name] [varchar](25) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone_number] [varchar](20) NULL,
	[hire_date] [date] NOT NULL,
	[job_id] [int] NOT NULL,
	[salary] [decimal](8, 2) NOT NULL,
	[manager_id] [int] NULL,
	[department_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 23/10/2023 19:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs](
	[job_id] [int] IDENTITY(1,1) NOT NULL,
	[job_title] [varchar](35) NOT NULL,
	[min_salary] [decimal](8, 2) NULL,
	[max_salary] [decimal](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locations]    Script Date: 23/10/2023 19:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locations](
	[location_id] [int] IDENTITY(1,1) NOT NULL,
	[street_address] [varchar](40) NULL,
	[postal_code] [varchar](12) NULL,
	[city] [varchar](30) NOT NULL,
	[state_province] [varchar](25) NULL,
	[country_id] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regions]    Script Date: 23/10/2023 19:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regions](
	[region_id] [int] IDENTITY(1,1) NOT NULL,
	[region_name] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[countries] ADD  DEFAULT (NULL) FOR [country_name]
GO
ALTER TABLE [dbo].[departments] ADD  DEFAULT (NULL) FOR [location_id]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (NULL) FOR [first_name]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (NULL) FOR [phone_number]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (NULL) FOR [manager_id]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (NULL) FOR [department_id]
GO
ALTER TABLE [dbo].[jobs] ADD  DEFAULT (NULL) FOR [min_salary]
GO
ALTER TABLE [dbo].[jobs] ADD  DEFAULT (NULL) FOR [max_salary]
GO
ALTER TABLE [dbo].[locations] ADD  DEFAULT (NULL) FOR [street_address]
GO
ALTER TABLE [dbo].[locations] ADD  DEFAULT (NULL) FOR [postal_code]
GO
ALTER TABLE [dbo].[locations] ADD  DEFAULT (NULL) FOR [state_province]
GO
ALTER TABLE [dbo].[regions] ADD  DEFAULT (NULL) FOR [region_name]
GO
ALTER TABLE [dbo].[countries]  WITH CHECK ADD FOREIGN KEY([region_id])
REFERENCES [dbo].[regions] ([region_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[departments]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[locations] ([location_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dependents]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([employee_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([department_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([job_id])
REFERENCES [dbo].[jobs] ([job_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([manager_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[locations]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[countries] ([country_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
