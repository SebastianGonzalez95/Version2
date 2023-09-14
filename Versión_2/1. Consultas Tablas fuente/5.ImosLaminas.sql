

--Actualización de la vista creada para laminas

alter view ImosLaminas 

as

(
select distinct 

IArt.PROJECTID
,IArt.ARTICLENO
,IArt.COMM
,IArt.DescPro
,IArt.ORDERID
,IArt.INFO_1
,IArt.Modulo
,IArt.POSSTR
,IArt.ID
,IArt.CPID
,IArt.KMS
,IArt.TEXT_1
,IArt.BARCODE
,Mat_1.NAME
,IArt.MATID
,Mat_1.BESTELLUNG
,Mat_1.COMMENT
,Mat_1.DATUM
,Mat_1.PRODUCER


from [Challenger_03].[dbo].[mat] Mat_1
inner join [Challenger_03].[dbo].[imosArticulos] IArt 
on  Mat_1.NAME = IArt.MATID

)

--Consulta vista ImosLaminas

--select * from ImosLaminas