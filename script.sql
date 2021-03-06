USE [Centro Medico]
GO
/****** Object:  UserDefinedDataType [dbo].[historia]    Script Date: 12/3/2021 00:09:30 ******/
CREATE TYPE [dbo].[historia] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[medico]    Script Date: 12/3/2021 00:09:30 ******/
CREATE TYPE [dbo].[medico] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[observacion]    Script Date: 12/3/2021 00:09:30 ******/
CREATE TYPE [dbo].[observacion] FROM [varchar](1000) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[paciente]    Script Date: 12/3/2021 00:09:30 ******/
CREATE TYPE [dbo].[paciente] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[turno]    Script Date: 12/3/2021 00:09:30 ******/
CREATE TYPE [dbo].[turno] FROM [int] NOT NULL
GO
/****** Object:  Table [dbo].[Concepto]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concepto](
	[idConcepto] [tinyint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idConcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[especialidad] [varchar](50) NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historia]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historia](
	[idHistoria] [dbo].[historia] IDENTITY(1,1) NOT NULL,
	[fechaHistoria] [datetime] NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK_historia] PRIMARY KEY CLUSTERED 
(
	[idHistoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoriaPaciente]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoriaPaciente](
	[idMedico] [dbo].[medico] NOT NULL,
	[idPaciente] [int] NOT NULL,
	[idHistoria] [dbo].[historia] NOT NULL,
 CONSTRAINT [PK_HistoriaPaciente] PRIMARY KEY CLUSTERED 
(
	[idHistoria] ASC,
	[idPaciente] ASC,
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[idMedico] [dbo].[medico] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicoEspecialidad]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicoEspecialidad](
	[idMedico] [dbo].[medico] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
	[descripcion] [varchar](500) NULL,
 CONSTRAINT [PK_MedicoEspecialidad] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC,
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[idPaciente] [dbo].[paciente] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[fNacimiento] [date] NOT NULL,
	[domicilio] [varchar](50) NULL,
	[idPais] [char](3) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](30) NULL,
	[observacion] [dbo].[observacion] NULL,
	[dni] [varchar](20) NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoPaciente]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoPaciente](
	[idPago] [int] NOT NULL,
	[idPaciente] [int] NOT NULL,
	[idTurno] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC,
	[idPaciente] ASC,
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[concepto] [tinyint] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[monto] [money] NOT NULL,
	[estado] [tinyint] NOT NULL,
	[observacion] [varchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[idPais] [char](3) NOT NULL,
	[pais] [varchar](50) NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabla1]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabla1](
	[col1] [int] IDENTITY(1,1) NOT NULL,
	[col2] [int] NULL,
 CONSTRAINT [PK_tabla1] PRIMARY KEY CLUSTERED 
(
	[col1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[idTurno] [dbo].[turno] IDENTITY(1,1) NOT NULL,
	[fechaTurno] [datetime] NULL,
	[estado] [smallint] NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnoEstado]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnoEstado](
	[idestado] [smallint] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TurnoEstado] PRIMARY KEY CLUSTERED 
(
	[idestado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnoPaciente]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnoPaciente](
	[idTurno] [int] NOT NULL,
	[idPaciente] [int] NOT NULL,
	[idMedico] [dbo].[medico] NOT NULL,
 CONSTRAINT [PK_TurnoPaciente] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC,
	[idPaciente] ASC,
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 

INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion], [dni]) VALUES (2, N'agustin', N'landriel', CAST(N'1900-01-01' AS Date), N'ayacucho 21', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion], [dni]) VALUES (3, N'agustin', N'landriel', CAST(N'1900-01-01' AS Date), N'lujan 978', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion], [dni]) VALUES (4, N'agustin', N'landriel', CAST(N'1900-01-01' AS Date), N'lujan 978', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion], [dni]) VALUES (7, N'mati', N'perez', CAST(N'1900-01-01' AS Date), N'lujan 978', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion], [dni]) VALUES (9, N'mati', N'perez', CAST(N'1900-01-01' AS Date), N'lujan 978', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion], [dni]) VALUES (21, N'Jorge', N'Lopez', CAST(N'2018-03-05' AS Date), N'calle 1', N'PER', N' ', N'jorgelopez@hotmail.com', N' ', N'42.232.609')
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion], [dni]) VALUES (22, N'Agustin', N'Lopez', CAST(N'2018-03-05' AS Date), N'calle 1', N'PER', N' ', N'jorgelopez@hotmail.com', N' ', N'42534349')
SET IDENTITY_INSERT [dbo].[Paciente] OFF
GO
SET IDENTITY_INSERT [dbo].[tabla1] ON 

INSERT [dbo].[tabla1] ([col1], [col2]) VALUES (5, 1)
INSERT [dbo].[tabla1] ([col1], [col2]) VALUES (6, 1)
INSERT [dbo].[tabla1] ([col1], [col2]) VALUES (7, 1)
INSERT [dbo].[tabla1] ([col1], [col2]) VALUES (8, 1)
INSERT [dbo].[tabla1] ([col1], [col2]) VALUES (9, 1)
INSERT [dbo].[tabla1] ([col1], [col2]) VALUES (10, 1)
INSERT [dbo].[tabla1] ([col1], [col2]) VALUES (11, 1)
INSERT [dbo].[tabla1] ([col1], [col2]) VALUES (12, 1)
INSERT [dbo].[tabla1] ([col1], [col2]) VALUES (13, 1)
INSERT [dbo].[tabla1] ([col1], [col2]) VALUES (14, 1)
INSERT [dbo].[tabla1] ([col1], [col2]) VALUES (15, 1)
INSERT [dbo].[tabla1] ([col1], [col2]) VALUES (16, 1)
INSERT [dbo].[tabla1] ([col1], [col2]) VALUES (17, 1)
SET IDENTITY_INSERT [dbo].[tabla1] OFF
GO
SET IDENTITY_INSERT [dbo].[Turno] ON 

INSERT [dbo].[Turno] ([idTurno], [fechaTurno], [estado], [observacion]) VALUES (9, CAST(N'2020-03-02T13:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[Turno] ([idTurno], [fechaTurno], [estado], [observacion]) VALUES (10, CAST(N'2020-03-03T14:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[Turno] ([idTurno], [fechaTurno], [estado], [observacion]) VALUES (11, CAST(N'2020-03-03T15:30:00.000' AS DateTime), 1, N'El paciente ha sido atendido')
INSERT [dbo].[Turno] ([idTurno], [fechaTurno], [estado], [observacion]) VALUES (12, CAST(N'2020-03-05T18:00:00.000' AS DateTime), 2, N'El paciente llamó para cancelar el turno')
SET IDENTITY_INSERT [dbo].[Turno] OFF
GO
INSERT [dbo].[TurnoEstado] ([idestado], [descripcion]) VALUES (0, N'Pendiente')
INSERT [dbo].[TurnoEstado] ([idestado], [descripcion]) VALUES (1, N'Realizado')
INSERT [dbo].[TurnoEstado] ([idestado], [descripcion]) VALUES (2, N'Cancelado')
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_historia] FOREIGN KEY([idHistoria])
REFERENCES [dbo].[historia] ([idHistoria])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_historia]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Medico]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Medico1] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Medico1]
GO
ALTER TABLE [dbo].[MedicoEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_MedicoEspecialidad_Especialidad] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[Especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[MedicoEspecialidad] CHECK CONSTRAINT [FK_MedicoEspecialidad_Especialidad]
GO
ALTER TABLE [dbo].[MedicoEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_MedicoEspecialidad_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[MedicoEspecialidad] CHECK CONSTRAINT [FK_MedicoEspecialidad_Medico]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Pagos] FOREIGN KEY([idPago])
REFERENCES [dbo].[Pagos] ([idPago])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Pagos]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Turno] FOREIGN KEY([idTurno])
REFERENCES [dbo].[Turno] ([idTurno])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Turno]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Concepto] FOREIGN KEY([concepto])
REFERENCES [dbo].[Concepto] ([idConcepto])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_Concepto]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_TurnoEstado] FOREIGN KEY([estado])
REFERENCES [dbo].[TurnoEstado] ([idestado])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FK_Turno_TurnoEstado]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Paciente]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Turno] FOREIGN KEY([idTurno])
REFERENCES [dbo].[Turno] ([idTurno])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Turno]
GO
/****** Object:  StoredProcedure [dbo].[Alta_Paciente]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Alta_Paciente] (	@dni varchar(20),
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



GO
/****** Object:  StoredProcedure [dbo].[SP_PACIENTE]    Script Date: 12/3/2021 00:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[SP_PACIENTE] (	

		@idpaciente int

)

AS

	select nombre,apellido,idpais,observacion,

	(select ps.pais from Pais ps where ps.idpais =	pa.idpais) origen
	
	
	from paciente pa where idpaciente=@idpaciente


GO
