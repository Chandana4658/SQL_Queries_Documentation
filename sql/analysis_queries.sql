-- Caluclating Orders--

SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    o.quantity,
    p.price,
    o.quantity * p.price AS total_amount,
    o.status,
    o.order_date
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id
ORDER BY o.order_id;

--Calucalte orders for customers


SELECT
    c.customer_id,
    c.customer_name,
    COALESCE(
        SUM(o.quantity * p.price), 0
    ) AS total_order_amount
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LEFT JOIN products p
    ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_order_amount DESC;

-- no.of orders--

SELECT
    status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY status
ORDER BY total_orders DESC;

SELECT
    p.product_id,
    p.product_name,
    SUM(o.quantity * p.price) AS total_sales
FROM products p
INNER JOIN orders o
    ON p.product_id = o.product_id
WHERE o.status <> 'Cancelled'
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC
LIMIT 1;

SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
