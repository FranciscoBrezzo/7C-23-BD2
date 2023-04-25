1)
SELECT first_name, last_name
FROM actor a1
WHERE EXISTS (SELECT *
	      FROM actor a2
	      WHERE a1.last_name = a2.last_name
	      AND a1.actor_id <> a2.actor_id)
ORDER BY last_name;

2)
SELECT a.first_name, a.last_name
FROM actor a
WHERE NOT EXISTS (SELECT *
		  FROM film_actor fa
		  WHERE a.actor_id = fa.actor_id);

3)
SELECT c.first_name, c.last_name
FROM customer c
WHERE 1 = (SELECT COUNT(*)
	   FROM rental r
	   WHERE c.customer_id = r.customer_id);

4)
SELECT c.first_name, c.last_name
FROM customer c
WHERE 1 < (SELECT COUNT(*)
           FROM rental r
           WHERE c.customer_id = r.customer_id);

5)
SELECT a.first_name, a.last_name
FROM actor a
WHERE EXISTS (SELECT title
	      FROM film f
	      INNER JOIN film_actor fa ON f.film_id = fa.film_id
	      WHERE fa.film_id = f.film_id
	      AND fa.actor_id = a.actor_id
	      AND f.title = 'BETRAYED REAR'
	      OR f.title = 'CATCH AMISTAD');

6)
SELECT a.first_name, a.last_name
FROM actor a
WHERE EXISTS (SELECT title
              FROM film f
              INNER JOIN film_actor fa ON f.film_id = fa.film_id
              WHERE fa.film_id = f.film_id
              AND fa.actor_id = a.actor_id
              AND f.title = 'BETRAYED REAR')
AND NOT EXISTS (SELECT title
                FROM film f
                INNER JOIN film_actor fa ON f.film_id = fa.film_id
                WHERE fa.film_id = f.film_id
                AND fa.actor_id = a.actor_id
                AND f.title = 'CATCH AMISTAD');
              
7)
SELECT a.first_name, a.last_name
FROM actor a
WHERE EXISTS (SELECT title
              FROM film f
              INNER JOIN film_actor fa ON f.film_id = fa.film_id
              WHERE fa.film_id = f.film_id
              AND fa.actor_id = a.actor_id
              AND f.title = 'BETRAYED REAR')
AND EXISTS (SELECT title
                FROM film f
                INNER JOIN film_actor fa ON f.film_id = fa.film_id
                WHERE fa.film_id = f.film_id
                AND fa.actor_id = a.actor_id
                AND f.title = 'CATCH AMISTAD');

8)
SELECT a.first_name, a.last_name
FROM actor a
WHERE NOT EXISTS (SELECT title
                  FROM film f
                  INNER JOIN film_actor fa ON f.film_id = fa.film_id
                  WHERE fa.film_id = f.film_id
                  AND fa.actor_id = a.actor_id
                  AND (f.title = 'BETRAYED REAR'
                  OR f.title = 'CATCH AMISTAD')
                 );
