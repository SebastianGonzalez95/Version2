--Actualización de la vista creada para módulos

create or alter view imosModulos as


with imosModulos_1
as
(
select distinct
[PROJECTID] = left(CMSc.PROJECTID,9)
,IOrd.ARTICLENO
,IOrd.COMM
,IOrd.NAME DescPro
,CMSc.ORDERID
,CMSc.ARTICLEID
,CMSc.NAME
,IDBi.CHECKSUM
,IDBi.POSSTR
,IDBi.WEIGHT

from [Challenger_03].[dbo].[CMSCALC] CMSc
inner join [Challenger_03].[dbo].[IDBINFO] IDBi 
on IDBi.ORDERID = CMSc.ORDERID 
inner join [Challenger_03].[dbo].[imosOrdenes] IOrd
on IDBi.ORDERID = IOrd.NAME 
and IDBi.ID = CMSc.ARTICLEID 
and IDBi.CPID = CMSc.NAME
where len(ARTICLEID) <> 0
and ARTICLEID = PARTID
),--select distinct * from imosModulos_1


imosModulos_2
as(

select distinct 
*
,NAME_art = (select top 1 NAME from [Challenger_03].[dbo].[articles] ARTi where ARTi.NAME = IMOS_mod.name)
,DESCRIPT_1 = (select top 1 DESCRIPT_1 from [Challenger_03].[dbo].[articles] ARTi where ARTi.NAME = IMOS_mod.name)
,SIZEX_REAL = (select top 1 SIZEX_REAL from [Challenger_03].[dbo].[articles] ARTi where ARTi.NAME = IMOS_mod.name)
,SIZEY_REAL = (select top 1 SIZEY_REAL from [Challenger_03].[dbo].[articles] ARTi where ARTi.NAME = IMOS_mod.name)
,SIZEZ_REAL = (select top 1 SIZEZ_REAL from [Challenger_03].[dbo].[articles] ARTi where ARTi.NAME = IMOS_mod.name)
,INFO_1 = (select top 1 INFO_1 from [Challenger_03].[dbo].[articles] ARTi where ARTi.NAME = IMOS_mod.name)
,INFO_2 = (select top 1 INFO_2 from [Challenger_03].[dbo].[articles] ARTi where ARTi.NAME = IMOS_mod.name)
,INFO_3 = (select top 1 INFO_3 from [Challenger_03].[dbo].[articles] ARTi where ARTi.NAME = IMOS_mod.name)
,INFO_5 = (select top 1 INFO_5 from [Challenger_03].[dbo].[articles] ARTi where ARTi.NAME = IMOS_mod.name)
,INFO_11 = (select top 1 INFO_11 from [Challenger_03].[dbo].[articles] ARTi where ARTi.NAME = IMOS_mod.name)
,DATUM = (select top 1 DATUM from [Challenger_03].[dbo].[articles] ARTi where ARTi.NAME = IMOS_mod.name)
,DATE_LASTCHANGE = (select top 1 DATE_LASTCHANGE from [Challenger_03].[dbo].[articles] ARTi where ARTi.NAME = IMOS_mod.name)
from imosModulos_1 IMOS_mod

)

select * from imosModulos_2


--Consulta vista imosModulos 

--select distinct * from [Challenger_03].[dbo].[imosModulos] 
