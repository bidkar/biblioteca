-- DDL: Data Definition Language
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS biblioteca_grupob
CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Poner en uso la base recién creada
USE biblioteca_grupob;

-- Crear la tabla Editoriales
CREATE TABLE IF NOT EXISTS Editoriales (
    Id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Domicilio VARCHAR(200) DEFAULT NULL,
    Telefono VARCHAR(20) DEFAULT NULL,
    CorreoElectronico VARCHAR(200) DEFAULT NULL
);

-- Crear la tabla Autores
CREATE TABLE IF NOT EXISTS Autores (
    Id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL
);

-- Crear la tabla Usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
    Id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Alias VARCHAR(16) NOT NULL UNIQUE,
    Contrasenia VARCHAR(300) NOT NULL,
    CorreoElectronico VARCHAR(200) NOT NULL UNIQUE,
    Recordatorio VARCHAR(200) DEFAULT NULL,
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL
);

-- Crear la tabla Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    Id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Sexo ENUM('H','M') NOT NULL,
    Tipo ENUM('ALUMNO','ADMINISTRATIVO','DOCENTE') NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    CorreoElectronico VARCHAR(200) NOT NULL
);

-- Crear la tabla Libros
CREATE TABLE IF NOT EXISTS Libros (
    Id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(200) NOT NULL,
    Edicion YEAR(4) NOT NULL,
    Isbn VARCHAR(20) NOT NULL UNIQUE,
    Genero VARCHAR(100) NOT NULL,
    EditorialId INT UNSIGNED NOT NULL,
    CONSTRAINT FK_Libros_Editoriales
        FOREIGN KEY (EditorialId)
        REFERENCES Editoriales(Id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT
);

-- Crear la tabla AutoresLibros
CREATE TABLE IF NOT EXISTS AutoresLibros (
    AutorId INT UNSIGNED,
    LibroId INT UNSIGNED,
    PRIMARY KEY (AutorId, LibroId),
    CONSTRAINT FK_AutoresLibros_Autores
        FOREIGN KEY (AutorId)
        REFERENCES Autores(Id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT,
    CONSTRAINT FK_AutoresLibros_Libros
        FOREIGN KEY (LibroId)
        REFERENCES Libros(Id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT
);

-- Crear la tabla Ejemplares
CREATE TABLE IF NOT EXISTS Ejemplares (
    Id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    LibroId INT UNSIGNED NOT NULL,
    FechaDeIngreso DATE NOT NULL,
    Costo DOUBLE NOT NULL,
    Condiciones VARCHAR(300) NOT NULL,
    CONSTRAINT FK_Ejemplares_Libros
        FOREIGN KEY (LibroId)
        REFERENCES Libros(Id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT
);

-- Crear tabla Prestamos
CREATE TABLE IF NOT EXISTS Prestamos (
    Id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    FechaDeSalida DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaDeRegreso DATETIME DEFAULT NULL,
    Tipo ENUM('INTERNO','EXTERNO') NOT NULL,
    UsuarioId INT UNSIGNED NOT NULL,
    ClienteId INT UNSIGNED NOT NULL,
    CONSTRAINT FK_Prestamos_Usuarios
        FOREIGN KEY (UsuarioId)
        REFERENCES Usuarios(Id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT,
    CONSTRAINT FK_Prestamos_Clientes
        FOREIGN KEY (ClienteId)
        REFERENCES Clientes(Id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT
);

-- Crear la tabla PrestamosEjemplares
CREATE TABLE IF NOT EXISTS PrestamosEjemplares (
    PrestamoId INT UNSIGNED,
    EjemplarId INT UNSIGNED,
    Observaciones VARCHAR(300) NOT NULL,
    PRIMARY KEY (PrestamoId, EjemplarId),
    CONSTRAINT FK_PrestamosEjemplares_Prestamos
        FOREIGN KEY (PrestamoId)
        REFERENCES Prestamos(Id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT,
    CONSTRAINT FK_PrestamosEjemplares_Ejemplares
        FOREIGN KEY (EjemplarId)
        REFERENCES Ejemplares(Id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT
);