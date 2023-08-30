1)
SELECT a.address, c.city, co.country 
FROM address AS a 
JOIN city AS c ON a.city_id = c.city_id 
JOIN country AS co ON c.country_id = co.country_id 
WHERE a.postal_code IN ('12454', '26124', '31241');

0,00 seg /// 0,01 seg


SELECT a.address, c.city, co.country 
FROM address AS a 
JOIN city AS c ON a.city_id = c.city_id 
JOIN country AS co ON c.country_id = co.country_id 
WHERE a.postal_code NOT IN ('12454', '26124', '31241');

0,02 seg /// 0,01 seg


CREATE INDEX PostalCode ON address(postal_code);

Lo que sucede despues de agregar el index es que no tiene que recorrer campo por campo si no que va directamente al index.


2)
SELECT first_name 
FROM actor a;

SELECT last_name 
FROM actor a;

La diferencia es que la query de last_name se corre mas rapido debido a que en sakila existe un index para last_name.

3)
SELECT description
FROM film
WHERE description LIKE "%movie%"
ORDER BY description;

CREATE FULLTEXT INDEX FullText_idx ON film(description);

SELECT description
FROM film
WHERE MATCH(description) AGAINST("movie")
ORDER BY description;

En la primera query estamos usando like que lo usamos para buscar el texto especifico que le ponemos como paramentro en la 'description'
Y en la segunda query usamos MATCH que sirve para buscar texto en columnas indexadas de tipo FULLTEXT.









