4)
SELECT f.title 
FROM film f 
WHERE f.film_id NOT IN 
		(SELECT f1.film_id 
		 FROM film f1 
		 INNER JOIN inventory i ON f1.film_id = i.film_id);
		 
5)
SELECT f.title, i.inventory_id
FROM film f
INNER JOIN inventory i ON film.film_id = inventory.film_id
LEFT JOIN rental r ON inventory.inventory_id = rental.inventory_id
WHERE r.rental_id IS NULL;

6)
SELECT c.first_name, c.last_name, st.store_id, f.title, r.rental_date
FROM rental r
INNER JOIN customer c USING(customer_id)
INNER JOIN store st USING(store_id)
INNER JOIN inventory i USING(inventory_id)
INNER JOIN film f USING(film_id)
ORDER BY st.store_id, c.last_name;

7)
SELECT s.store_id, CONCAT(ci.city, ', ', co.country) AS `City and Country`, CONCAT(st.first_name, ' ', st.last_name) AS `First and Last Name`,
        		(SELECT SUM(p.amount)
            		 FROM payment p
            		 WHERE p.staff_id = s.manager_staff_id) AS `Total money`
FROM staff st
INNER JOIN store s ON st.staff_id = s.manager_staff_id
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city ci USING(city_id)
INNER JOIN country co USING(country_id);

8)
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS `Total films`
FROM actor a
INNER JOIN film_actor fa USING(actor_id)
GROUP BY fa.actor_id
ORDER BY `Total films` DESC
LIMIT 1;











 
