CREATE DATABASE DW_VentasTailspinToys;
GO

USE DW_VentasTailspinToys;
GO

CREATE TABLE dimFecha (
    fechaKey INT PRIMARY KEY,
    fechaCompleta DATE NOT NULL,
    dia VARCHAR(20) NOT NULL,
	diaN VARCHAR(20) NOT NULL,
    mes VARCHAR(20) NOT NULL,
    trimestre VARCHAR(20) NOT NULL,
    anio VARCHAR(20) NOT NULL
);
GO

CREATE TABLE dimEstado (
    estadoKey INT IDENTITY(1,1) PRIMARY KEY,
    estadoId INT NOT NULL,
    codigoEstado VARCHAR(10) NOT NULL,
    nombreEstado VARCHAR(100) NOT NULL,
    zonaHoraria VARCHAR(50),
    nombreRegion VARCHAR(50)
);
GO

CREATE TABLE dimProducto (
    productoKey INT IDENTITY(1,1) PRIMARY KEY,
    productoId INT NOT NULL,
    skuProducto VARCHAR(50) NOT NULL,
    nombreProducto VARCHAR(200) NOT NULL,
    categoriaProducto VARCHAR(100),
    grupoArticulo VARCHAR(100),
    tipoKit VARCHAR(50),
    canales VARCHAR(50),
    demografia VARCHAR(50),
    precioUnitario DECIMAL(10,2) NOT NULL
);
GO

CREATE TABLE factVentas (
    ventaKey INT IDENTITY(1,1) PRIMARY KEY,
	numeroOrden VARCHAR(10) NOT NULL,
    fechaPedidoKey INT NOT NULL,
    fechaEnvioKey INT NOT NULL,
    productoKey INT NOT NULL,
    estadoKey INT NOT NULL,
    cantidad INT NOT NULL,
    precioUnitario DECIMAL(10,2) NOT NULL,
	codigoPromocion VARCHAR(50) NOT NULL,
    montoDescuento DECIMAL(10,2) NOT NULL,
    montoTotal DECIMAL(12,2) NOT NULL,
    CONSTRAINT fkFactVentasProducto FOREIGN KEY (productoKey) REFERENCES dimProducto(productoKey),
    CONSTRAINT fkFactVentasEstado FOREIGN KEY (estadoKey) REFERENCES dimEstado(estadoKey),
    CONSTRAINT fkFactVentasFechaPedido FOREIGN KEY (fechaPedidoKey) REFERENCES dimFecha(fechaKey),
    CONSTRAINT fkFactVentasFechaEnvio FOREIGN KEY (fechaEnvioKey) REFERENCES dimFecha(fechaKey)
);
GO