SELECT
    co.country AS country_name,
    COUNT(DISTINCT cu.customer_id) AS customer_count,
    SUM(p.amount) AS total_amount
FROM country AS co
JOIN city AS ci
    ON co.country_id = ci.country_id
JOIN address AS ad
    ON ci.city_id = ad.city_id
JOIN customer AS cu
    ON ad.address_id = cu.address_id
JOIN payment AS p
    ON cu.customer_id = p.customer_id
GROUP BY co.country_id, co.country;