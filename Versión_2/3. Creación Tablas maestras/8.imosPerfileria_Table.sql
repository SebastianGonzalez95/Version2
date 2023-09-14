
		   
--Perfileria

--Lista los Perfileria existentes dentro de la vista [imosPerfileria_View] para limpiar el código del Perfileria y llevarlo a la tabla [imosPerfileria_Table]


INSERT INTO [imosPerfileria_Table]


SELECT DISTINCT
       IFleV.[ProyectoCPRJ],
       [CodigoITEM] = concat(IFle.[TEXT_1],'.',IFle.[ASSOCPART],'.',IFle.[ORDER_ID],'.',IFle.[ID]),
       IFleV.[DescripcionDSCA],
       IFleV.[FamiliaCITG],
       IFleV.[TipoArtKITM],
       IFleV.[CjtoUnidadesUSET],
       IFleV.[UnidStockCUNI],
       IFleV.[TUnidMasaCWUN],
       IFleV.[PesoWGHT],
       IFleV.[AnchoANCH],
       IFleV.[AltoALTO],
       IFleV.[ProfundoPROF],
       IFleV.[LineaCPLN],
       IFleV.[PlanificadorCPLB],
       IFleV.[CompCostoCPCP],
       IFleV.[EanCEAN],
       IFleV.[EstadoESTA],
       IFleV.[CampoHashREFCNTD],
       IFleV.[CampoHashREFCNTU]


FROM [Challenger_03].[dbo].[imosPerfileria_View] IFleV

inner join [Challenger_03].[dbo].[imosPerfileria] IFle
on right(IFleV.[CodigoITEM],len(concat(IFle.[TEXT_1],'.',IFle.[ASSOCPART],'.',IFle.[ORDER_ID],'.',IFle.[ID]))) = concat(IFle.[TEXT_1],'.',IFle.[ASSOCPART],'.',IFle.[ORDER_ID],'.',IFle.[ID]) COLLATE Latin1_General_CI_AS











