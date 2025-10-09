UPDATE production.brands
SET brand_name = CASE brand_id
    WHEN 1 THEN 'Jaguar'
    WHEN 2 THEN 'Cougar'
    WHEN 3 THEN 'Puma'
    WHEN 4 THEN 'Cheetah'
    WHEN 5 THEN 'Cat'
    WHEN 6 THEN 'Taffy'
    WHEN 7 THEN 'Farm'
    WHEN 8 THEN 'Produce'
    WHEN 9 THEN 'Sour'
END
WHERE brand_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9);

SELECT 
brand_id AS "Brand",
brand_name AS "Name"
FROM production.brands

SELECT 
customer_id AS "Cust ID",
last_name AS "Last Name",
first_name AS "First Name",
email AS "Email",
street AS "Street Address",
city AS "City",
State AS "State"
FROM sales.customers
WHERE city IN ('Bronx', 'Brooklyn')
ORDER BY city ASC, last_name ASC;

SELECT 
product_id AS "Id",
product_name AS "Product name",
brand_id AS "Brand",
category_id AS "Category",
model_year AS "Model year",
list_price AS "List price"
FROM production.products
ORDER BY Product_name DESC;

SELECT COUNT(*) AS "NY Customers"
FROM sales.customers
WHERE state = 'NY';

SELECT
product_name AS "Product name", 
brand_id AS "Brand", 
p.list_price AS "Price"
FROM production.products p
JOIN sales.order_items oi ON p.product_id = oi.product_id
JOIN sales.orders o ON oi.order_id = o.order_id
JOIN sales.customers c ON o.customer_id = c.customer_id
WHERE first_name = 'Pamala'
  AND last_name = 'Henry'
  AND city = 'Bronx'
  AND state = 'NY'
  ORDER BY Product_name ASC;
