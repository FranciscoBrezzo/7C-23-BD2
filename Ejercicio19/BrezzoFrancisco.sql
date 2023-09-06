1)
CREATE USER 'data_analyst'@'localhost' IDENTIFIED BY 'pepe1234';

2)
GRANT SELECT, UPDATE, DELETE ON sakila.* TO 'data_analyst'@'localhost';

3)
CREATE TABLE test (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(255)
);

RESULTADO:
ERROR 1142 (42000): CREATE command denied to user 'data_analyst'@'localhost' for table 'test'

4)
UPDATE sakila.film
SET title = 'Harry Potter y el cáliz de fuego'
WHERE film_id = 1;

5)
REVOKE UPDATE ON sakila.* FROM 'data_analyst'@'localhost';

6)
UPDATE sakila.film
SET title = 'Harry Potter y el cáliz de fuego'
WHERE film_id = 1;

RESULTADO:
ERROR 1142 (42000): UPDATE command denied to user 'data_analyst'@'localhost' for table 'film'

