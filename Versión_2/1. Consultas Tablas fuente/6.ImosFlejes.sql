--Actualización de la vista creada para los flejes

create or alter view imosFlejes as

with imosFlejes_v1 
as
(

select distinct 
ILam.PROJECTID
,ILam.Modulo
,ILam.CPID
,ILam.KMS
,ILam.BESTELLUNG Cod_Art
,Ilam.BARCODE
,Ilam.TEXT_1
,Ilam.ARTICLENO
,Ilam.INFO_1
,Ilam.POSSTR
,IDBp.ID
,IDBp.ORDERID
,IDBp.PRFNO
,IDBp.PRFID
,IDBp.PRFNAME
,IDBp.PRFLEN
,IDBp.PRFHGT
,IDBp.PRFTHK
,IDBp.HEIGHT

from [Challenger_03].[dbo].[IDBPRF] IDBp
inner join imosLaminas ILam on 
ILam.ORDERID = IDBp.ORDERID and ILam.ID = IDBp.ID 
where IDBp.PRFID <> 'PRF_00'

), 

imosFlejes_v2 as 
(

select distinct 
IFle1.*
,Prof.NAME
,Prof.TEXT
,Prof.BESTELLUNG

from imosFlejes_v1 IFle1
inner join PROFIL Prof
on IFle1.PRFID = Prof.NAME

)

SELECT * FROM imosFlejes_v2

--Consulta vista ImosFlejes

--select distinct * from imosFlejes

