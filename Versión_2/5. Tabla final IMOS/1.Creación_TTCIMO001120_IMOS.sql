
--Consulta de registros de la tabla TTCIMO001120_IMOS - Artículos
--Select * from TTCIMO001120_IMOS



--Eliminación de registros de la tabla TTCIMO001120_IMOS - Artículos
--delete from TTCIMO001120_IMOS


--Inserción de registros provenientes de las tablas maestras dentro de la tabla TTCIMO001120_IMOS - Artículos

insert into TTCIMO001120_IMOS
select *
from imosOrdenes_Table IOrdT
where not exists (select * from TTCIMO001120_IMOS TTCI where TTCI.T$ITEM = IOrdT.CodigoITEM COLLATE Latin1_General_CI_AS )

--------------------------------------------------------------------------------------------------------------------------------

insert into TTCIMO001120_IMOS
select *
from imosModulos_Table IModT
where not exists (select * from TTCIMO001120_IMOS TTCI where TTCI.T$ITEM = IModT.CodigoITEM COLLATE Latin1_General_CI_AS )

--------------------------------------------------------------------------------------------------------------------------------

insert into TTCIMO001120_IMOS
select *
from imosArticulos_Table IArtT
where not exists (select * from TTCIMO001120_IMOS TTCI where TTCI.T$ITEM = IArtT.CodigoITEM COLLATE Latin1_General_CI_AS )

--------------------------------------------------------------------------------------------------------------------------------

insert into TTCIMO001120_IMOS
select *
from imosHerrajes_Table IHerT
where not exists (select * from TTCIMO001120_IMOS TTCI where TTCI.T$ITEM = IHerT.CodigoITEM COLLATE Latin1_General_CI_AS )

--------------------------------------------------------------------------------------------------------------------------------

insert into TTCIMO001120_IMOS
select *
from ImosLaminas_Table ILamT
where not exists (select * from TTCIMO001120_IMOS TTCI where TTCI.T$ITEM = ILamT.CodigoITEM COLLATE Latin1_General_CI_AS )

--------------------------------------------------------------------------------------------------------------------------------

insert into TTCIMO001120_IMOS
select *
from imosFlejes_Table IFleT
where not exists (select * from TTCIMO001120_IMOS TTCI where TTCI.T$ITEM = IFleT.CodigoITEM COLLATE Latin1_General_CI_AS )

--------------------------------------------------------------------------------------------------------------------------------

insert into TTCIMO001120_IMOS
select *
from imosPerfileria_Table IPerT
where not exists (select * from TTCIMO001120_IMOS TTCI where TTCI.T$ITEM = IPerT.CodigoITEM COLLATE Latin1_General_CI_AS )

--------------------------------------------------------------------------------------------------------------------------------


--Comando para enviar registros de la tabla TTCIMO001120_IMOS en SQL a la tabla TTCIMO001120 en Oracle

INSERT INTO OPENQUERY([PRUEBABAAN], 'SELECT * FROM BAAN.TTCIMO001120')
SELECT *
from TTCIMO001120_IMOS source
WHERE NOT EXISTS (
    SELECT 1
    FROM OPENQUERY([PRUEBABAAN], 'SELECT T$ITEM FROM BAAN.TTCIMO001120') AS target
    WHERE source.T$ITEM = target.T$ITEM
)


--Consulta a la tabla TTCIMO001120 en Oracle
--select * from OPENQUERY ([PRUEBABAAN], 'SELECT * FROM BAAN.TTCIMO001120')


--Eliminar registros dentro de la tabla TTCIMO001120 en Oracle
--DELETE FROM OPENQUERY([PRUEBABAAN], 'SELECT * FROM BAAN.TTCIMO001120')








