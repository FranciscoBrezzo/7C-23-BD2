1)
SELECT title, special_features
FROM film
WHERE rating = 'PG-13';

2)
SELECT title,length as 'Largo en minutos'
FROM film;

3)
SELECT title, rental_rate, replacement_cost 
FROM film
WHERE replacement_cost BETWEEN 20.00 and 24.00;

4)
SELECT f.title, f.rating, c.name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE special_features = 'Behind the Scenes';

5)
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'ZOOLANDER FICTION';

6) 
SELECT a.address, c.city, co.country
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id
WHERE s.store_id = '1';

7)
SELECT f1.title, f1.rating, f2.title, f2.rating 
FROM film f1, film f2 
WHERE f1.film_id <> f2.film_id and f1.rating = f2.rating;

8)
SELECT st.first_name, st.last_name,f.title 
FROM staff st
JOIN store s ON st.staff_id = s.store_id
JOIN inventory i ON s.store_id = i.store_id
JOIN film f ON i.film_id = f.film_id
WHERE s.store_id = '2';















