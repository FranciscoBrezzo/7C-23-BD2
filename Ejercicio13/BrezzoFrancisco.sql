1)
INSERT INTO
    customer (
        store_id,
        first_name,
        last_name,
        email,
        address_id,
        active
    )
SELECT
    1,
    'Francisco',
    'Brezzo',
    'fran.brezzo@gmail.com',
    MAX(ad.address_id),
    1
FROM address ad
WHERE ad.city_id IN (
        SELECT ci.city_id
        FROM
            country co,
            city ci
        WHERE
            co.country = "Argentina"
            AND co.country_id = ci.country_id
            AND ci.city_id = ad.city_id
    );

2)
INSERT INTO
    rental (
        rental_date,
        inventory_id,
        customer_id,
        return_date,
        staff_id
    )
SELECT CURRENT_TIMESTAMP, (
        SELECT
            MAX(i.inventory_id)
        FROM inventory i
            INNER JOIN film f USING(film_id)
        WHERE
            f.title LIKE 'Academy Dinosaur'
    ),
    1,
    NULL, (
        SELECT
            manager_staff_id
        FROM store
        WHERE store_id = 2
        ORDER BY RAND()
        LIMIT 1
    );

3) 
UPDATE film SET release_year = 2001 WHERE rating ='G';

UPDATE film SET release_year = 2023 WHERE rating = 'PG';

UPDATE film SET release_year = 2022 WHERE rating ='NC-17';

UPDATE film SET release_year = 2021 WHERE rating ='PG-13';

UPDATE film SET release_year = 2020 WHERE rating = 'R';

4)
SELECT
    r.rental_id,
    r.return_date
FROM film f
    INNER JOIN inventory i USING(film_id)
    INNER JOIN rental r USING(inventory_id)
WHERE r.return_date IS NULL
	ORDER BY r.rental_date DESC
	LIMIT 5;
UPDATE rental
SET
    return_date = CURRENT_TIMESTAMP
WHERE rental_id = 16057;

5)
SELECT * FROM film ORDER BY film_id LIMIT 1;

DELETE FROM film WHERE title = 'Academy Dinosaur';

DELETE FROM rental
WHERE inventory_id IN (
        SELECT inventory_id
        FROM inventory
        WHERE film_id = (
                SELECT
                    film_id
                FROM film
                WHERE
                    title = 'Academy Dinosaur'
            )
    );

DELETE FROM inventory
WHERE film_id = (
        SELECT film_id
        FROM film
        WHERE
            title = 'Academy Dinosaur'
    );

DELETE FROM film_category
WHERE film_id = (
        SELECT film_id
        FROM film
        WHERE
            title = 'Academy Dinosaur'
    );

DELETE FROM film_actor
WHERE film_id = (
        SELECT film_id
        FROM film
        WHERE
            title = 'Academy Dinosaur'
    );
DELETE FROM film WHERE title = 'Academy Dinosaur';

6)
SELECT inventory_id, film_id
FROM inventory i
WHERE inventory_id NOT IN (
        SELECT inventory_id
        FROM inventory
            INNER JOIN rental USING (inventory_id)
        WHERE
            return_date IS NULL
    );

INSERT INTO
    rental (
        rental_date,
        inventory_id,
        customer_id,
        staff_id
    )
VALUES (
        CURRENT_DATE(),
        5123, (
            SELECT
                customer_id
            FROM customer
            ORDER BY
                customer_id DESC
            LIMIT 1
        ), (
            SELECT staff_id
            FROM staff
            WHERE store_id = (
                    SELECT
                        store_id
                    FROM
                        inventory
                    WHERE
                        inventory_id = 5123
                )
        )
    );

INSERT INTO
    payment (
        customer_id,
        staff_id,
        rental_id,
        amount,
        payment_date
    )
VALUES( (
            SELECT customer_id
            FROM customer
            ORDER BY customer_id DESC
            LIMIT 1
        ), (
            SELECT staff_id
            FROM staff
            LIMIT 1
        ), (
            SELECT rental_id
            FROM rental
            ORDER BY rental_id DESC
            LIMIT 1
        ), (
            SELECT rental_rate
            FROM film
            WHERE
                film_id = 400
        ),
        CURRENT_DATE()
    );
