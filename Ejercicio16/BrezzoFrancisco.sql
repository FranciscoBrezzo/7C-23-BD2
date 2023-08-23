1)
CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(60) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`)
);
INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle) 
VALUES 
  (1002, 'Murphy', 'Diane', 'x5800', 'dmurphy@classicmodelcars.com', '1', NULL, 'President'),
  (1056, 'Patterson', 'Mary', 'x4611', 'mpatterso@classicmodelcars.com', '1', 1002, 'VP Sales'),
  (1076, 'Firrelli', 'Jeff', 'x9273', 'jfirrelli@classicmodelcars.com', '1', 1002, 'VP Marketing');


INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUES (1043, 'Brezzo', 'Francisco', 'x5600', NULL, '1', 1002, 'Develop');

El email no puede ser null porque esta declarado como 'email' varchar (60) NOT NULL.

2)
a- Lo que pasa es que se restan 20 unidades a cada employeeNumber

b- En este caso no se puede sumarle 20 unidades porque ya exite un empleado con ese id entonces no pueden existir 2 con el mismo id

3)
ALTER TABLE employees
ADD COLUMN age INT CHECK (age >= 16 AND age <= 70);

4)
Esta tabla permite crear una relacion de muchos a muchos entre la tabla film y la tabla actor por lo que toma el rol de tabla intermedia

5)
ALTER TABLE employees
ADD COLUMN lastUpdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
ADD COLUMN lastUpdateUser VARCHAR(50);

DELIMITER //
CREATE TRIGGER employee_insert_trigger
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    SET NEW.lastUpdate = CURRENT_TIMESTAMP;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER employee_update_trigger
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    SET NEW.lastUpdate = CURRENT_TIMESTAMP;
END;
//
DELIMITER ;

6)
Show TRIGGERS;
Esto muestra los triggers

Ins_film 

BEGIN     INSERT INTO film_text (film_id, title, description)         VALUES (new.film_id, new.title, new.description);   END

Ins_film sirve para mantener sincronizados los datos entre las dos tablas.

Upd_film 

BEGIN     IF (old.title != new.title) OR (old.description != new.description) OR (old.film_id != new.film_id)     THEN         UPDATE film_text             SET title=new.title,                 description=new.description,                 film_id=new.film_id         WHERE film_id=old.film_id;     END IF;   END

Actualiza automáticamente los valores en la tabla film_text cuando se modifica una fila en otra tabla. 

Del_film 
BEGIN     DELETE FROM film_text WHERE film_id = old.film_id;   END

Borra automáticamente filas en la tabla film_text cuando se elimina una fila correspondiente en otra tabla. 














