use DannaEmployees
GO

-- Empleados con Nombres comenzados en S y salarios superior a 5000 y menos de 10000
SELECT * FROM employees WHERE first_name LIKE 'S%' AND salary between 5000 and 10000
SELECT * FROM employees WHERE first_name LIKE 'S%' AND salary > 5000 AND salary < 10000

-- Empleados contratados en 1995
SELECT * FROM employees WHERE hire_date >= '1995/01/01' AND hire_date <= '1995/12/31'
SELECT * FROM employees WHERE hire_date BETWEEN '1995/01/01' AND '1995/12/31'
SELECT * FROM employees WHERE YEAR(hire_date) = 1995
SELECT * FROM employees WHERE DATEPART(yy,hire_date) = 1995

-- Empleados contratados en el primer mes de cada quincena
SELECT * FROM employees WHERE Month(hire_date) = 01 OR Month(hire_date) = 04 OR Month(hire_date) = 07 OR Month(hire_date) = 10
SELECT * FROM employees WHERE MONTH(hire_date) in (1,4,7,10)
SELECT * FROM employees WHERE MONTH(hire_date) % 3 = 1 

-- Empleados contratados 25 años antes
SELECT * FROM employees WHERE YEAR(hire_date) < (YEAR(GETDATE())-25)
SELECT * FROM employees WHERE DATEDIFF(year,hire_date,GETDATE())>=25
SELECT * FROM employees WHERE hire_date < '1998/01/01'

-- Utilizacion de funciones
SELECT MAX(salary) as Mayor, MIN(salary) as Minimo, 
SUM(salary) as SumaTotal,AVG(salary) as Promedio, Count(salary) as Contador  FROM employees

-- Contador de empleados por departamento
SELECT COUNT(DISTINCT department_id) FROM employees

-- Empleados que trabajan en el departamento de IT
SELECT COUNT(*) FROM employees
WHERE department_id = 
(SELECT department_id FROM departments 
WHERE department_name = 'IT') 

--Empleados que no tienen jefe
SELECT COUNT(*) FROM employees WHERE manager_id is NULL 
SELECT COUNT(*)-COUNT(manager_id) FROM employees

--Empleados con sus departamentos
SELECT employees.first_name AS 'Nombre',
departments.department_name AS 'Departamento'
FROM employees,departments
WHERE employees.department_id = departments.department_id

--Empleados con su cargo
SELECT employees.first_name AS 'Nombre',
jobs.job_title AS 'Cargo' FROM
employees,jobs WHERE jobs.job_id = employees.job_id

--Empleados con su departamento y que trabajan en Toronto
SELECT employees.first_name AS 'Nombre',
departments.department_name AS 'Departamento',
locations.city AS 'Locacion'
FROM employees,departments,locations
WHERE employees.department_id = departments.department_id
AND departments.location_id = locations.location_id 
AND locations.city = 'Toronto'

