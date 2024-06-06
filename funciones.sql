DELIMITER //

CREATE FUNCTION agregar_dias2(fecha DATE, dias INT) /*nombre funcion y parametros que recibe*/
RETURNS DATE /*retorna tipo de dato DATE*/
BEGIN /*inicio funcion*/
    RETURN fecha + INTERVAL dias DAY;
END// /*fin funcion*/

DELIMITER ;



DELIMITER //

CREATE FUNCTION obtenerPaginas()
RETURNS INT
BEGIN 
    SET @paginas = (SELECT (ROUND (RAND() * 100) * 4));
    RETURN @paginas;
END //

DELIMITER ;

UPDATE libros SET paginas = obtenerPaginas();


DELIMITER //

CREATE FUNCTION obtener_ventas()
RETURNS INT 
BEGIN 
    SET @ventasRandom = (SELECT (ROUND (RAND() *100) * 6));
    RETURN @ventasRandom;
END//

DELIMITER ;


UPDATE libros SET ventas = obtener_ventas();