--Creación o actualización de la vista de proyectos

create or alter view imosProyectos as

select distinct 
 [ID] = ID
,[proyectoCPRJ] = left(NAME,9) 
,[descripcionproyecto] = COMM 
,[SOURCE] nombredisenador
,[nombrequienaprobuena] = null
,[fechaaprobacion] = null

from [Challenger_03].[dbo].[PROADMIN]
where TYPE = '1000001'
 and left(COMM,5) = 'Pub. '


--Consulta vista imosProyectos

--select * from [Challenger_03].[dbo].[imosProyectos]