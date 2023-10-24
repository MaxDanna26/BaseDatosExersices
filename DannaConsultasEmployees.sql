use DannaEmployees
GO

-- Empleados con salario en un campo sin USAR CONCAT

SELECT first_name + ' ' + last_name + ' ' + CONVERT(varchar(10),salary)
FROM employees
AS EmpConSalario

SELECT first_name + ' ' + last_name + ' ' + CAST(salary AS varchar(10))
FROM employees
AS EmpConSalario

SELECT first_name + ' ' + last_name + STR(salary)
FROM employees
AS EmpConSalario



-- GROUP BY

SELECT COUNT(*) FROM employees
GROUP BY department_id


-- Emps por dept, con el nombre del dept

SELECT department_name,COUNT(*) 
FROM employees E
	INNER JOIN departments D
ON E.department_id = D.department_id
GROUP BY D.department_id,D.department_name

-- Num de empleados por ciudad

SELECT L.city,COUNT(*) FROM employees E
	LEFT JOIN departments D
ON E.department_id = D.department_id
	INNER JOIN locations L
ON L.location_id = D.location_id
GROUP BY L.city,L.location_id

-- media de salarios por dept
SELECT department_id, AVG(E.salary) as Promedio
FROM employees E 
GROUP BY department_id

-- Num emps en cada depto

SELECT department_name,COUNT(*) as NumeroEmpleados
FROM employees E
	INNER JOIN departments D
ON E.department_id = D.department_id
GROUP BY D.department_id,D.department_name

-- Num emps en cada depto que empiecen por S

SELECT department_name,COUNT(*) as NumeroEmpleados
FROM employees E
	INNER JOIN departments D
ON E.department_id = D.department_id
WHERE D.department_name LIKE 'S%'
GROUP BY D.department_id,D.department_name

-- Num emps en cada depto que tienen mas de 3 empleados

SELECT department_name,COUNT(*) as NumeroEmpleados
FROM employees E
	INNER JOIN departments D
ON E.department_id = D.department_id
GROUP BY D.department_id,D.department_name
HAVING COUNT(*) > 3 



