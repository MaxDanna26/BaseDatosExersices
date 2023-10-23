Use DannaEmployees
Go

SELECT
  first_name + ' ' + last_name AS full_name
FROM employees

SELECT
  first_name + ' ' + last_name + 'y su tel es ' + phone_number AS full_name
FROM employees

SELECT CONCAT(first_name,' ',last_name,'y su tel es ',phone_number) FROM employees


SELECT CONCAT(first_name,' ',last_name,(SELECT ISNULL('y su tel es ' + phone_number,'y telefono no tiene'))) FROM employees

