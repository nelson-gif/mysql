CREATE TABLE autores(
    author_id INT,
    nombre VARCHAR(25),
    apellido VARCHAR(25),
    genero CHAR(1), 
    fecha_nacimiento DATE,
    pais_origen VARCHAR(40)
);

/*insertar registros*/
INSERT INTO autores (author_id, nombre, apellido, genero, fecha_nacimiento, pais_origen) 
VALUES (1, 'Test autor', 'Test autor', 'M', '2018-01-30', 'Mexico');

INSERT INTO autores (author_id, nombre) VALUES (1, 'Test autor');


--ejercicio insertar 5 registros a tabla autores
INSERT INTO autores (author_id, nombre, genero, fecha_nacimiento, pais_origen)
VALUES  (7, 'nombre1', 'F', '2021-02-23', 'Mexico'),
        (8, 'nombre3', 'M', '2013-03-12', 'Mexico'),
        (9, 'nombre4', 'F', '2011-04-11', 'Mexico'),
        (10, 'nombre5', 'M', '2004-08-23', 'Mexico'),
        (11, 'nombre6', 'F', '2001-05-27', 'Mexico');


SELECT * FROM autores;

