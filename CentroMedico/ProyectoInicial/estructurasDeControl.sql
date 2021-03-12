

declare @idpaciente int

set @idpaciente = 7

if @idpaciente = 7

BEGIN
	select * from Paciente where idpaciente = @idpaciente 
	IF EXISTS (select * from Paciente where idpaciente=2)
		print 'existe'
END



declare @contador int = 0

WHILE @contador <= 10 
BEGIN				

	print @contador
	set @contador=@contador +1
		if @contador = 3
		BREAK

END 

print 'nola'

Declare @valor int
declare @resultado char(10)=' '

set @valor= 20

set @resultado= (CASE WHEN @valor = 10 THEN 'ROJO'
						WHEN @valor = 30 THEN 'RASIN'
						WHEN @valor = 20 THEN ' VERDE '
						END)

print @resultado

--when = cuando


select *,(CASE WHEN estado = 1 THEN 'ROJO' 
				WHEN estado = 2 THEN 'VERDE' 
				WHEN estado =3 THEN 'AZUL' 
					ELSE 'GRIS'
				
				END)	AS COLOR_TURNO from Turno


--TRY CATCH = CONTROL DE ERRORES

BEGIN TRY
	set @contador = 'texto'
END TRY

BEGIN CATCH

	print 'no es posible asignar texto a una variable char'
END CATCH