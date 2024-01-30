SELECT product_id, product_name, unit_price FROM products WHERE unit_price<20;

SELECT product_id, product_name, unit_price FROM products WHERE unit_price BETWEEN 15 AND 25;

SELECT DISTINCT product_name, unit_price FROM products WHERE unit_price > (SELECT avg(unit_price) FROM products);

SELECT product_name,unit_price FROM products ORDER BY unit_price DESC LIMIT 10;

SELECT Count(product_name) FROM products GROUP BY Discontinued;

SELECT product_name, units_on_order, units_in_stock FROM products WHERE (((Discontinued)=0) AND ((units_in_stock<units_on_order)));																	 