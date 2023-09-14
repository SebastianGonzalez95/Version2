
		   
--Laminas

--Lista los Laminas existentes dentro de la vista [imosLaminas_View] para limpiar el código del Laminas y llevarlo a la tabla [imosLaminas_Table]


INSERT INTO [imosLaminas_Table]


SELECT DISTINCT
       ILamV.[ProyectoCPRJ],
       [CodigoITEM] = concat(ILam.[POSSTR],'.',ILam.[ID],'.',ILam.[BESTELLUNG]),
       ILamV.[DescripcionDSCA],
       ILamV.[FamiliaCITG],
       ILamV.[TipoArtKITM],
       ILamV.[CjtoUnidadesUSET],
       ILamV.[UnidStockCUNI],
       ILamV.[TUnidMasaCWUN],
       ILamV.[PesoWGHT],
       ILamV.[AnchoANCH],
       ILamV.[AltoALTO],
       ILamV.[ProfundoPROF],
       ILamV.[LineaCPLN],
       ILamV.[PlanificadorCPLB],
       ILamV.[CompCostoCPCP],
       ILamV.[EanCEAN],
       ILamV.[EstadoESTA],
       ILamV.[CampoHashREFCNTD],
       ILamV.[CampoHashREFCNTU]


FROM [Challenger_03].[dbo].[imosLaminas_View] ILamV 
inner join [Challenger_03].[dbo].[imosLaminas] ILam
on right(ILamV.[CodigoITEM],len(concat(ILam.ID,'.',ILam.BESTELLUNG))) = concat(ILam.ID,'.',ILam.BESTELLUNG) COLLATE Latin1_General_CI_AS

