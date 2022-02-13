
--- Consultas tabla producto.

Use Northwind
go

-- tabla producto

Select DISTINCT P.nombre as producto, C.nombre as categoria
from Producto p
Inner join Categoria c
on p.categoriaID=c.categoriaID

-- tabla cliente 

Select DISTINCT c.ContactName, c.City, Country
from Cliente c

-- tabla proveedor

Select DISTINCT p.nombreCompania, p.pais
from Proveedor p

-- tabla empleado

Select DISTINCT  em.LastName as apellido,em.ReportsTo as informe
from Empleado em
where em.ReportsTo is not null 

-- Tabla fecha

Select DISTINCT  CONVERT (DATE, o.fecha) as fecha, CONVERT(INT, DATEPART(YEAR,o.fecha)) as año,
							  CONVERT(INT, DATEPART(QUARTER,o.fecha)) as trimestre,
							  CONVERT(varchar, DATEPART(MONTH, o.fecha)) as mes,
							  CONVERT(INT, DATEPART(DAY, o.fecha)) as dia
from Orden o


--tabla ventas

Select Distinct Nmp.id as ProductoID,
Nmc.id as ClienteID,
Nmem.id as EmpleadoID,
Nmt.id  as TiempoID,
Nmprov.id as ProvedorID,
(Nddo.Quantity*Nddo.UnitPrice) as Precio_Total,
Nddo.Quantity as cantidad
from Producto Ndp
inner join Categoria Ndc
on ndp.categoriaID = Ndc.categoriaID
inner join Proveedor Ndprov
on Ndp.provedorID = Ndprov.proveedorID
inner join DetalleOrden Nddo 
on Ndp.productoID = Nddo.productoID
inner join Orden Ndor
on Nddo.ordenID = Ndor.ordenID
inner join Cliente Ndcl
on Ndcl.clienteID = Ndor.clienteID
inner join Empleado Ndem
on  Ndem.empleadoID = Ndor.empleadoID
inner join NorthwindDatamart.dbo.Producto Nmp
on  Ndp.nombre= Nmp.nombre
inner join NorthwindDatamart.dbo.Cliente Nmc
on  Ndcl.ContactName = Nmc.nombre
inner join  NorthwindDatamart.dbo.Empleado Nmem
on Ndem.LastName = Nmem.apellido
inner join NorthwindDatamart.dbo.Tiempo Nmt
on Ndor.fecha = (convert(date,Nmt.fecha))
inner join NorthwindDatamart.dbo.Proveedor  Nmprov
on Ndprov.nombreCompania = Nmprov.nombreCompania





-- hacer el delete
Delete from [dbo].[Orden];
Delete from [dbo].[producto];
Delete from [dbo].[Cliente];
Delete from [dbo].[proveedor];
Delete from [dbo].[Empleado];
Delete from [dbo].[Tiempo];
Delete from [dbo].[Orden];

 

 select * from Cliente








