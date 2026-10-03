-- =====================================================
-- QUERY 1: TOTAL NET REVENUE
-- =====================================================

SELECT
    SUM(
        CASE
            WHEN returned = 1 THEN 0
            ELSE quantity * unit_price * (1 - discount)
        END
    ) AS total_net_revenue
FROM orders
WHERE quantity > 0
AND unit_price >= 0;


-- =====================================================
-- QUERY 2: TOP 10 CUSTOMERS
-- =====================================================

SELECT
    c.customer_name,
    c.city,
    COUNT(DISTINCT o.order_id) AS number_of_orders,

    SUM(
        CASE
            WHEN o.returned = 1 THEN 0
            ELSE o.quantity * o.unit_price * (1 - o.discount)
        END
    ) AS total_spending

FROM customers c

JOIN orders o
ON c.customer_id = o.customer_id

WHERE o.quantity > 0
AND o.unit_price >= 0

GROUP BY
    c.customer_id,
    c.customer_name,
    c.city

ORDER BY total_spending DESC

LIMIT 10;


-- =====================================================
-- QUERY 3: CATEGORY ANALYSIS
-- =====================================================

SELECT
    p.category,

    SUM(
        CASE
            WHEN o.returned = 1 THEN 0
            ELSE o.quantity * o.unit_price * (1 - o.discount)
        END
    ) AS revenue,

    COUNT(DISTINCT o.order_id) AS order_count,

    SUM(o.quantity) AS quantity_sold

FROM orders o

JOIN products p
ON o.product_id = p.product_id

WHERE o.quantity > 0
AND o.unit_price >= 0

GROUP BY p.category

ORDER BY revenue DESC;


-- =====================================================
-- QUERY 4: MONTHLY REVENUE
-- =====================================================

SELECT
    strftime('%Y-%m', order_date) AS month,

    SUM(
        CASE
            WHEN returned = 1 THEN 0
            ELSE quantity * unit_price * (1 - discount)
        END
    ) AS revenue

FROM orders

WHERE quantity > 0
AND unit_price >= 0

GROUP BY month

ORDER BY month;


-- =====================================================
-- QUERY 5: TOP 5 PRODUCTS
-- =====================================================

SELECT
    p.product_name,
    p.category,

    SUM(
        CASE
            WHEN o.returned = 1 THEN 0
            ELSE o.quantity * o.unit_price * (1 - o.discount)
        END
    ) AS net_revenue

FROM orders o

JOIN products p
ON o.product_id = p.product_id

WHERE o.quantity > 0
AND o.unit_price >= 0

GROUP BY
    p.product_id,
    p.product_name,
    p.category

ORDER BY net_revenue DESC

LIMIT 5;