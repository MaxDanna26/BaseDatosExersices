use DannaEmployees
GO

ALTER FUNCTION FechaDeHoy
( 
)
RETURNS date
AS
BEGIN 
	DECLARE @resultado date;
	SET @resultado = getdate();
	RETURN @resultado;
END

SELECT dbo.FechaDeHoy()

-- FUNCION QUE DEVUELVA EL NUMERO DEL DIA

CREATE FUNCTION DayToday
()
RETURNS int
AS
BEGIN 
	DECLARE @resultado int;
	SET @resultado = DAY(getdate());
	RETURN @resultado;
END


SELECT dbo.DayToday()

ALTER FUNCTION ValorDeHoy(@opcion int)
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

SELECT dbo.ValorDeHoy(2)

