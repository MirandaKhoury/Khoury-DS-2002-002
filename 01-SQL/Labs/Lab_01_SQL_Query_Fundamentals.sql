-- ------------------------------------------------------------------
-- Miranda Khoury (mrk6xcb), Lab 01
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
-- 0). First, How Many Rows are in the Products Table?
-- ------------------------------------------------------------------
SELECT * FROM northwind.products;
SELECT COUNT(`id`) AS Num_Products FROM northwind.products;
-- ------------------------------------------------------------------
-- 1). Product Name and Unit/Quantity
-- ------------------------------------------------------------------
SELECT product_name
	, quantity_per_unit
FROM northwind.products;
-- ------------------------------------------------------------------
-- 2). Product ID and Name of Current Products
-- ------------------------------------------------------------------
SELECT id AS "Product ID",
	product_name AS "Product Name"
FROM northwind.products
WHERE discontinued = 0;
-- ------------------------------------------------------------------
-- 3). Product ID and Name of Discontinued Products
-- ------------------------------------------------------------------
SELECT id AS "Product ID",
	product_name AS "Product Name"
FROM northwind.products
WHERE discontinued != 0;
-- ------------------------------------------------------------------
-- 4). Name & List Price of Most & Least Expensive Products
-- ------------------------------------------------------------------
SELECT list_price
	, product_name
FROM northwind.products
WHERE list_price = (SELECT MIN(list_price) FROM northwind.products)
	OR list_price = (SELECT MAX(list_price) FROM northwind.products);
-- ------------------------------------------------------------------
-- 5). Product ID, Name & List Price Costing Less Than $20
-- ------------------------------------------------------------------
SELECT id
	, product_name
	, list_price
FROM northwind.products
WHERE list_price < 20.00
ORDER BY list_price DESC;
-- ------------------------------------------------------------------
-- 6). Product ID, Name & List Price Costing Between $15 and $20
-- ------------------------------------------------------------------
SELECT id
	, product_name
	, list_price
FROM northwind.products
WHERE list_price BETWEEN 15.00 AND 20.00
ORDER BY list_price DESC;
-- ------------------------------------------------------------------
-- 7). Product Name & List Price Costing Above Average List Price
-- ------------------------------------------------------------------
SELECT product_name
	, list_price
FROM northwind.products
WHERE list_price > (SELECT avg(list_price) FROM northwind.products)
ORDER BY list_price DESC;
-- ------------------------------------------------------------------
-- 8). Product Name & List Price of 10 Most Expensive Products 
-- ------------------------------------------------------------------
SELECT product_name
	, list_price
FROM northwind.products
ORDER BY list_price DESC
LIMIT 10;
-- ------------------------------------------------------------------ 
-- 9). Count of Current and Discontinued Products 
-- ------------------------------------------------------------------
UPDATE northwind.products SET discontinued = 1 WHERE id = 95;

# SELECT COUNT(`id`) AS "Number Current Products"
# FROM northwind.products
# WHERE discontinued = 0;

# SELECT COUNT(`id`) AS "Number Discontinued Products"
# FROM northwind.products
# WHERE discontinued = 1;

SELECT CASE discontinued
	WHEN 1 THEN 'yes'
	ELSE 'no'
END AS is_discontinued
, COUNT(*) as product_count
FROM northwind.products
GROUP BY discontinued;
-- ------------------------------------------------------------------
-- 10). Product Name, Units on Order and Units in Stock
--      Where Quantity In-Stock is Less Than the Quantity On-Order. 
-- ------------------------------------------------------------------


-- ------------------------------------------------------------------
-- EXTRA CREDIT -----------------------------------------------------
-- ------------------------------------------------------------------


-- ------------------------------------------------------------------
-- 11). Products with Supplier Company & Address Info
-- ------------------------------------------------------------------



-- ------------------------------------------------------------------
-- 12). Number of Products per Category With Less Than 5 Units
-- ------------------------------------------------------------------



-- ------------------------------------------------------------------
-- 13). Number of Products per Category Priced Less Than $20.00
-- ------------------------------------------------------------------
