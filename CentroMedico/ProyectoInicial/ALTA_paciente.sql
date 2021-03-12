
EXEC Alta_paciente '42534349','Agustin','Lopez','20180305','calle 1','PER',' ','jorgelopez@hotmail.com',' '

alter PROC Alta_Paciente (	@dni varchar(20),
							@nombre varchar (50),
							@apellido varchar(50),
							@fnacimiento varchar(8),
							@domicilio varchar(50),
							@idpais char (3),
							@telefono varchar(20)=' ',
							@email varchar(30),
							@observacion varchar(1000)=' '
	)

as


	IF NOT EXISTS ( SELECT * from paciente where dni = @dni)
BEGIN

	INSERT INTO PACIENTE (dni,nombre,apellido,fnacimiento,domicilio,idpais,telefono,email,observacion)
	VALUES (@dni,@nombre,@apellido,@fnacimiento,@domicilio,@idpais,@telefono,@email,@observacion)

	print 'El paciente ha sido agregado correctamente'
		RETURN
	END

	ELSE
BEGIN
	print 'El usuario ya está agregado'
	RETURN
END



go


select * from Pais