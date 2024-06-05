DELIMITER //

CREATE FUNCTION agregar_dias2(fecha DATE, dias INT) /*nombre funcion y parametros que recibe*/
RETURNS DATE /*retorna tipo de dato DATE*/
BEGIN /*inicio funcion*/
    RETURN fecha + INTERVAL dias DAY;
END// /*fin funcion*/

DELIMITER ;