/*1. obtener todos los libros escritos por autores que cuenten con un seudonimo,1 joane,2 stepen edwin*/
SELECT autor_id, titulo 
    FROM libros 
    WHERE autor_id 
    IN (SELECT autor_id FROM autores WHERE seudonimo IS NOT NULL) 
    ORDER BY autor_id ASC;

/*2. obtener el titulo de todos los libros publicados en el anio actual cuyos autores poseen un pseudonimo, uasndo anio actual = 2005*/
SELECT autor_id, titulo, fecha_publicacion 
    FROM libros 
    WHERE Year(fecha_publicacion) = 2005
    AND autor_id 
    IN (SELECT autor_id FROM autores WHERE seudonimo IS NOT NULL);

/*Obtener todos los libros escritos por autores que cuenten con un seudónimo y que hayan nacido ante de 1965.*/
SELECT autor_id, titulo 
    FROM libros 
    WHERE autor_id 
    IN (SELECT autor_id FROM autores WHERE YEAR(fecha_nacimiento) <= 1965 AND seudonimo IS NOT NULL)
    ORDER BY autor_id ASC;

/*Colocar el mensaje no disponible a la columna descripción, en todos los libros publicados antes del año 2000.*/
UPDATE libros 
    SET descripcion = 'no disponible' 
    WHERE YEAR(fecha_publicacion) <= 2000;

/*Obtener la llave primaria de todos los libros cuya descripción sea diferente de no disponible.*/
SELECT libro_id, descripcion FROM libros WHERE descripcion != 'no disponible';

/*Obtener el título de los últimos 3 libros escritos por el autor con id 2.*/
SELECT autor_id, titulo, fecha_publicacion FROM libros WHERE autor_id = 2 
    ORDER BY fecha_publicacion DESC LIMIT 3;

/*Obtener en un mismo resultado la cantidad de libros escritos por autores con seudónimo y sin seudónimo.*/
SELECT  (SELECT COUNT(autor_id) FROM autores WHERE seudonimo IS NOT NULL) as con_seudonimo,  
        (SELECT COUNT(autor_id) AS sin_seudonimo FROM autores WHERE seudonimo IS NULL) AS sin_seudonimo;

/*Obtener la cantidad de libros publicados entre enero del año 2000 y enero del año 2005.*/
SELECT COUNT(*) FROM libros WHERE YEAR(fecha_publicacion) BETWEEN 2000 AND 2005;

/*Obtener el título y el número de ventas de los cinco libros más vendidos.*/
SELECT titulo, ventas FROM libros ORDER BY ventas DESC LIMIT 5;

/*Obtener el título y el número de ventas de los cinco libros más vendidos de la última década, tomando en cuenta meses, dias, etc..*/
SELECT titulo, ventas, fecha_publicacion 
    FROM libros 
    WHERE fecha_publicacion >= (CURRENT_TIMESTAMP - INTERVAL 10 YEAR)
    ORDER BY ventas DESC LIMIT 5;

/*Obtener la cantidad de libros vendidos por los autores con id 1, 2 y 3.*/
SELECT autor_id, SUM(ventas) AS total_ventas FROM libros WHERE autor_id IN (1,2,3) GROUP BY autor_id;

/*Obtener el título del libro con más páginas.*/
SELECT titulo, paginas FROM libros ORDER BY paginas DESC LIMIT 1;

/*Obtener todos los libros cuyo título comience con la palabra “La”.*/
SELECT libro_id, titulo FROM libros WHERE titulo LIKE 'LA%';

/*Obtener todos los libros cuyo título comience con la palabra “La” y termine con la letra “a”.*/
SELECT libro_id, titulo FROM libros WHERE titulo LIKE 'LA%' AND titulo LIKE'%a';

/*Establecer el stock en cero a todos los libros publicados antes del año de 1995*/
UPDATE libros SET stock = 0 WHERE YEAR(fecha_publicacion) < 1995;

/*Mostrar el mensaje Disponible si el libro con id 1 posee más de 5 ejemplares en stock, en caso contrario mostrar el mensaje No disponible*/
SELECT IF(stock > 5, 'Disponible', 'No disponible') AS stock FROM libros WHERE libro_id = 1;

/*Obtener el título los libros ordenador por fecha de publicación del más reciente al más viejo.*/
SELECT titulo, fecha_publicacion FROM libros ORDER BY fecha_publicacion DESC;

/*Obtener el nombre de los autores cuya fecha de nacimiento sea posterior a 1950*/
SELECT CONCAT(nombre, ' ', apellido) AS nombre_completo, fecha_nacimiento 
    FROM autores WHERE YEAR(fecha_nacimiento) > 1950;

/*Obtener la el nombre completo y la edad de todos los autores.*/
SELECT CONCAT(nombre, ' ', apellido) AS nombre_completo, 
    (YEAR(CURDATE()) - YEAR(fecha_nacimiento)) AS edad FROM autores;

/*Obtener el nombre completo de todos los autores cuyo último libro publicado sea posterior al 2005*/
SELECT CONCAT(nombre, ' ', apellido) AS nombre_completo 
    FROM autores WHERE autor_id 
    IN (SELECT autor_id FROM libros WHERE fecha_publicacion > '2005-01-01');

/*Obtener el id de todos los escritores cuyas ventas en sus libros superen el promedio*/
SELECT autor_id, SUM(ventas) AS total_vendido, 
    (SELECT AVG(ventas) FROM libros) AS promedio 
    FROM libros 
    GROUP BY autor_id 
    HAVING total_vendido > promedio;

/*Obtener el id de todos los escritores cuyas ventas en sus libros sean mayores a cien mil ejemplares.*/
SELECT autor_id FROM libros WHERE ventas > 100000;

/*Crear una función la cual nos permita saber si un libro es candidato a préstamo o no. Retornar “Disponible” si el libro posee por lo menos un ejemplar en stock, en caso contrario retornar “No disponible.”*/
SELECT libro_id, titulo, IF(stock >= 1, 'Disponible', 'No disponible') AS disponibilidad FROM libros;

DELIMITER //

CREATE FUNCTION disponibilidad(id INT)
RETURNS VARCHAR(20)
BEGIN
    SET @stock = (SELECT stock FROM libros WHERE libro_id = id);
    RETURN IF(@stock >= 1, 'Disponible', 'No disponible');
END //

DELIMITER ;

