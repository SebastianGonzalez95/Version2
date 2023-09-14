

--Flejes


--Creación de la vista que hace la relación jerarquica con la concatenación del código de cada componente de la estructura 

create or alter view [imosFlejes_View] as

-- Listado de las Flejes existentes dentro de la vista [imosFlejes]

SELECT DISTINCT 

[ProyectoCPRJ]= [PROJECTID],
[CodigoITEM]= concat([ARTICLENO],'.',[INFO_1],'.',POSSTR,'.',[TEXT_1],'.',[ID],'.',[BARCODE],'.',[BESTELLUNG],'.',[PRFNO])  COLLATE Latin1_General_CI_AS,
[DescripcionDSCA]= [PRFID],
[FamiliaCITG]= 'MA0006',
[TipoArtKITM]= 1,
[CjtoUnidadesUSET]= 'GC0',
[UnidStockCUNI]= 'm',
[TUnidMasaCWUN]= 'kg',
[PesoWGHT]= 0,
[AnchoANCH]= 0,
[AltoALTO]= 0,
[ProfundoPROF]= 0,
[LineaCPLN]= 'MC002',
[PlanificadorCPLB]= 'P20002',
[CompCostoCPCP]= 110,
[EanCEAN]= ' ',
[EstadoESTA]= 0,
[CampoHashREFCNTD]= 0,
[CampoHashREFCNTU]= 0,
[CodOrden] = [ARTICLENO],
[CodModulo] = Concat([INFO_1],'.',POSSTR),
[CodArticulo] = Concat([TEXT_1],'.',[ID]),
[CodLamina] = [BESTELLUNG],
[CodFleje] = concat([BARCODE],'.',[BESTELLUNG],'.',[PRFNO])

from [Challenger_03].[dbo].[imosFlejes] Ifle


-- Comprueba la existencia de los Flejes listados dentro de la tabla [imosFlejes_Table] y NO lista Flejes ya existentes 


where NOT EXISTS (SELECT 1 FROM [Challenger_03].[dbo].[imosFlejes_Table] IFle_t
							WHERE IFle_t.[ProyectoCPRJ] = Ifle.[PROJECTID] COLLATE Latin1_General_CI_AS
								AND IFle_t.[CodigoITEM] = concat(Ifle.[BARCODE],'.',Ifle.[BESTELLUNG],'.',Ifle.[PRFNO]) COLLATE Latin1_General_CI_AS
								AND IFle_t.[DescripcionDSCA] = Ifle.[PRFID] COLLATE Latin1_General_CI_AS)



and LEN(Ifle.[BESTELLUNG]) <> 0
and Ifle.[TEXT_1] <> 'NOT_DATA_FOUND' 
and Ifle.[TEXT_1] <> 'Tampoco hay info'

