

--Art�culos

--Creaci�n de la vista que hace la relaci�n jerarquica con la concatenaci�n del c�digo de cada componente de la estructura 

create or alter view [imosArticulos_view] as


-- Listado de las m�dulos existentes dentro de la vista [imosArticulos]


SELECT DISTINCT 

	[ProyectoCPRJ]= [PROJECTID],
	[CodigoITEM]= concat([ARTICLENO],'.',[INFO_1],'.',POSSTR,'.',[TEXT_1],'.',[ID]) COLLATE Latin1_General_CI_AS,
	[DescripcionDSCA]= [KMS],
	[FamiliaCITG]= 'SF0001',
	[TipoArtKITM]= 2,
	[CjtoUnidadesUSET]= 'GC0',
	[UnidStockCUNI]= 'pza',
	[TUnidMasaCWUN]= 'kg',
	[PesoWGHT]= [WEIGHT],
	[AnchoANCH]= [FWIDTH],
	[AltoALTO]= [FLENG],
	[ProfundoPROF]= [FTHK],
	[LineaCPLN]= 'MR001',
	[PlanificadorCPLB]= '22006P',
	[CompCostoCPCP]= 110,
	[EanCEAN]= ' ',
	[EstadoESTA]= 0,
	[CampoHashREFCNTD]= 0,
	[CampoHashREFCNTU]= 0,
	[CodOrden] = [ARTICLENO],
	[CodModulo] = Concat([INFO_1],'.',POSSTR),
	[CodArticulo] = Concat([TEXT_1],'.',[ID])
	
FROM [Challenger_03].[dbo].[imosArticulos] IArt

-- Comprueba la existencia de los art�culos listados dentro de la tabla [imosArticulos_Table] y NO lista art�culos ya existentes 

		
where NOT EXISTS (SELECT 1 FROM [Challenger_03].[dbo].[imosArticulos_Table] IArtT 
							WHERE IArtT.[ProyectoCPRJ] = IArt.[PROJECTID] COLLATE Latin1_General_CI_AS
								AND IArtT.[CodigoITEM] = concat(IArt.TEXT_1,'.',IArt.ID)COLLATE Latin1_General_CI_AS 
								AND IArtT.[DescripcionDSCA] = IArt.[KMS] COLLATE Latin1_General_CI_AS)

and [TEXT_1] <> 'NOT_DATA_FOUND' 
and [TEXT_1] <> 'Tampoco hay info'






