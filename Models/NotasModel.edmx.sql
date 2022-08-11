
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/11/2022 12:24:52
-- Generated from EDMX file: C:\Users\MLC22\Desktop\NotasWeb_ASP.NET\Models\NotasModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [NotasDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Estudiantes'
CREATE TABLE [dbo].[Estudiantes] (
    [EstudianteID] int IDENTITY(1,1) NOT NULL,
    [Nombres] nvarchar(max)  NOT NULL,
    [Apellidos] nvarchar(max)  NOT NULL,
    [Carnet] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Calificaciones'
CREATE TABLE [dbo].[Calificaciones] (
    [CalificacionID] int IDENTITY(1,1) NOT NULL,
    [Acumulado] decimal(18,0)  NOT NULL,
    [NotaFinal] decimal(18,0)  NOT NULL,
    [EstudianteEstudianteID] int  NOT NULL,
    [AsignaturaAsignaturaID] int  NOT NULL
);
GO

-- Creating table 'Asignaturas'
CREATE TABLE [dbo].[Asignaturas] (
    [AsignaturaID] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Creditos] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [EstudianteID] in table 'Estudiantes'
ALTER TABLE [dbo].[Estudiantes]
ADD CONSTRAINT [PK_Estudiantes]
    PRIMARY KEY CLUSTERED ([EstudianteID] ASC);
GO

-- Creating primary key on [CalificacionID] in table 'Calificaciones'
ALTER TABLE [dbo].[Calificaciones]
ADD CONSTRAINT [PK_Calificaciones]
    PRIMARY KEY CLUSTERED ([CalificacionID] ASC);
GO

-- Creating primary key on [AsignaturaID] in table 'Asignaturas'
ALTER TABLE [dbo].[Asignaturas]
ADD CONSTRAINT [PK_Asignaturas]
    PRIMARY KEY CLUSTERED ([AsignaturaID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [EstudianteEstudianteID] in table 'Calificaciones'
ALTER TABLE [dbo].[Calificaciones]
ADD CONSTRAINT [FK_EstudianteCalificacion]
    FOREIGN KEY ([EstudianteEstudianteID])
    REFERENCES [dbo].[Estudiantes]
        ([EstudianteID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EstudianteCalificacion'
CREATE INDEX [IX_FK_EstudianteCalificacion]
ON [dbo].[Calificaciones]
    ([EstudianteEstudianteID]);
GO

-- Creating foreign key on [AsignaturaAsignaturaID] in table 'Calificaciones'
ALTER TABLE [dbo].[Calificaciones]
ADD CONSTRAINT [FK_AsignaturaCalificacion]
    FOREIGN KEY ([AsignaturaAsignaturaID])
    REFERENCES [dbo].[Asignaturas]
        ([AsignaturaID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AsignaturaCalificacion'
CREATE INDEX [IX_FK_AsignaturaCalificacion]
ON [dbo].[Calificaciones]
    ([AsignaturaAsignaturaID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------