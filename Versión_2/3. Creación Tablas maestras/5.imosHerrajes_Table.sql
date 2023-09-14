
--Herrajes

--Lista los Herrajes existentes dentro de la vista [imosHerrajes_View] para limpiar el código del Herrajes y llevarlo a la tabla [imosHerrajes_Table]


INSERT INTO [imosHerrajes_Table]


SELECT DISTINCT
       IHerV.[ProyectoCPRJ],
       [CodigoITEM] = concat(IHer.ASSOCPART,'.',IHer.ORDER_ID,'.',IHer.ID),
       IHerV.[DescripcionDSCA],
       IHerV.[FamiliaCITG],
       IHerV.[TipoArtKITM],
       IHerV.[CjtoUnidadesUSET],
       IHerV.[UnidStockCUNI],
       IHerV.[TUnidMasaCWUN],
       IHerV.[PesoWGHT],
       IHerV.[AnchoANCH],
       IHerV.[AltoALTO],
       IHerV.[ProfundoPROF],
       IHerV.[LineaCPLN],
       IHerV.[PlanificadorCPLB],
       IHerV.[CompCostoCPCP],
       IHerV.[EanCEAN],
       IHerV.[EstadoESTA],
       IHerV.[CampoHashREFCNTD],
       IHerV.[CampoHashREFCNTU]


FROM [Challenger_03].[dbo].[imosHerrajes_View] IHerV 
inner join [Challenger_03].[dbo].[imosHerrajes] IHer
on right(IHerV.[CodigoITEM], len(concat(IHer.ASSOCPART,'.',IHer.ORDER_ID,'.',IHer.ID))) = concat(IHer.ASSOCPART,'.',IHer.ORDER_ID,'.',IHer.ID)