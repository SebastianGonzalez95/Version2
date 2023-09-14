
--Herrajes

--Creación de la vista que hace la relación jerarquica con la concatenación del código de cada componente de la estructura 

create or alter view [imosHerrajes_View] as


-- Listado de las herrajes existentes dentro de la vista [imosHerrajes]


SELECT DISTINCT 

  
[ProyectoCPRJ]= [PROJECTID],
[CodigoITEM]= IIF(LEN([ORDER_ID]) <> 0,concat([ARTICLENO],'.',[INFO_1],'.',[POSSTR],'.',[ASSOCPART],'.',[ORDER_ID],'.',[ID]),[ORDER_ID]),
[DescripcionDSCA]= [CONID],
[FamiliaCITG]= 'MA0022',
[TipoArtKITM]= 1,
[CjtoUnidadesUSET]= 'CG0',
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
[CodModulo] = Concat([INFO_1],'.',POSSTR),
[CodArticulo] = Concat([TEXT_1],'.',[ASSOCPART]),
[CodHerraje] = concat([ORDER_ID],'.',[ID])
	


from [Challenger_03].[dbo].[imosHerrajes] IHer

-- Comprueba la existencia de los herrajes listados dentro de la tabla [imosHerrajes_Table] y NO lista herrajes ya existentes 

where NOT EXISTS (SELECT 1 FROM [Challenger_03].[dbo].[imosHerrajes_Table] Iher_t 
							WHERE Iher_t.[ProyectoCPRJ] = IHer.[PROJECTID] COLLATE Latin1_General_CI_AS
								AND right(Iher_t.[CodigoITEM], len(concat(IHer.ASSOCPART,'.',IHer.ORDER_ID,'.',IHer.ID))) = concat(IHer.ASSOCPART,'.',IHer.ORDER_ID,'.',IHer.ID) COLLATE Latin1_General_CI_AS
								AND Iher_t.[DescripcionDSCA] = IHer.[CONID] COLLATE Latin1_General_CI_AS)



and LEN([ORDER_ID]) <> 0 

