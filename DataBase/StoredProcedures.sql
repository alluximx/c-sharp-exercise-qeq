USE [ControlEscolar]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAlumno]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteInscripcion]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteMateria]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[GetAlumnoById]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[GetAlumnoMateria]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[GetAlumnos]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[GetMaterias]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[GetMateriasByAlumnoId]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[GetMateriasById]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Inscripcion]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[InsertAlumno]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[InsertInscripcion]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[InsertMateria]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Loginsystem]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[SumCostos]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateAlumno]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateMateria]    Script Date: 11/01/2021 08:27:18 a. m. ******/
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
