
--Perfileria


--Creación de la vista que hace la relación jerarquica con la concatenación del código de cada componente de la estructura 

create or alter view [imosPerfileria_View] as

-- Listado de las Perfileria existentes dentro de la vista [imosPerfileria]


SELECT DISTINCT 

 
  
[ProyectoCPRJ]= [PROJECTID],
	[CodigoITEM]= concat([ARTICLENO],'.',[INFO_1],'.',[POSSTR],'.',[TEXT_1],'.',[ASSOCPART],'.',[ORDER_ID],'.',[ID]) COLLATE Latin1_General_CI_AS,
	[DescripcionDSCA]= [CONID],
	[FamiliaCITG]= 'MA0022',
	[TipoArtKITM]= 1,
	[CjtoUnidadesUSET]= 'GC0',
	[UnidStockCUNI]= 'und',
	[TUnidMasaCWUN]= 'kg',
	[PesoWGHT]= 0,
	[AnchoANCH]= 0,
	[AltoALTO]= 0,
	[ProfundoPROF]= 0,
	[LineaCPLN]= 'MC0003',
	[PlanificadorCPLB]= 'P20002',
	[CompCostoCPCP]= 110,
	[EanCEAN]= ' ',
	[EstadoESTA]= 0,
	[CampoHashREFCNTD]= 0,
	[CampoHashREFCNTU]= 0,
	[CodOrden] = [ARTICLENO],
	[CodModulo] = Concat([INFO_1],'.',[POSSTR]),
	[CodArticulo] = Concat([TEXT_1],'.',[ASSOCPART]),
	[CodPerfileria] = Concat([ORDER_ID],'.',[ID])


from [Challenger_03].[dbo].[imosPerfileria] IPer


-- Comprueba la existencia de los Perfileria listados dentro de la tabla [imosPerfileria_Table] y NO lista Perfileria ya existentes 


where NOT EXISTS (SELECT 1 FROM [Challenger_03].[dbo].[imosPerfileria_Table] IPerT 
							WHERE IPerT.[ProyectoCPRJ] = IPer.[PROJECTID] COLLATE Latin1_General_CI_AS
								AND IPerT.[CodigoITEM] = concat(IPer.[TEXT_1],'.',IPer.[ASSOCPART],'.',IPer.[ORDER_ID],'.',IPer.[ID]) COLLATE Latin1_General_CI_AS
								AND IPerT.[DescripcionDSCA] = IPer.[CONID] COLLATE Latin1_General_CI_AS)


AND NOT EXISTS (SELECT 1 FROM [Challenger_03].[dbo].[imosArticulos_Table] IArtT 
							WHERE IArtT.[ProyectoCPRJ] = IPer.[PROJECTID] COLLATE Latin1_General_CI_AS
								AND IArtT.[CodigoITEM] = concat(IPer.[TEXT_1],'.',IPer.[ASSOCPART],'.',IPer.[ORDER_ID],'.',IPer.[ID]) COLLATE Latin1_General_CI_AS
								AND IArtT.[DescripcionDSCA] = IPer.[CONID] COLLATE Latin1_General_CI_AS)


and len(IPer.[ORDER_ID]) <> 0