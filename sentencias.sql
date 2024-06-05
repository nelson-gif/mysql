/*SOURCE C:/Users/nelso/OneDrive/usac/Mysql/sentencias.sql--*/
DROP DATABASE IF EXISTS libreria_cf;

CREATE DATABASE IF NOT EXISTS libreria_cf;

USE libreria_cf;

CREATE TABLE IF NOT EXISTS autores (
    autor_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
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
    autor_id INT UNSIGNED NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250),
    paginas INTEGER UNSIGNED NOT NULL DEFAULT 0,
    fecha_publicacion DATE NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp,
    FOREIGN KEY(autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE
);

/*insertar en autores table*/
INSERT INTO autores (nombre, apellido, genero, fecha_nacimiento, pais_origen)
VALUES  ( 'nombre1', 'apellido1', 'M', '2002-01-30', 'Mexico'),
        ('nombre2', 'apellido2', 'F', '2003-03-25', 'Mexico'),
        ('nombre3', 'apellido3', 'M', '2004-04-12', 'Mexico'),
        ('nombre4', 'apellido4', 'F', '2005-02-11', 'Mexico'),
        ('nombre5', 'apellido5', 'M', '2006-04-15', 'Mexico');

INSERT INTO autores (nombre, apellido, seudonimo, genero, fecha_nacimiento, pais_origen)
VALUES ('stephen Edwing', 'king', 'Richard Bachman', 'f', '2021-02-23', 'USA');

INSERT INTO autores ( nombre, apellido, seudonimo, genero, fecha_nacimiento, pais_origen, fecha_creacion)
VALUES ('Joanne', 'Rowling', 'J.K Rowling', 'M', '2021-02-23', 'Reino unido', '2018-02-02');

/*insertar en libros table*/
INSERT INTO libros (autor_id, titulo, fecha_publicacion)
VALUES  (6, 'Carrie', '1974-01-01'),
        (6, 'El misterio de salmes lot', '1975-01-01'),
        (6, 'el resplandor', '1977-01-01'),
        (1, 'la niebla', '1990-02-23'),
        (1, 'la niebla', '1990-02-23'),
        (2, 'la niebla', '1990-02-23'),

        (7, 'Harry Potter y la piedra Filosofal', '1997-06-30'),
        (7, 'Harry Potter y la camara secreta', '1997-06-30'),
        (7, 'Harry Potter y el prisionero de Azkaban', '1997-06-30'),
        (7, 'Harry Potter y el caliz de fuego', '1997-06-30'),
        (7, 'Harry Potter y la orden del fenix', '1997-06-30'),
        (7, 'Harry Potter y el misterio del principe', '1997-06-30'),
        (7, 'Harry Potter y las reliquias de la muerte', '1997-06-30');

SELECT * FROM autores;

SELECT * FROM libros;

SELECT * FROM libros WHERE titulo IN ('Ojos de fuego', 'cujo', 'Carrie', 'El misterio de salmes lot', 'El hobbit', 'Harry Potter y la piedra Filosofal');