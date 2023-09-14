
--Proyecto IMOS


--Limpiar tablas maestras IMOS

:r C:\Users\jhoan.gonzalez\Desktop\IMOS_Queries\Versión_2\Borrar_data_Tablas.sql


--Ejecutar llenado tablas maestras IMOS

:r C:\Users\jhoan.gonzalez\Desktop\IMOS_Queries\Versión_2\Ejecutar_Tablas_maestras_IMOS_V4.sql  


-- Limpiar vistas fuente

	EXEC Exec_ImosProyectos '%$'

--Cargar la data de un proyecto en especifico dentro de las vistas fuente

	EXEC Exec_ImosProyectos 'PC0001504'  

--Cargar TODOS los proyectos existentes dentro de las vistas fuente

	EXEC Exec_imosProyectos_Act

--Pasar los puentes de herrajes a articulos

	EXEC Exec_Herrajes_a_Articulos



--Ordenes 


select * from [Challenger_03].[dbo].[imosOrdenes]

select * from [Challenger_03].[dbo].[imosOrdenes_view]

select * from [Challenger_03].[dbo].[imosOrdenes_Table]



--Módulos

select * from [Challenger_03].[dbo].[imosModulos]

select * from [Challenger_03].[dbo].[imosModulos_View]

select * from [Challenger_03].[dbo].[imosModulos_Table]



--Artículos

select * from [Challenger_03].[dbo].[imosArticulos]

select * from [Challenger_03].[dbo].[imosArticulos_View]

select * from [Challenger_03].[dbo].[imosArticulos_Table]
 


--Herrajes

select * from [Challenger_03].[dbo].[imosHerrajes] 

select * from [Challenger_03].[dbo].[imosHerrajes_View] 

select * from [Challenger_03].[dbo].[imosHerrajes_Table] 



--Láminas

select * from [Challenger_03].[dbo].[ImosLaminas]

select * from [Challenger_03].[dbo].[ImosLaminas_View]

select * from [Challenger_03].[dbo].[ImosLaminas_Table]



--Flejes

select * from [Challenger_03].[dbo].[imosFlejes] 

select * from [Challenger_03].[dbo].[imosFlejes_View] 

select * from [Challenger_03].[dbo].[imosFlejes_Table] 




--Perfileria 

select * from [Challenger_03].[dbo].[imosPerfileria] 

select * from [Challenger_03].[dbo].[imosPerfileria_View] 

select * from [Challenger_03].[dbo].[imosPerfileria_Table] 









