DROP DATABASE IF EXISTS libreria_cf;

CREATE DATABASE IF NOT EXISTS libreria_cf;

USE libreria_cf;

CREATE TABLE IF NOT EXISTS autores (
    author_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
    seudonimo VARCHAR(50) UNIQUE,
    genero ENUM('M', 'F'),
    fecha_nacimiento DATE NOT NULL,
    pais_origen VARCHAR(40) NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp
);

CREATE TABLE IF NOT EXISTS libros(
    libro_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250),
    paginas INTEGER UNSIGNED,
    fecha_publicacion DATE NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp
);

INSERT INTO autores (nombre, apellido, genero, fecha_nacimiento, pais_origen)
VALUES  ( 'nombre1', 'apellido1', 'M', '2002-01-30', 'Mexico'),
        ('nombre2', 'apellido2', 'F', '2003-03-25', 'Mexico'),
        ('nombre3', 'apellido3', 'M', '2004-04-12', 'Mexico'),
        ('nombre4', 'apellido4', 'F', '2005-02-11', 'Mexico'),
        ('nombre5', 'apellido5', 'M', '2006-04-15', 'Mexico');

INSERT INTO autores (nombre, apellido, seudonimo, genero, fecha_nacimiento, pais_origen)
VALUES ('stephen', 'king', 'Richard Bachman', 'f', '2021-02-23', 'Mexico');

INSERT INTO autores ( nombre, apellido, seudonimo, genero, fecha_nacimiento, pais_origen, fecha_creacion)
VALUES ('stephen', 'king', 'Richard Bachsdfgman', 'M', '2021-02-23', 'Mexico', '2018-02-02');

SELECT * FROM autores;