USE [master]
GO
/****** Object:  Database [ControlEscolar]    Script Date: 11/01/2021 12:09:11 a. m. ******/
CREATE DATABASE [ControlEscolar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ControlEscolar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ControlEscolar.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ControlEscolar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ControlEscolar_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ControlEscolar] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ControlEscolar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ControlEscolar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ControlEscolar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ControlEscolar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ControlEscolar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ControlEscolar] SET ARITHABORT OFF 
GO
ALTER DATABASE [ControlEscolar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ControlEscolar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ControlEscolar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ControlEscolar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ControlEscolar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ControlEscolar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ControlEscolar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ControlEscolar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ControlEscolar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ControlEscolar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ControlEscolar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ControlEscolar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ControlEscolar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ControlEscolar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ControlEscolar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ControlEscolar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ControlEscolar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ControlEscolar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ControlEscolar] SET  MULTI_USER 
GO
ALTER DATABASE [ControlEscolar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ControlEscolar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ControlEscolar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ControlEscolar] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ControlEscolar] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ControlEscolar]
GO
/****** Object:  Table [dbo].[alumno_materia]    Script Date: 11/01/2021 12:09:11 a. m. ******/
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
/****** Object:  Table [dbo].[alumnos]    Script Date: 11/01/2021 12:09:11 a. m. ******/
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
/****** Object:  Table [dbo].[materias]    Script Date: 11/01/2021 12:09:11 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteAlumno]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	<Elimina el Alumno por el Id>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteAlumno]
	-- Add the parameters for the stored procedure here
	@idAlumno int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE alumnos WHERE idAlumno = @idAlumno
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteInscripcion]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	<Elimina la Iscripcion por el Id>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteInscripcion]
	-- Add the parameters for the stored procedure here
	@idMateria int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE alumno_materia WHERE idMateria = @idMateria
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteMateria]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	<Elimina la Materia por el Id>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteMateria]
	-- Add the parameters for the stored procedure here
	@idMateria int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE materias WHERE idMateria = @idMateria
END

GO
/****** Object:  StoredProcedure [dbo].[GetAlumnoById]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Delcid
-- Create date: 06-Ene-21
-- Description:	Obtiene todos los alumnos
-- =============================================
CREATE PROCEDURE [dbo].[GetAlumnoById] 
	-- Add the parameters for the stored procedure here
	@idAlumno int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM alumnos WHERE idAlumno = @idAlumno
END

GO
/****** Object:  StoredProcedure [dbo].[GetAlumnoMateria]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Delcid
-- Create date: 06-Ene-21
-- Description:	Obtiene todos las materias en las que se inscribio el alumno
-- =============================================
CREATE PROCEDURE [dbo].[GetAlumnoMateria]
	@idAlumno int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT m.nombre, m.costo
	FROM materias m
	INNER JOIN alumno_materia am ON am.idMateria = m.idMateria
	AND am.idAlumno = @idAlumno

	SELECT SUM(costo) AS MontoTotal
	FROM materias
END

GO
/****** Object:  StoredProcedure [dbo].[GetAlumnos]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Delcid
-- Create date: 06-Ene-21
-- Description:	Obtiene todos los alumnos
-- =============================================
CREATE PROCEDURE [dbo].[GetAlumnos] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM alumnos 
END

GO
/****** Object:  StoredProcedure [dbo].[GetMaterias]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Delcid
-- Create date: 06-Ene-21
-- Description:	Obtiene todos las materias
-- =============================================
CREATE PROCEDURE [dbo].[GetMaterias]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM materias 
END

GO
/****** Object:  StoredProcedure [dbo].[GetMateriasByAlumnoId]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMateriasByAlumnoId]
	-- Add the parameters for the stored procedure here
	@idAlumno int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--SUM(m.costo) AS Total 
    -- Insert statements for procedure here
	SELECT m.nombre, m.costo, m.idMateria
	FROM materias m
	JOIN alumno_materia am
		ON am.idMateria = m.idMateria
	JOIN alumnos a 
		ON a.idAlumno = am.idAlumno
	WHERE a.idAlumno = @idAlumno
	 
END

GO
/****** Object:  StoredProcedure [dbo].[GetMateriasById]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Delcid
-- Create date: 06-Ene-21
-- Description:	Obtiene todos las materias
-- =============================================
CREATE PROCEDURE [dbo].[GetMateriasById]
	-- Add the parameters for the stored procedure here
	@idMateria int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM materias WHERE idMateria = @idMateria
END

GO
/****** Object:  StoredProcedure [dbo].[Inscripcion]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Inscripcion]
	-- Add the parameters for the stored procedure here
	@idAlumno int,
	@idMateria int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO alumno_materia VALUES(
		@idAlumno,
		@idMateria
	)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertAlumno]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Delcid
-- Create date: 06-Ene-21
-- Description:	<Inserta un alumno a la base de datos>
-- =============================================
CREATE PROCEDURE [dbo].[InsertAlumno]
	-- Add the parameters for the stored procedure here
	@nombre varchar(50),
	@apellidoPaterno varchar(50),
	@apellidoMaterno varchar(50),
	@usuario varchar(50) = NULL,
	@contrasenia varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @word varchar(50)
	SELECT @word = SUBSTRING(@nombre,1,1) + '.' + @apellidoPaterno + '.' + '12'

    -- Insert statements for procedure here
	INSERT INTO alumnos VALUES(
		@nombre,
		@apellidoPaterno,
		@apellidoMaterno,
		@word,
		@contrasenia
	)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertInscripcion]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Delcid
-- Create date: 06-Ene-21
-- Description:	<Inserta una Inscripcion a la base de datos>
-- =============================================
CREATE PROCEDURE [dbo].[InsertInscripcion]
	-- Add the parameters for the stored procedure here
	@idAlumno int,
	@idMateria int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO alumno_materia VALUES(
		@idAlumno,
		@idMateria
	)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertMateria]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Delcid
-- Create date: 06-Ene-21
-- Description:	<Inserta una Materia a la base de datos>
-- =============================================
CREATE PROCEDURE [dbo].[InsertMateria]
	-- Add the parameters for the stored procedure here
	@nombre varchar(50),
	@costo decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO materias VALUES(
		@nombre,
		@costo
	)
END

GO
/****** Object:  StoredProcedure [dbo].[Loginsystem]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Loginsystem]
	-- Add the parameters for the stored procedure here
	@Usuario varchar(50),
	@Contrasenia varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT * FROM alumnos a
	--WHERE @Usuario = a.usuario
	--AND @Contrasenia = a.contrasenia
	select * from alumnos 
	where @Usuario = usuario 
	and @Contrasenia = contrasenia

END

GO
/****** Object:  StoredProcedure [dbo].[SumCostos]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SumCostos]
	-- Add the parameters for the stored procedure here
	@idAlumno int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM(m.costo) AS Total
	FROM materias m
	JOIN alumno_materia am
		ON am.idMateria = m.idMateria
	JOIN alumnos a 
		ON a.idAlumno = am.idAlumno
	WHERE a.idAlumno = @idAlumno
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateAlumno]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Delcid
-- Create date: 06-Ene-21
-- Description:	<Actualiza un alumno en la base de datos>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateAlumno]
	-- Add the parameters for the stored procedure here
	@idAlumno int,
	@nombre varchar(50),
	@apellidoPaterno varchar(50),
	@apellidoMaterno varchar(50),
	@usuario varchar(50) = null,
	@contrasenia varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE alumnos SET
		nombre = @nombre,
		apellidoPaterno = @apellidoPaterno,
		apellidoMaterno = @apellidoMaterno,
		usuario = ISNULL(@usuario, usuario),
		contrasenia = @contrasenia

	WHERE idAlumno = @idAlumno
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateMateria]    Script Date: 11/01/2021 12:09:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Delcid
-- Create date: 06-Ene-21
-- Description:	<Actualiza una materia en la base de datos>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateMateria]
	-- Add the parameters for the stored procedure here
	@idMateria int,
	@nombre varchar(50),
	@costo decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE materias SET
    -- Insert statements for procedure here
		nombre = @nombre,
		costo = @costo

	WHERE idMateria = @idMateria
END

GO
USE [master]
GO
ALTER DATABASE [ControlEscolar] SET  READ_WRITE 
GO
