SELECT
    c.name AS category_name,
    COUNT(r.rental_id) AS rental_count,
    SUM(p.amount) AS total_amount
FROM category AS c
JOIN film_category AS fc
    ON c.category_id = fc.category_id
JOIN inventory AS i
    ON fc.film_id = i.film_id
JOIN rental AS r
    ON i.inventory_id = r.inventory_id
JOIN payment AS p
    ON r.rental_id = p.rental_id
GROUP BY c.category_id, c.name;
