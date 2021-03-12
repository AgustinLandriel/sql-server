ALTER PROC SP_PACIENTE (	

		@idpaciente int

)

AS
	/*  
	   -----DECLARACION DE VARIABLES---

	DECLARE @ordenamiento CHAR(1)
	DECLARE @valorOrdenamiento CHAR(1)

	SET @valorOrdenamiento = ISNULL(@ordenamiento,'A')

	print @valorOrdenamiento
	*/

	select nombre,apellido,idpais,observacion,

	(select ps.pais from Pais ps where ps.idpais= pa.idpais) DescPais

	from paciente pa where idpaciente=@idpaciente

	
GO