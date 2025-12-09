SELECT
    c.name AS category_name,
    AVG(
        DATE_PART('day', r.return_date - r.rental_date)
    ) AS avg_rental_days
FROM category AS c
JOIN film_category AS fc
    ON c.category_id = fc.category_id
JOIN inventory AS i
    ON fc.film_id = i.film_id
JOIN rental AS r
    ON i.inventory_id = r.inventory_id
GROUP BY c.category_id, c.name;