USE [Challenger_03]
GO
/****** Object:  StoredProcedure [dbo].[Exec_imosProyectos_Act]    Script Date: 30/08/2023 2:19:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento almacenado vista ImosOrdenes 

ALTER PROCEDURE [dbo].[Exec_imosProyectos_Act]

AS

begin 

	DECLARE @DynamicSQL nvarchar(max)



	exec 
	(
			'alter view imosProyectos as

			select distinct 
			 [ID] = ID
			,[proyectoCPRJ] = left(NAME,9) 
			,[descripcionproyecto] = COMM 
			,[SOURCE] nombredisenador
			,[nombrequienaprobuena] = null
			,[estadodeaprobacion] = null

			from [Challenger_03].[dbo].[PROADMIN]
			where TYPE = ''1000001''
'
	)

	    EXEC sp_executesql @DynamicSQL
END




--EXEC Exec_imosProyectos_Act


	 --select * from  [Challenger_03].[dbo].[imosProyectos]




	 --poner de nuevo esta línea 

	 			 --and left(COMM,5) = ''Pub. ''