--Artículos



--Actualización de la vista creada para artículos

alter view imosArticulos AS

with imosModulos_1
as
(

select distinct *
from [Challenger_03].[dbo].[IDBGPL] IDBg 
where exists (select distinct 1 from [Challenger_03].[dbo].[imosModulos] IMod where IDBg.ORDERID = IMod.ORDERID )
),


imosArticulos_1
as
(

select distinct 

 ORDERID
,PARENT_ID
,ARTICLENO = (select distinct top 1 ARTICLENO from [Challenger_03].[dbo].[imosModulos] IMod where Imod.POSSTR = left(IDBg.PARTPOSSTR,3) and Imod.ORDERID = IDBg.ORDERID)
,COMM = (select distinct top 1 comm from [Challenger_03].[dbo].[imosModulos] IMod where Imod.POSSTR = left(IDBg.PARTPOSSTR,3) and Imod.ORDERID = IDBg.ORDERID)
,DescPro = (select distinct top 1 DescPro from [Challenger_03].[dbo].[imosModulos] IMod where Imod.POSSTR = left(IDBg.PARTPOSSTR,3) and Imod.ORDERID = IDBg.ORDERID)
,POSSTR = (select distinct top 1 POSSTR from [Challenger_03].[dbo].[imosModulos] IMod where Imod.POSSTR = left(IDBg.PARTPOSSTR,3) and Imod.ORDERID = IDBg.ORDERID)
,Modulo = (select distinct top 1 name from [Challenger_03].[dbo].[imosModulos] IMod where Imod.POSSTR = left(IDBg.PARTPOSSTR,3) and Imod.ORDERID = IDBg.ORDERID)
,INFO_1 = (select distinct top 1 INFO_1 from [Challenger_03].[dbo].[imosModulos] IMod where Imod.POSSTR = left(IDBg.PARTPOSSTR,3) and Imod.ORDERID = IDBg.ORDERID)
,ID
,CPID
,KMS
,BARCODE
,PARTPOSSTR
,RENDERPMAT
,INFO1
,CNT
,TYP
,MATID
,FLENG
,FWIDTH
,FTHK
,AREA
,PRICE
,NCNO
,INFO2
,INFO5
,CHECKSUM1
,WEIGHT

from imosModulos_1 IDBg 


),--select * from imosArticulos_1 


imosArticulos_2 --Parent
as
(

select distinct 
Text_1 = iif( len(INFO1) <> 0, INFO1 ,'NOT_DATA_FOUND')
,*
from imosArticulos_1
where len(RENDERPMAT) = 0 
),--select * from imosArticulos_2 




imosArticulos_3 --Child
as
(

select distinct 
case when len(INFO1) <> 0 then INFO1
				else isnull((select distinct top 1 Text_1 from imosArticulos_2 IArt_1 where LEFT(IArt_2.PARTPOSSTR,LEN(IArt_1.PARTPOSSTR)) = IArt_1.PARTPOSSTR), 'Tampoco hay info')
end as TEXT_1
,*

from imosArticulos_1 IArt_2
where len(RENDERPMAT) <> 0
)

select 

 [PROJECTID]= left(CMSc.PROJECTID,9)
,IArt_3.ARTICLENO
,IArt_3.DescPro
,IArt_3.COMM
,IArt_3.ORDERID
,IArt_3.Modulo
,IArt_3.INFO_1
,IArt_3.POSSTR
,CMSc.ARTICLEID
,IArt_3.ID
,IArt_3.CPID
,IArt_3.KMS
,IArt_3.TEXT_1
,IArt_3.BARCODE
,IArt_3.PARTPOSSTR
,IArt_3.CNT
,IArt_3.TYP
,IArt_3.MATID
,IArt_3.FLENG
,IArt_3.FWIDTH
,IArt_3.FTHK
,IArt_3.AREA
,IArt_3.PRICE
,IArt_3.NCNO
,IArt_3.INFO2
,IArt_3.INFO5
,IArt_3.CHECKSUM1
,IArt_3.WEIGHT


from imosArticulos_3 IArt_3
inner join CMSCALC CMSc
on IArt_3.ORDERID = CMSc.ORDERID
and IArt_3.ID = CMSc.PARTID

where IArt_3.TEXT_1 <> 'NOT_DATA_FOUND' 
and IArt_3.TEXT_1 <> 'Tampoco hay info'


--Consulta vista imosArticulos

--select distinct * from imosArticulos
