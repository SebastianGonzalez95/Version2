--Ordenes


--Creación o actualización de la vista creada para Ordenes

alter view imosOrdenes as
(
 select distinct
 IPRO.proyectoCPRJ
,PROa.ID
,PROa.TYPE
,PROa.NAME
,PROa.COMM
,PROa.ARTICLENO
,PROa.PROGRAM
,PROa.DATECREATE
,PROa.CMS_PRICE
 from [Challenger_03].[dbo].[PROADMIN] PROa
 inner join [Challenger_03].[dbo].[imosProyectos] IPRO
 on IPRO.proyectoCPRJ = left(PROa.name,9)
 where PROa.TYPE = '173'
 and LEN(PROa.ARTICLENO) <> 0


);


--Consulta vista imosOrdenes

 --select * from  [Challenger_03].[dbo].[imosOrdenes]
