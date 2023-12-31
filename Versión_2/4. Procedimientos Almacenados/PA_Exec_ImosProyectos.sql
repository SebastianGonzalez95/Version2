USE [Challenger_03]
GO
/****** Object:  StoredProcedure [dbo].[Exec_ImosProyectos]    Script Date: 30/08/2023 2:17:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento almacenado vista imosProyectos

--Actualización de los proyectos completos, en el campo descripcionproyecto contienen el valor "Pub. "

--Se utiliza la variable @DynamicSQL para almacenar la consulta dinámica y sp_executesql para ejecutarla.

--1. Creación del procedimiento almacenado Exec_ImosProyectos se establece el nombre y el parámetro 

ALTER PROCEDURE [dbo].[Exec_ImosProyectos] (@Pro nvarchar(30) )

AS

--2. Se da apertura al cuerpo del procedimiento 

begin

--3. Se declara la variable @DynamicSQL donde se almacena la consulta final 

	DECLARE @DynamicSQL nvarchar(max)

--4. Se establece la consulta a la vista imosProyectos que determina los proyectos completos.
exec ('

alter view imosProyectos as
select distinct 
 [ID] = ID
,[proyectoCPRJ] = left(NAME,9) 
,[descripcionproyecto] = COMM 
,[SOURCE] nombredisenador
,[nombrequienaprobuena] = null
,[estadodeaprobacion] = null

from [Challenger_03].[dbo].[PROADMIN]
where TYPE = ''1000001''
 and left(COMM,5) = ''Pub. '' 
 and left(NAME,9) =''' + @Pro + '''
 '
)

--5. Se ejecuta el almacenamiento de la consulta dentro de la variable @DynamicSQL

    EXEC sp_executesql @DynamicSQL
END


--6. Comando de ejecución del procedimiento almacenado 

--EXEC Exec_ImosProyectos 'PC0001504'

--7. Consulta a la vista imosProyectos

 --select * from imosProyectos


