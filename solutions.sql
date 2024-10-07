-- This script contains solutions to the questions asked during the case study

-- 1) Which product has the highest price? Only return a single row.
SELECT product_id,
		product_name,
		MAX(price) AS price
FROM products
GROUP BY product_id,
			product_name
ORDER BY price DESC
LIMIT 1
  

-- 2)  Which customer has made the most orders?
SELECT customers.customer_id,
		CONCAT (customers.first_name, ' ', customers.last_name) AS customer_name,
		COUNT(orders.customer_id) AS total_orders
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id,
		customer_name
ORDER BY total_orders DESC 

  
-- 3) What's the total revenue per product?
SELECT products.product_id,
		products.product_name,
		SUM(products.price*order_items.quantity) AS Total_revenue
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY products.product_id,
		products.product_name
ORDER BY Total_revenue DESC

  
-- 4) Find the orders and revenue trend
SELECT 	orders.order_date,
		COUNT(orders.order_id) AS orders,
		SUM(products.price*order_items.quantity) AS total_revenue
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id
GROUP BY orders.order_date
ORDER BY total_revenue DESC

  
-- 5) Find the first order (by date) for each customer
	SELECT customers.customer_id,
			MIN(orders.order_date) AS first_order,
			CONCAT (first_name, ' ', last_name) AS customer_name
	FROM customers
	JOIN orders ON customers.customer_id = orders.customer_id
	GROUP BY customers.customer_id
	ORDER BY first_order ASC

OR with CTE

	SELECT customers.customer_id,
			MIN(orders.order_date) AS first_order,
			CONCAT (first_name, ' ', last_name) AS customer_name
	FROM customers
	JOIN orders ON customers.customer_id = orders.customer_id
	GROUP BY customers.customer_id
	ORDER BY first_order ASC

  
-- 6) Find the top 3 customers who have ordered the most distinct products
SELECT customers.customer_id,
		CONCAT(customers.first_name, ' ', customers.last_name) AS customer_name,
		COUNT(DISTINCT order_items.product_id) AS products_ordered
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id 
GROUP BY customers.customer_id,customer_name
ORDER BY products_ordered DESC
LIMIT 3


-- 7) Which product has been bought the highest & least in terms of quantity?
SELECT products.product_id,
       products.product_name,
       SUM(order_items.quantity) AS total_quantity
FROM order_items
JOIN products ON order_items.product_id = products.product_id
GROUP BY products.product_id, products.product_name
ORDER BY total_quantity DESC


-- 8) What is the median order total?
WITH order_total_cte AS (
	SELECT order_items.order_id,
			SUM(order_items.quantity*products.price) AS total_quantity
	FROM order_items
	JOIN products ON order_items.product_id = products.product_id
	GROUP BY order_items.order_id		
)
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_quantity) AS median_order_total
FROM order_total_cte


--9 For each order, determine if it was ‘Expensive’ (total over 300), ‘Affordable’ (total over 100), or ‘Cheap’.
SELECT order_items.order_id,
       SUM(order_items.quantity * products.price) AS total,
       CASE
           WHEN SUM(order_items.quantity * products.price) > 300 THEN 'Expensive'
           WHEN SUM(order_items.quantity * products.price) > 100 THEN 'Affordable'
           ELSE 'Cheap'
       END AS affordability
FROM order_items
JOIN products ON order_items.product_id = products.product_id
GROUP BY order_items.order_id

Option 2 – CTE
WITH order_totals AS (
    SELECT order_items.order_id,
           SUM(order_items.quantity * products.price) AS total
    FROM order_items
    JOIN products ON order_items.product_id = products.product_id
    GROUP BY order_items.order_id
)
SELECT order_id,
       total,
       CASE
           WHEN total > 300 THEN 'Expensive'
           WHEN total > 100 THEN 'Affordable'
           ELSE 'Cheap'
       END AS affordability
FROM order_totals;


--10 Find customers who have ordered the product with the highest price.
SELECT customers.customer_id,
       CONCAT(customers.first_name, ' ', customers.last_name) AS customer_name,
       MAX(products.price) AS order_price
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id
WHERE products.price = (
    SELECT MAX(price)
    FROM products
)
GROUP BY customers.customer_id, customer_name;


    SELECT MAX(price)
    FROM products
)
GROUP BY customers.customer_id, customer_name;
