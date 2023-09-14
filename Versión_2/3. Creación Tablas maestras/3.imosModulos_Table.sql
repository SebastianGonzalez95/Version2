
--Módulos

--Lista los módulos existentes dentro de la vista [imosModulos_View] para limpiar el código del módulo y llevarlo a la tabla [imosModulos_Table]


INSERT INTO [imosModulos_Table]

select distinct

	   IModV.[ProyectoCPRJ]
      ,SUBSTRING(IModV.[CodigoITEM],len(IOrdT.[CodigoITEM]) + 2 ,len(IModV.[CodigoITEM])) [CodigoITEM]
      ,IModV.[DescripcionDSCA] 
      ,IModV.[FamiliaCITG]
      ,IModV.[TipoArtKITM]
      ,IModV.[CjtoUnidadesUSET]
      ,IModV.[UnidStockCUNI]
      ,IModV.[TUnidMasaCWUN]
      ,IModV.[PesoWGHT]
      ,IModV.[AnchoANCH]
      ,IModV.[AltoALTO]
      ,IModV.[ProfundoPROF]
      ,IModV.[LineaCPLN]
      ,IModV.[PlanificadorCPLB]
      ,IModV.[CompCostoCPCP]
      ,IModV.[EanCEAN]
      ,IModV.[EstadoESTA]
      ,IModV.[CampoHashREFCNTD]
      ,IModV.[CampoHashREFCNTU]

from [Challenger_03].[dbo].[imosModulos_View] IModV
inner join [imosOrdenes_Table] IOrdT
on left(IModV.CodigoITEM, len(IOrdT.CodigoITEM))  = IOrdT.CodigoITEM


