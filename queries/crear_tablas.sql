CREATE TABLE [departamentos]
(
    [Id] int PRIMARY KEY IDENTITY(1, 1),
    [Nombre] varchar(100)
)
GO

CREATE TABLE [empleados]
(
    [Id] int PRIMARY KEY IDENTITY(1, 1),
    [Nombre] varchar(50),
    [Apellido] varchar(50),
    [Departamento_id] int
)
GO

CREATE TABLE [cuentas_presupuestarias]
(
    [Id] int PRIMARY KEY IDENTITY(1, 1),
    [Codigo] varchar(20),
    [Descripcion] varchar(200)
)
GO

CREATE TABLE [presupuestos]
(
    [Id] int PRIMARY KEY IDENTITY(1, 1),
    [Fecha] date,
    [Departamento_id] int,
    [Cuenta_id] int,
    [Monto_presupuestado] decimal(12,2)
)
GO

CREATE TABLE [gastos]
(
    [Id] int PRIMARY KEY IDENTITY(1, 1),
    [Fecha] date,
    [Departamento_id] int,
    [Cuenta_id] int,
    [Descripcion] varchar(200),
    [Monto_gastado] DECIMAL(12,2)
)
GO

ALTER TABLE [empleados] ADD FOREIGN KEY ([Departamento_id]) REFERENCES [departamentos] ([Id])
GO

ALTER TABLE [presupuestos] ADD FOREIGN KEY ([Departamento_id]) REFERENCES [departamentos] ([Id])
GO

ALTER TABLE [presupuestos] ADD FOREIGN KEY ([Cuenta_id]) REFERENCES [cuentas_presupuestarias] ([Id])
GO

ALTER TABLE [gastos] ADD FOREIGN KEY ([Departamento_id]) REFERENCES [departamentos] ([Id])
GO

ALTER TABLE [gastos] ADD FOREIGN KEY ([Cuenta_id]) REFERENCES [cuentas_presupuestarias] ([Id])
GO
