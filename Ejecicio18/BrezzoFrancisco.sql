1)
DELIMITER //

CREATE FUNCTION ObtenerCopias(film_id INT, store_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE copies_count INT;
  
  SELECT COUNT(*) INTO copies_count
  FROM inventory AS i
  WHERE i.film_id = film_id
    AND i.store_id = store_id;
    
  RETURN copies_count;
END;
//
DELIMITER ;


SELECT ObtenerCopias(1, 1);

2)
DELIMITER //

DROP PROCEDURE IF EXISTS ObteberCustomers //

CREATE PROCEDURE ObteberCustomers(IN country_name VARCHAR(250), INOUT list VARCHAR(500)) 
BEGIN 
	DECLARE finished INT DEFAULT 0;
	DECLARE f_name VARCHAR(250); 
	DECLARE l_name VARCHAR(250);
	DECLARE country VARCHAR(250);

	DECLARE cursorList CURSOR FOR
	SELECT
	    co.country,c.first_name,c.last_name
	FROM customer c
	    INNER JOIN address USING(address_id)
	    INNER JOIN city USING(city_id)
	    INNER JOIN country co USING(country_id);
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

	OPEN cursorList;

	looplabel: LOOP
		FETCH cursorList INTO country, f_name, l_name;

		IF country = country_name THEN
			SET list = CONCAT(f_name,' ', l_name, ' ; ', list);
		END IF;

        IF finished = 1 THEN
			LEAVE looplabel;
		END IF;

	END LOOP looplabel;
	CLOSE cursorList;
	
END //

DELIMITER ;
set @list = '';
CALL ObtenerCustomers('Mexico',@list);
SELECT @list;


3)
Funcion 'inventory_in_stock':
Verifica la disponibilidad de una pelicula de una tienda especifica. Lo que hace el codigo es tomar 2 parametros de entrada, uno el 'film_id' y el otro 'store_id'. Luego se encarga de verificar si en la tabla inventory hay copias de la pelicula que le pasaste como parametro y si estas estan "en stock".Si encuentra alguna la funcion te devuelve 'TRUE' y si no encuentra devuelve 'False'.

Procedimiento 'film_in_stock':
Este procedimiento toma 2 parametros de entrada, el 'film_id' y el 'store_id'. El procedimiento utiliza la funcion 'inventory_in_stock' para verificar si la pelicula esta en stock en la tienda que pediste como parametro. Si la pelicula se encuentra en stock, el procedimiento puede realizar una accion relacionada como por ejemplo registrar un nuevo alquiler. Y si la pelicula no lo esta, el procedimiento puede realizar una accion difetente como por ejemplo, mostar un mensaje de error al usuario.




















