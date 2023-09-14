
--Láminas 

--Creación de la vista que hace la relación jerarquica con la concatenación del código de cada componente de la estructura 

create or alter view [imosLaminas_View] as

-- Listado de las Laminas existentes dentro de la vista [imosLaminas]


SELECT DISTINCT 

 
  
[ProyectoCPRJ]= [PROJECTID],
[CodigoITEM]= concat([ARTICLENO],'.',[INFO_1],'.',POSSTR,'.',[TEXT_1],'.',[ID],'.',[BESTELLUNG])  COLLATE Latin1_General_CI_AS,
[DescripcionDSCA]= [NAME],
[FamiliaCITG]= 'MA0003',
[TipoArtKITM]= 1,
[CjtoUnidadesUSET]= 'GC0',
[UnidStockCUNI]= 'lam',
[TUnidMasaCWUN]= 'kg',
[PesoWGHT]= 0,
[AnchoANCH]= 0,
[AltoALTO]= 0,
[ProfundoPROF]= 0,
[LineaCPLN]= 'MC001',
[PlanificadorCPLB]= 'P20002',
[CompCostoCPCP]= 110,
[EanCEAN]= ' ',
[EstadoESTA]= 0,
[CampoHashREFCNTD]= 0,
[CampoHashREFCNTU]= 0,
[CodOrden] = [ARTICLENO],
[CodModulo] = Concat([INFO_1],'.',POSSTR),
[CodArticulo] = Concat([TEXT_1],'.',[ID]),
[CodLamina] = [BESTELLUNG]
	



from [Challenger_03].[dbo].[ImosLaminas] ILam


-- Comprueba la existencia de los Laminas listados dentro de la tabla [imosLaminas_Table] y NO lista Laminas ya existentes 


where NOT EXISTS (SELECT 1 FROM [Challenger_03].[dbo].[ImosLaminas_Table] ILam_1 
							WHERE ILam_1.[ProyectoCPRJ] = ILam.[PROJECTID] COLLATE Latin1_General_CI_AS
								AND ILam_1.[CodigoITEM] = concat(ILam.[POSSTR],'.',ILam.[ID],'.',ILam.[BESTELLUNG])  COLLATE Latin1_General_CI_AS
								AND ILam_1.[DescripcionDSCA] = ILam.[NAME] COLLATE Latin1_General_CI_AS)



and LEN(ILam.[BESTELLUNG]) <> 0
and ILam.[TEXT_1] <> 'NOT_DATA_FOUND' 
and ILam.[TEXT_1] <> 'Tampoco hay info'
