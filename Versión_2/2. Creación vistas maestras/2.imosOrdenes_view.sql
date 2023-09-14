--Ordenes 

--Creación de la vista que hace la relación jerarquica con la concatenación del código de cada componente de la estructura 

create or alter view [imosOrdenes_view] as

-- Listado de las ordenes existentes dentro de la vista [imosOrdenes]

SELECT DISTINCT 

	[ProyectoCPRJ]= [proyectoCPRJ],
	[CodigoITEM]= [ARTICLENO] COLLATE Latin1_General_CI_AS, 
	[DescripcionDSCA]= right(name,len([COMM])),
	[FamiliaCITG]= 'PT0016', 
	[TipoArtKITM]= 2,
	[CjtoUnidadesUSET]= 'GC0',
	[UnidStockCUNI]= 'und',
	[TUnidMasaCWUN]= 'kg',
	[PesoWGHT]= 0,
	[AnchoANCH]= 0,
	[AltoALTO]= 0,
	[ProfundoPROF]= 0,
	[LineaCPLN]= 'LI0201',
	[PlanificadorCPLB]= '21008P',
	[CompCostoCPCP]= 110,
	[EanCEAN]= ' ',
	[EstadoESTA]= 0,
	[CampoHashREFCNTD]= 0,
	[CampoHashREFCNTU]= 0
	
FROM [Challenger_03].[dbo].[imosOrdenes] IMod
WHERE LEN([ARTICLENO]) <> 0

-- Comprueba la existencia de las ordenes listadas dentro de la tabla [imosOrdenes_Table] y NO lista ordenes ya existentes 

			AND NOT EXISTS (SELECT 1 FROM [Challenger_03].[dbo].[imosOrdenes_Table] IOrd 
										WHERE IOrd.[ProyectoCPRJ] = IMod.[ProyectoCPRJ] COLLATE Latin1_General_CI_AS
										AND IOrd.[CodigoITEM] = IMod.[ARTICLENO] COLLATE Latin1_General_CI_AS 
										AND IOrd.[DescripcionDSCA] = right(IMod.name,len(IMod.[COMM])) COLLATE Latin1_General_CI_AS)

