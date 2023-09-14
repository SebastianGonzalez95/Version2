
 --Actualización de la vista creada para Perfileria

create or alter view imosPerfileria as


with imosPerfileria_1
as
(

select distinct
IArt.PROJECTID,
IArt.DescPro,
IArt.ARTICLENO,
IArt.COMM,
IArt.ORDERID,
IArt.INFO_1,
IArt.POSSTR,
IArt.TEXT_1,
IDBSp.ASSOCPART,
IDBSp.CONID,
IDBSp.ID,
IDBSp.ORDER_ID,
IDBSp.BARCODE,
IDBSp.WEIGHT,
IDBSp.WIDTH,
IDBSp.LENGTH,
IDBSp.THK

from IDBSPP IDBSp
inner join imosArticulos Iart 
on Iart.ID = IDBSp.assocpart


)

select distinct * from imosPerfileria_1

