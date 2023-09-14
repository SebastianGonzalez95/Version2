
		   
--Flejes

--Lista los Flejes existentes dentro de la vista [imosFlejes_View] para limpiar el código del Flejes y llevarlo a la tabla [imosFlejes_Table]


INSERT INTO [imosFlejes_Table]


SELECT DISTINCT
       IFleV.[ProyectoCPRJ],
       [CodigoITEM] = concat(IFle.[BARCODE],'.',IFle.[BESTELLUNG],'.',IFle.[PRFNO]),
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


FROM [Challenger_03].[dbo].[imosFlejes_View] IFleV



inner join [Challenger_03].[dbo].[imosFlejes] IFle
on right(IFleV.[CodigoITEM],len(concat(IFle.[BARCODE],'.',IFle.[BESTELLUNG],'.',IFle.[PRFNO]))) = concat(IFle.[BARCODE],'.',IFle.[BESTELLUNG],'.',IFle.[PRFNO]) COLLATE Latin1_General_CI_AS

