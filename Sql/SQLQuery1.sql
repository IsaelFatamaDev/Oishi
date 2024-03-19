IF NOT EXISTS (
     SELECT
          name
     FROM
          sys.databases
     WHERE
          name = 'OISHI'
) BEGIN CREATE DATABASE OISHI;

PRINT 'La base de datos OISHI ha sido creada correctamente.';

END
ELSE BEGIN PRINT 'La base de datos OISHI ya existe.';

END USE OISHI;

-- Crear tabla Cliente
CREATE TABLE [dbo.Cliente] (
     ID_Cliente INT PRIMARY KEY,
     Nombre NVARCHAR (100),
     Direccion NVARCHAR (255),
     Telefono NVARCHAR (15),
     Correo_Electronico NVARCHAR (100),
     Fecha_Registro DATE
);

-- Crear tabla Pedido
CREATE TABLE [dbo.Pedido] (
     ID_Pedido INT PRIMARY KEY,
     ID_Cliente INT FOREIGN KEY REFERENCES Cliente (ID_Cliente),
     Fecha_Hora DATETIME,
     Estado NVARCHAR (50),
     Total DECIMAL(10, 2)
);

-- Crear tabla Detalle_Pedido
CREATE TABLE [dbo.Detalle_Pedido] (
     ID_Detalle INT PRIMARY KEY,
     ID_Pedido INT FOREIGN KEY REFERENCES Pedido (ID_Pedido),
     ID_Plato INT FOREIGN KEY REFERENCES Plato (ID_Plato),
     Cantidad INT,
     Precio_Unitario DECIMAL(10, 2)
);

-- Crear tabla Menu
CREATE TABLE [dbo.Menu] (
     ID_Menu INT PRIMARY KEY,
     Nombre_Menu NVARCHAR (100),
     Descripcion TEXT
);

-- Crear tabla Plato
CREATE TABLE [dbo.Plato] (
     ID_Plato INT PRIMARY KEY,
     Nombre_Plato NVARCHAR (100),
     Descripcion TEXT,
     Precio DECIMAL(10, 2)
);

-- Crear tabla Empleado
CREATE TABLE [dbo.Empleado] (
     ID_Empleado INT PRIMARY KEY,
     Nombre NVARCHAR (100),
     Puesto NVARCHAR (100),
     Fecha_Contratacion DATE
);

-- Crear tabla Metodo_Pago
CREATE TABLE [dbo.Metodo_Pago] (
     ID_Metodo INT PRIMARY KEY,
     Tipo_Pago NVARCHAR (50),
     Descripcion TEXT
);