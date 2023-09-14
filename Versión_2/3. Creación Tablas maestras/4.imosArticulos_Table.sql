
--Artículos

--Lista los Artículos existentes dentro de la vista [imosArticulos_View] para limpiar el código del Artículo y llevarlo a la tabla [imosArticulos_Table]


INSERT INTO [imosArticulos_Table]

SELECT DISTINCT
       IArtV.[ProyectoCPRJ],
       [CodigoITEM] = concat(IArt.TEXT_1,'.',IArt.ID),
       IArtV.[DescripcionDSCA],
       IArtV.[FamiliaCITG],
       IArtV.[TipoArtKITM],
       IArtV.[CjtoUnidadesUSET],
       IArtV.[UnidStockCUNI],
       IArtV.[TUnidMasaCWUN],
       IArtV.[PesoWGHT],
       IArtV.[AnchoANCH],
       IArtV.[AltoALTO],
       IArtV.[ProfundoPROF],
       IArtV.[LineaCPLN],
       IArtV.[PlanificadorCPLB],
       IArtV.[CompCostoCPCP],
       IArtV.[EanCEAN],
       IArtV.[EstadoESTA],
       IArtV.[CampoHashREFCNTD],
       IArtV.[CampoHashREFCNTU]


FROM [Challenger_03].[dbo].[imosArticulos_View] IArtV 
INNER JOIN [Challenger_03].[dbo].[imosArticulos] IArt
ON right(IArtV.[CodigoITEM],len(concat(IArt.TEXT_1,'.',IArt.ID))) = concat(IArt.TEXT_1,'.',IArt.ID) COLLATE Latin1_General_CI_AS
AND IArtV.DescripcionDSCA = IArt.KMS COLLATE Latin1_General_CI_AS
AND right(IArtV.[CodigoITEM],len(IArt.ID)) = IArt.ID COLLATE Latin1_General_CI_AS