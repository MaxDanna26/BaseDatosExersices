USE DannaEmployees
GO

-- INSERT 

INSERT INTO countries(country_id,country_name,region_id) VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZW','Zimbabwe',4);

-- para insertar en una tabla NUEVA:
SELECT first_name, last_name INTO dependentBIS
FROM dependents


-- DELETE
DELETE FROM dependentBIS
WHERE first_name LIKE 'S€'

DELETE employees FROM employees E
INNER JOIN departments D
ON E.department_id = D.department_id
WHERE department_name= 'IT'

-- UPDATE

UPDATE employees
SET last_name = 'Trump' 
WHERE first_name = 'Donald'

UPDATE employees
	SET salary = (salary*0.10) + salary
FROM employees E
INNER JOIN departments D
	ON D.department_id = E.department_id
WHERE department_name = 'IT'

-- VISTAS

CREATE VIEW NumEmpleadosPorCiudad
AS 
SELECT L.city AS Ciudad,COUNT(*) AS NumEmp FROM employees E
	LEFT JOIN departments D
ON E.department_id = D.department_id
	INNER JOIN locations L
ON L.location_id = D.location_id
GROUP BY L.city,L.location_id

SELECT * FROM NumEmpleadosPorCiudad

CREATE VIEW EmpleadosMKT
AS 
SELECT first_name, last_name,email
FROM employees

SELECT * FROM EmpleadosMKT


-- STORE PROCEDURE
CREATE PROCEDURE AumentarSalary
AS
BEGIN
	UPDATE employees
	SET salary = (salary*0.10) + salary
END

EXEC AumentarSalary

ALTER PROCEDURE DecrementarSalary
AS
BEGIN
	UPDATE employees
	SET salary =  salary / 1.1
END

EXEC DecrementarSalary

SELECT * FROM employees