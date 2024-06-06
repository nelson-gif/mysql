SELECT AVG(ventas) FROM libros; /*avg 245.5385*/

SELECT autor_id FROM libros GROUP BY autor_id HAVING SUM(ventas) > 245.5385;

/*consulta arriba se puede mejorar asi:*/
SET @promedio = (SELECT AVG(ventas) FROM libros);
SELECT autor_id FROM libros GROUP BY autor_id HAVING SUM(ventas) > @promedio;

/*consulta arriba se puede mejorar mas usando subconsultas asi:*/
SELECT autor_id

SELECT autor_id 
    FROM libros 
    GROUP BY autor_id 
    HAVING SUM(ventas) > (SELECT AVG(ventas) FROM libros); /*primero se ejecuta el select de adentro para afuera*/

/*creando mas subconsultas para obtener el nombre completo de los autores que superen el avg en ventas:*/
SELECT autor_id, CONCAT(nombre, ' ', apellido) AS nombre_completo /*3.retorna nombre completo en base a una lista de id's, adicionnal retorna en otra columna el autor_id*/
    FROM autores 
    WHERE autor_id IN (SELECT autor_id /*2.este select retorna una lista con el id de autores con ventas mayores a avg*/
    FROM libros 
    GROUP BY autor_id 
    HAVING SUM(ventas) > (SELECT AVG(ventas) FROM libros) /*1.este select retorna el avg*/
    );







/*mismo codigo de arriba sin comentarios: */
SELECT autor_id, CONCAT(nombre, ' ', apellido) AS nombre_completo 
    FROM autores 
    WHERE autor_id IN (SELECT autor_id 
    FROM libros 
    GROUP BY autor_id 
    HAVING SUM(ventas) > (SELECT AVG(ventas) FROM libros)
    );


/*----------------------------------------------------------------------------------------*/
/*para saber si existe un libro o no existe entre una lista, si existe al menos uno, retorna true, siempre usra la llave primaria como buena practica en el select dentro de exists*/

SELECT IF( EXISTS (SELECT libro_id FROM libros WHERE titulo = 'carrie') ,
    'Disponible', 
    'No disponible' ) AS existencia;
