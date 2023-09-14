
--Módulos

--Creación de la vista que hace la relación jerarquica con la concatenación del código de cada componente de la estructura 

create or alter view [imosModulos_view] as


-- Listado de las m+odulos existentes dentro de la vista [imosModulos]


SELECT DISTINCT 
    [ProyectoCPRJ] = [PROJECTID] COLLATE Latin1_General_CI_AS,
    [CodigoITEM] = concat([ARTICLENO],'.',[INFO_1],'.',POSSTR)COLLATE Latin1_General_CI_AS,
    [DescripcionDSCA] = [NAME] COLLATE Latin1_General_CI_AS,
    [FamiliaCITG] = 'SF0001',
    [TipoArtKITM] = 2,
    [CjtoUnidadesUSET] = 'GC0',
    [UnidStockCUNI] = 'und',
    [TUnidMasaCWUN] = 'kg',
    [PesoWGHT] = [WEIGHT],
    [AnchoANCH] = [SIZEX_REAL],
    [AltoALTO] = [SIZEY_REAL],
    [ProfundoPROF] = [SIZEZ_REAL],
    [LineaCPLN] = 'MR001',
    [PlanificadorCPLB] = '21008P',
    [CompCostoCPCP] = 110,
    [EanCEAN] = ' ',
    [EstadoESTA] = 0,
    [CampoHashREFCNTD] = 0,
    [CampoHashREFCNTU] = 0,
	[CodOrden] = [ARTICLENO],
	[CodModulo] = concat([INFO_1],'.',POSSTR)
	
FROM [Challenger_03].[dbo].[imosModulos] IMod
WHERE LEN([INFO_1]) <> 0

-- Comprueba la existencia de los módulos listados dentro de la tabla [imosModulos_Table] y NO lista módulos ya existentes 

			AND NOT EXISTS (SELECT 1 FROM [Challenger_03].[dbo].[imosModulos_Table] IModT 
										WHERE IModT.[ProyectoCPRJ] = IMod.[PROJECTID] COLLATE Latin1_General_CI_AS
										AND IModT.[CodigoITEM] = concat(IMod.[INFO_1],'.',IMod.POSSTR )COLLATE Latin1_General_CI_AS
										AND IModT.[DescripcionDSCA] = IMod.[NAME] COLLATE Latin1_General_CI_AS)




