--Actualización de la vista creada para herrajes

create or alter view imosHerrajes as

with imosHerrajes_1
as
(
select distinct 
IDBp.ID,
IDBp.ORDERID,
IMod.DescPro,
IMod.COMM,
IMod.ARTICLENO,
IMod.INFO_1,
IMod.POSSTR,
IMod.NAME,
IDBp.CONID,
IDBp.ASSOCPART,
IDBp.ORDER_ID


from [Challenger_03].[dbo].[IDBPURCH] IDBp
inner join [Challenger_03].[dbo].[CMSCALC] CMSc
on IDBp.ASSOCPART = CMSc.PARTID
and IDBp.ORDERID = CMSc.ORDERID
inner join [Challenger_03].[dbo].[imosModulos] IMod
on IDBp.ORDERID = IMod.ORDERID


),--select distinct * from imosHerrajes_1




imosHerrajes_2
as
(
select distinct


IArt.PROJECTID
,IHer.DescPro
,IHer.COMM
,IArt.ORDERID
,IHer.ARTICLENO
,IHer.ID
,IHer.INFO_1
,IArt.Modulo
,IHer.POSSTR
,IArt.CPID
,IArt.KMS
,IArt.TEXT_1
,IArt.BARCODE
,IHer.CONID
,IHer.ASSOCPART
,IHer.ORDER_ID

from imosHerrajes_1 IHer
inner join [Challenger_03].[dbo].[imosArticulos] IArt 
on IArt.ID = IHer.ASSOCPART
and IArt.ORDERID = IHer.ORDERID
and IArt.POSSTR = IHer.POSSTR


) 


select distinct * from imosHerrajes_2




--Consulta vista imosHerrajes


--select distinct * from imosHerrajes

