USE [BDBoutiqueXiomaraStore]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nom_cliente] [varchar](50) NULL,
	[dom_cliente] [varchar](60) NULL,
	[telefono] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[id_depa] [int] IDENTITY(1,1) NOT NULL,
	[nom_depart] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_depa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[nom_marca] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prenda]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prenda](
	[id_prenda] [int] IDENTITY(1,1) NOT NULL,
	[tipo_prenda] [nvarchar](50) NULL,
	[talla_prenda] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_marca] [int] NULL,
	[id_prenda] [int] NULL,
	[id_proveedor] [int] NULL,
	[nom_producto] [varchar](50) NULL,
	[precio_producto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[nom_proveedor] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[id_venta] [int] IDENTITY(1,1) NOT NULL,
	[id_prenda] [int] NULL,
	[id_cliente] [int] NULL,
	[vendido] [int] NULL,
	[fecha] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_BuscarClientes]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_BuscarClientes]
	@texto AS VARCHAR(20) = ''

AS
BEGIN
	SET NOCOUNT ON;
	   SELECT C.id_cliente,C.nom_cliente, C.dom_cliente, C.telefono
	   FROM [dbo].Cliente AS C
	   WHERE (nom_cliente + '' LIKE '%' + @texto +'%')
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_BuscarDepartamento]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_BuscarDepartamento]
	@texto AS VARCHAR(20) = ''

AS
BEGIN
	SET NOCOUNT ON;
	   SELECT D.id_depa, D.nom_depart
	   FROM [dbo].Departamento AS D
	   WHERE (nom_depart+ '' LIKE '%' + @texto +'%')
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_BuscarMarca]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_BuscarMarca]
	@texto AS VARCHAR(20) = ''

AS
BEGIN
	SET NOCOUNT ON;
	   SELECT M.id_marca, M.nom_marca
	   FROM [dbo].Marca AS M
	   WHERE (nom_marca + '' LIKE '%' + @texto +'%')
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_BuscarPrenda]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_BuscarPrenda]
	@texto AS VARCHAR(20) = ''

AS
BEGIN
	SET NOCOUNT ON;
	   SELECT Pr.id_prenda, Pr.tipo_prenda, Pr.talla_prenda
	   FROM [dbo].Prenda AS Pr
	   WHERE (tipo_prenda + '' LIKE '%' + @texto +'%')
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_BuscarProducto]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_BuscarProducto]
	@texto AS VARCHAR(20) = ''

AS
BEGIN
	SET NOCOUNT ON;
	   SELECT Pro.id_producto, Pro.id_marca, Pro.id_prenda, Pro.id_proveedor, Pro.nom_producto, Pro.precio_producto
	   FROM [dbo].Productos AS Pro
	   WHERE (nom_producto + '' LIKE '%' + @texto +'%')
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_BuscarProveedor]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_BuscarProveedor]
	@texto AS VARCHAR(20) = ''

AS
BEGIN
	SET NOCOUNT ON;
	   SELECT Pr.id_proveedor, Pr.nom_proveedor
	   FROM [dbo].Proveedor AS Pr
	   WHERE (nom_proveedor + '' LIKE '%' + @texto +'%')
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_BuscarVentas]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_BuscarVentas]
	@venta AS INT = ''

AS
BEGIN
	SET NOCOUNT ON;
	   SELECT V.id_venta, V.id_prenda, V.id_cliente, V.vendido, V.fecha
	   FROM [dbo].Ventas AS V
	   WHERE (id_venta + '' LIKE '%' + @venta +'%')
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Listar_Cliente]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_Listar_Cliente]
AS
BEGIN
	SELECT id_cliente, nom_cliente , dom_cliente, telefono
	FROM Cliente 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Listar_Departamento]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_Listar_Departamento]
AS
BEGIN
	SELECT id_depa, nom_depart
	FROM Departamento
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Listar_Marca]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_Listar_Marca]
AS
BEGIN
	SELECT id_marca, nom_marca
	FROM Marca
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Listar_Prenda]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_Listar_Prenda]
AS
BEGIN
	SELECT id_prenda, tipo_prenda, talla_prenda
	FROM Prenda
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Listar_Producto]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_Listar_Producto]
AS
BEGIN
	SELECT id_producto, id_marca, id_prenda, id_proveedor, nom_producto, precio_producto
	FROM Productos 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Listar_Proveedor]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_Listar_Proveedor]
AS
BEGIN
	SELECT id_proveedor, nom_proveedor
	FROM Proveedor
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Listar_Ventas]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_Listar_Ventas]
AS
BEGIN
	SELECT id_venta, id_prenda, id_cliente, vendido, fecha
	FROM Ventas
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_ActualizarCliente]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[SP_Set_ActualizarCliente]

@id_cliente int,
@nom_cliente varchar(50),
@dom_cliente varchar (50),
@telefono varchar (50)

as
update Cliente set nom_cliente = @nom_cliente, dom_cliente = @dom_cliente, telefono = @telefono
where id_cliente = @id_cliente

GO
/****** Object:  StoredProcedure [dbo].[SP_Set_ActualizarDepartamento]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[SP_Set_ActualizarDepartamento]

@id_depa int,
@nom_depart varchar(50)

as
update Departamento set nom_depart = @nom_depart where id_depa = @id_depa


GO
/****** Object:  StoredProcedure [dbo].[SP_Set_ActualizarMarca]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[SP_Set_ActualizarMarca]

@id_marca int,
@nom_marca varchar(50)

as
update Marca set nom_marca = @nom_marca where id_marca = @id_marca
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_ActualizarPrenda]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[SP_Set_ActualizarPrenda]

@id_prenda int,
@tipo_prenda varchar(50),
@talla_prenda varchar(50)

as
update Prenda set tipo_prenda = @tipo_prenda, talla_prenda = @talla_prenda where id_prenda = @id_prenda
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_ActualizarProducto]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[SP_Set_ActualizarProducto]

@id_producto int,
@id_marca int,
@id_prenda int,
@id_proveedor int,
@nom_producto varchar(50),
@precio_producto int

as
update Productos set id_marca = @id_marca, id_prenda = @id_prenda, id_proveedor = @id_proveedor, nom_producto = @nom_producto, precio_producto = @precio_producto where id_producto = @id_producto
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_ActualizarProovedor]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[SP_Set_ActualizarProovedor]

@id_proveedor int,
@nom_proveedor varchar(50)

as
update Proveedor set nom_proveedor = @nom_proveedor where id_proveedor = @id_proveedor
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_ActualizarVenta]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[SP_Set_ActualizarVenta]

@id_venta int,
@id_prenda int,
@id_cliente int,
@vendido varchar (50),
@fecha date

as
update Ventas set id_prenda = @id_prenda, id_cliente = @id_cliente, vendido = @vendido, fecha = @fecha where id_venta = @id_venta
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_AgregarCliente]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Set_AgregarCliente]

@nom_cliente varchar(50),
@dom_cliente varchar (50),
@telefono int
as
insert into Cliente values (@nom_cliente , @dom_cliente, @telefono)


GO
/****** Object:  StoredProcedure [dbo].[SP_Set_AgregarDepartamento]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Set_AgregarDepartamento]

@nom_depart varchar(50)
as
insert into Departamento values (@nom_depart)
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_AgregarMarca]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Set_AgregarMarca]

@nom_marca varchar(50)
as
insert into Marca values (@nom_marca)
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_AgregarPrenda]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Set_AgregarPrenda]

@tipo_prenda varchar(50),
@talla_prenda varchar (50)
as
insert into Prenda values (@tipo_prenda, @talla_prenda)
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_AgregarProducto]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Set_AgregarProducto]

@id_marca int,
@id_prenda int,
@id_proveedor int,
@nom_producto varchar (50),
@precio_producto int
as
insert into Productos values (@id_marca, @id_prenda, @id_proveedor, @nom_producto, @precio_producto)
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_AgregarProveedor]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Set_AgregarProveedor]

@nom_proveedor varchar(50)
as
insert into Proveedor values (@nom_proveedor)
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_AgregarVenta]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Set_AgregarVenta]

@id_prenda int,
@id_cliente int,
@vendido varchar(50),
@fecha date
as
insert into Ventas values (@id_prenda , @id_cliente, @vendido, @fecha)
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_EliminarCliente]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Set_EliminarCliente]
@id_cliente int
as
delete from Cliente where id_cliente=@id_cliente
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_EliminarDepartamento]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Set_EliminarDepartamento]
@id_depa int
as
delete from Departamento where id_depa=@id_depa
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_EliminarMarca]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Set_EliminarMarca]
@id_marca int
as
delete from Marca where id_marca=@id_marca
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_EliminarPrenda]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Set_EliminarPrenda]
@id_prenda int
as
delete from Prenda where id_prenda=@id_prenda
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_EliminarProducto]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Set_EliminarProducto]
@id_producto int
as
delete from Productos where id_producto=@id_producto
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_EliminarProveedor]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Set_EliminarProveedor]
@id_proveedor int
as
delete from Proveedor where id_proveedor=@id_proveedor
GO
/****** Object:  StoredProcedure [dbo].[SP_Set_EliminarVentas]    Script Date: 7/06/2023 02:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Set_EliminarVentas]
@id_venta int
as
delete from Venta where id_venta=@id_venta
GO
