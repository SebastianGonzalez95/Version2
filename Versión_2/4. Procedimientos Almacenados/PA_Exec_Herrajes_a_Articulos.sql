USE [Challenger_03]
GO
/****** Object:  StoredProcedure [dbo].[Exec_Herrajes_a_Articulos]    Script Date: 30/08/2023 2:17:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento almacenado vista ImosOrdenes 


ALTER PROCEDURE [dbo].[Exec_Herrajes_a_Articulos]

AS

BEGIN

INSERT INTO [imosArticulos_Table] 

SELECT * 

FROM [imosPerfileria_table] 

WHERE DescripcionDSCA = 'Pue_LSinRecInf'


DELETE FROM [imosPerfileria_table] WHERE DescripcionDSCA = 'Pue_LSinRecInf'

END
