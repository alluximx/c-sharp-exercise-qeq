USE [ControlEscolar]
GO
/****** Object:  Table [dbo].[alumno_materia]    Script Date: 11/01/2021 08:28:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alumno_materia](
	[idAlumnoMateria] [int] IDENTITY(1,1) NOT NULL,
	[idAlumno] [int] NOT NULL,
	[idMateria] [int] NOT NULL,
 CONSTRAINT [PK_alumno_materia] PRIMARY KEY CLUSTERED 
(
	[idAlumnoMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[alumnos]    Script Date: 11/01/2021 08:28:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[alumnos](
	[idAlumno] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellidoPaterno] [varchar](50) NOT NULL,
	[apellidoMaterno] [varchar](50) NOT NULL,
	[usuario] [varchar](20) NULL,
	[contrasenia] [varchar](100) NOT NULL,
 CONSTRAINT [PK_alumnos] PRIMARY KEY CLUSTERED 
(
	[idAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[materias]    Script Date: 11/01/2021 08:28:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[materias](
	[idMateria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[costo] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_materias] PRIMARY KEY CLUSTERED 
(
	[idMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[alumno_materia] ON 

INSERT [dbo].[alumno_materia] ([idAlumnoMateria], [idAlumno], [idMateria]) VALUES (22, 20, 8)
INSERT [dbo].[alumno_materia] ([idAlumnoMateria], [idAlumno], [idMateria]) VALUES (23, 20, 9)
SET IDENTITY_INSERT [dbo].[alumno_materia] OFF
SET IDENTITY_INSERT [dbo].[alumnos] ON 

INSERT [dbo].[alumnos] ([idAlumno], [nombre], [apellidoPaterno], [apellidoMaterno], [usuario], [contrasenia]) VALUES (16, N'Margarita', N'Sanchez', N'Valenzuela', N'M.Sanchez.12', N'b50c05773fd9587649654a3761ceece5cc2ca9d16b3583f99e0f7ac3fbfa038e')
INSERT [dbo].[alumnos] ([idAlumno], [nombre], [apellidoPaterno], [apellidoMaterno], [usuario], [contrasenia]) VALUES (17, N'Ricardo', N'Delcid', N'Sanchez', N'R.Delcid.12', N'e7991b389ca3d3b3af255cc57938be1f2c0b4e282137ab40ebf2fae3738b18da')
INSERT [dbo].[alumnos] ([idAlumno], [nombre], [apellidoPaterno], [apellidoMaterno], [usuario], [contrasenia]) VALUES (18, N'Joaquin', N'Urias', N'Sanchez', N'J.Urias.12', N'5065fb9ca95ac79ffc4cfc8b30e99c975bccea5d0e245ddec9b3eefdf86087ac')
INSERT [dbo].[alumnos] ([idAlumno], [nombre], [apellidoPaterno], [apellidoMaterno], [usuario], [contrasenia]) VALUES (19, N'Marcos', N'Kaplan', N'Martinez', N'M.Kaplan.12', N'06c268dbed8c5698392163211206b1a96669978c8d61988da9051caf39e1bfcc')
INSERT [dbo].[alumnos] ([idAlumno], [nombre], [apellidoPaterno], [apellidoMaterno], [usuario], [contrasenia]) VALUES (20, N'Jesus', N'Noris', N'Martinez', N'J.Noris.12', N'7f0e188759d9b20edfddd719ac1e2460befe476659a16c0e695012f382b055ff')
SET IDENTITY_INSERT [dbo].[alumnos] OFF
SET IDENTITY_INSERT [dbo].[materias] ON 

INSERT [dbo].[materias] ([idMateria], [nombre], [costo]) VALUES (7, N'Español', CAST(200 AS Decimal(18, 0)))
INSERT [dbo].[materias] ([idMateria], [nombre], [costo]) VALUES (8, N'Música', CAST(600 AS Decimal(18, 0)))
INSERT [dbo].[materias] ([idMateria], [nombre], [costo]) VALUES (9, N'Física', CAST(500 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[materias] OFF
