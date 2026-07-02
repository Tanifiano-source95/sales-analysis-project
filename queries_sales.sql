SELECT country, total,
CASE
    WHEN total > 1000000 THEN 'Top Market'
    WHEN total > 800000 THEN 'Growing Market'
    ELSE 'Small Market'
END as market_type
FROM (
    SELECT customers.country, SUM(order_items.total_price) as total
    FROM order_items
    JOIN orders ON order_items.order_id = orders.order_id
    JOIN customers ON orders.customer_id = customers.customer_id
    GROUP BY customers.country
)