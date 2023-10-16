-- DDL: Data Definition Language
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS bibliotecaphp
CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Poner en uso la base recién creada
USE bibliotecaphp;

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
