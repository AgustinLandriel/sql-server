USE [Centro Medico]
GO
/****** Object:  StoredProcedure [dbo].[SP_PACIENTE]    Script Date: 3/3/2021 19:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROC [dbo].[SP_PACIENTE] (	

		@idpaciente int

)

AS

	select nombre,apellido,idpais,observacion,

	(select ps.pais from Pais ps where ps.idpais =	pa.idpais) origen
	
	
	from paciente pa where idpaciente=@idpaciente


