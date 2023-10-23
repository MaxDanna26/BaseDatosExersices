USE DannaEmployees
GO

-- 00- Num. de emps de UN dept concreto (por su id)

CREATE FUNCTION NumEmpleados(@id INT)
RETURNS INT
AS
BEGIN 
DECLARE @resultado INT;
SET @resultado = (SELECT COUNT(*) FROM employees WHERE department_id = @id)
RETURN @resultado
END

SELECT dbo.NumEmpleados(6)

-- 01- Lista de depts con el num. de sus emps (usandoa la función 00)

SELECT departments.department_name,dbo.NumEmpleados(departments.department_id) 
AS NumeroDeEmpleados 
FROM departments 

-- 1- Función NombreDepartamento
-- recibe idDept, devuelve Nombre del dept
ALTER FUNCTION NomDepartamento(@id INT)
RETURNS VARCHAR(30)
AS
BEGIN 
DECLARE @resultado VARCHAR(30);
SET @resultado = (SELECT department_name FROM departments WHERE department_id = @id)
RETURN @resultado
END

SELECT dbo.NomDepartamento(6)

 

-- 2- Función NumEmpsPosteriorA <fecha contratación>
-- recibe fechaContratación, devuelve num de emps
ALTER FUNCTION NumEmpsPosteriorA(@data date)
RETURNS INT
AS
BEGIN 
	DECLARE @resultado INT;
	SET @resultado = (SELECT Count(*) 
	FROM employees WHERE hire_date > @data)
	RETURN @resultado
END

SELECT dbo.NumEmpsPosteriorA('2000-10-23')
 

-- 3- Función NumEmpsCiudad 

-- recibe nombre ciudad, devuelve num de emps en esta ciudad

ALTER FUNCTION NumEmpsCiudad(@Ciudad varchar(20))
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

SELECT dbo.NumEmpsCiudad('Oxford')