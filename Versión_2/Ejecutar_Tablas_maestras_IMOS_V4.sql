--Ordenes

insert into [imosOrdenes_Table]

select distinct 
*
from [imosOrdenes_view]




--Módulos

--Creación de la vista que hace la relación jerarquica con la concatenación del código de cada componente de la estructura 
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














