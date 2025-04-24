
use SistemaVentas01
go

create table Rol(
IdRol int primary key identity,
Descripcion varchar(50),
FechaRegistro datetime default getdate()
)
go


create table Permiso(
IdPermiso int primary key identity,
NombreMenu varchar(80),
FechaRegistro datetime default getdate()
)
go

create table RolPermiso(
IdRolPermiso int primary key identity,
IdRol int references Rol(IdRol) not null,
IdPermiso int references Permiso(IdPermiso) not null
)
go

create table Proveedor(
IdProveedor int primary key identity,
Documento varchar(50),
RazonSocial  varchar(50),
Correo varchar(50),
Telefono varchar(20),
Estado bit,
FechaRegistro datetime default getdate()
)
go


create table Cliente(
IdCliente int primary key identity,
Documento varchar(50),
Nombre  varchar(50),
Correo varchar(50),
Celular varchar(15),
Estado bit,
FechaRegistro datetime default getdate()
)
go

create table Usuario(
IdUsuario int primary key identity,
Documento varchar(50),
Nombre  varchar(50),
Correo varchar(50),
Clave varchar(50),
IdRol int references Rol(IdRol),
Estado bit,
FechaRegistro datetime default getdate()
)
go

create table Categoria(
IdCategoria int primary key identity,
Descripcion varchar(100),
Estado bit,
FechaRegistro datetime default getdate()
)
go

create table Producto(
IdProducto int primary key identity,
Codigo varchar(50),
Nombre varchar(50),
Descripcion varchar(100),
Stock decimal(10,3) not null default 0,
PrecioCompra decimal(10,3) default 0,
PrecioVenta decimal(10,3) default 0,
Estado bit,
FechaRegistro datetime default getdate(),
IdCategoria int references Categoria(IdCategoria) not null
)
go


create table Compra(
IdCompra int primary key identity,
TipoDocumento varchar(50),
NumeroDocumento  varchar(50),
MontoTotal decimal(10,3),
FechaRegistro datetime default getdate(),
IdUsuario int references Usuario(IdUsuario) not null,
IdProveedor int references Proveedor(IdProveedor) not null
)
go



create table DetalleCompra(
IdDetalleCompra int primary key identity,
PrecioCompra decimal(10,3) default 0,
PrecioVenta decimal(10,3) default 0,
Cantidad decimal(10,3),
Total decimal(10,3),
FechaRegistro datetime default getdate(),
IdCompra int references Compra(IdCompra) not null,
IdProducto int references Producto(IdProducto) not null
)
go


create table Venta(
IdVenta int primary key identity,
TipoDocumento varchar(50),
NumeroDocumento  varchar(50),
DocumentoCliente  varchar(50),
NombreCliente  varchar(100),
MontoPago decimal(10,3),
MontoCambio decimal(10,3),
MontoTotal decimal(10,3),
FechaRegistro datetime default getdate(),
IdCliente int references Cliente(IdCliente),
IdUsuario int references Usuario(IdUsuario) not null
)
go


create table DetalleVenta(
IdDetalleVenta int primary key identity,
PrecioVenta decimal(10,3),
Cantidad decimal(10,3),
SubTotal decimal(10,3),
FechaRegistro datetime default getdate(),
IdVenta int references Venta(IdVenta) not null,
IdProducto int references Producto(IdProducto) not null
)
go


