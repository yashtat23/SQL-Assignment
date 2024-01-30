CREATE TABLE orders1 (
    order_id smallint NOT NULL,
    customer_id character varying(5),
    employee_id smallint,
    order_date date,
    required_date date,
    shipped_date date,
    ship_via smallint,
    freight real,
    ship_name character varying(40),
    ship_address character varying(60),
    ship_city character varying(15),
    ship_region character varying(15),
    ship_postal_code character varying(10),
    ship_country character varying(15)
);

CREATE TABLE employees1 (
    employee_id smallint NOT NULL,
    last_name character varying(20) NOT NULL,
    first_name character varying(10) NOT NULL,
    title character varying(30),
    title_of_courtesy character varying(25),
    birth_date date,
    hire_date date,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    home_phone character varying(24),
    extension character varying(4),
    photo bytea,
    notes text,
    reports_to smallint,
    photo_path character varying(255)
);

CREATE TABLE order_details1 (
    order_id smallint NOT NULL,
    product_id smallint NOT NULL,
    unit_price real NOT NULL,
    quantity smallint NOT NULL,
    discount real NOT NULL
);

CREATE TABLE products1 (
    product_id smallint NOT NULL,
    product_name character varying(40) NOT NULL,
    supplier_id smallint,
    category_id smallint,
    quantity_per_unit character varying(20),
    unit_price real,
    units_in_stock smallint,
    units_on_order smallint,
    reorder_level smallint,
    discontinued integer NOT NULL
);

CREATE TABLE categories1 (
    category_id smallint NOT NULL,
    category_name character varying(15) NOT NULL,
    description text,
    picture bytea
);

INSERT INTO orders1 VALUES (10248, 'VINET', 5, '1996-07-04', '1996-08-01', '1996-07-16', 3, 32.3800011, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders1 VALUES (10249, 'TOMSP', 6, '1996-07-05', '1996-08-16', '1996-07-10', 1, 11.6099997, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
INSERT INTO orders1 VALUES (10250, 'HANAR', 4, '1996-07-08', '1996-08-05', '1996-07-12', 2, 65.8300018, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders1 VALUES (10251, 'VICTE', 3, '1996-07-08', '1996-08-05', '1996-07-15', 1, 41.3400002, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders1 VALUES (10252, 'SUPRD', 4, '1996-07-09', '1996-08-06', '1996-07-11', 2, 51.2999992, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders1 VALUES (10253, 'HANAR', 3, '1996-07-10', '1996-07-24', '1996-07-16', 2, 58.1699982, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders1 VALUES (10254, 'CHOPS', 5, '1996-07-11', '1996-08-08', '1996-07-23', 2, 22.9799995, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders1 VALUES (10255, 'RICSU', 9, '1996-07-12', '1996-08-09', '1996-07-15', 3, 148.330002, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO orders1 VALUES (10256, 'WELLI', 3, '1996-07-15', '1996-08-12', '1996-07-17', 2, 13.9700003, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders1 VALUES (10257, 'HILAA', 4, '1996-07-16', '1996-08-13', '1996-07-22', 3, 81.9100037, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');

SELECT * FROM orders1;

INSERT INTO employees1 VALUES (1, 'Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-08', '1992-05-01', '507 - 20th Ave. E.\nApt. 2A', 'Seattle', 'WA', '98122', 'USA', '(206) 555-9857', '5467', '\x', 'Education includes a BA in psychology from Colorado State University in 1970.  She also completed The Art of the Cold Call.  Nancy is a member of Toastmasters International.', 2, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees1 VALUES (2, 'Fuller', 'Andrew', 'Vice President, Sales', 'Dr.', '1952-02-19', '1992-08-14', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'USA', '(206) 555-9482', '3457', '\x', 'Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative, was promoted to sales manager in January 1992 and to vice president of sales in March 1993.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.', NULL, 'http://accweb/emmployees/fuller.bmp');
INSERT INTO employees1 VALUES (3, 'Leverling', 'Janet', 'Sales Representative', 'Ms.', '1963-08-30', '1992-04-01', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'USA', '(206) 555-3412', '3355', '\x', 'Janet has a BS degree in chemistry from Boston College (1984).  She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.', 2, 'http://accweb/emmployees/leverling.bmp');
INSERT INTO employees1 VALUES (4, 'Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '1937-09-19', '1993-05-03', '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 'USA', '(206) 555-8122', '5176', '\x', 'Margaret holds a BA in English literature from Concordia College (1958) and an MA from the American Institute of Culinary Arts (1966).  She was assigned to the London office temporarily from July through November 1992.', 2, 'http://accweb/emmployees/peacock.bmp');
INSERT INTO employees1 VALUES (5, 'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '1955-03-04', '1993-10-17', '14 Garrett Hill', 'London', NULL, 'SW1 8JR', 'UK', '(71) 555-4848', '3453', '\x', 'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree in 1976.  Upon joining the company as a sales representative in 1992, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London.  He was promoted to sales manager in March 1993.  Mr. Buchanan has completed the courses Successful Telemarketing and International Sales Management.  He is fluent in French.', 2, 'http://accweb/emmployees/buchanan.bmp');
INSERT INTO employees1 VALUES (6, 'Suyama', 'Michael', 'Sales Representative', 'Mr.', '1963-07-02', '1993-10-17', 'Coventry House\nMiner Rd.', 'London', NULL, 'EC2 7JR', 'UK', '(71) 555-7773', '428', '\x', 'Michael is a graduate of Sussex University (MA, economics, 1983) and the University of California at Los Angeles (MBA, marketing, 1986).  He has also taken the courses Multi-Cultural Selling and Time Management for the Sales Professional.  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees1 VALUES (7, 'King', 'Robert', 'Sales Representative', 'Mr.', '1960-05-29', '1994-01-02', 'Edgeham Hollow\nWinchester Way', 'London', NULL, 'RG1 9SP', 'UK', '(71) 555-5598', '465', '\x', 'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan in 1992, the year he joined the company.  After completing a course entitled Selling in Europe, he was transferred to the London office in March 1993.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees1 VALUES (8, 'Callahan', 'Laura', 'Inside Sales Coordinator', 'Ms.', '1958-01-09', '1994-03-05', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 'USA', '(206) 555-1189', '2344', '\x', 'Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.', 2, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees1 VALUES (9, 'Dodsworth', 'Anne', 'Sales Representative', 'Ms.', '1966-01-27', '1994-11-15', '7 Houndstooth Rd.', 'London', NULL, 'WG2 7LT', 'UK', '(71) 555-4444', '452', '\x', 'Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.', 5, 'http://accweb/emmployees/davolio.bmp');

SELECT * FROM employees1;

INSERT INTO order_details1 VALUES (10458, 26, 24.8999996, 30, 0);
INSERT INTO order_details1 VALUES (10458, 28, 36.4000015, 30, 0);
INSERT INTO order_details1 VALUES (10458, 43, 36.7999992, 20, 0);
INSERT INTO order_details1 VALUES (10458, 56, 30.3999996, 15, 0);
INSERT INTO order_details1 VALUES (10458, 71, 17.2000008, 50, 0);
INSERT INTO order_details1 VALUES (10459, 7, 24, 16, 0.0500000007);
INSERT INTO order_details1 VALUES (10459, 46, 9.60000038, 20, 0.0500000007);
INSERT INTO order_details1 VALUES (10459, 72, 27.7999992, 40, 0);
INSERT INTO order_details1 VALUES (10460, 68, 10, 21, 0.25);
INSERT INTO order_details1 VALUES (10460, 75, 6.19999981, 4, 0.25);
INSERT INTO order_details1 VALUES (10461, 21, 8, 40, 0.25);
INSERT INTO order_details1 VALUES (10461, 30, 20.7000008, 28, 0.25);
INSERT INTO order_details1 VALUES (10461, 55, 19.2000008, 60, 0.25);
INSERT INTO order_details1 VALUES (10462, 13, 4.80000019, 1, 0);
INSERT INTO order_details1 VALUES (10462, 23, 7.19999981, 21, 0);
INSERT INTO order_details1 VALUES (10463, 19, 7.30000019, 21, 0);
INSERT INTO order_details1 VALUES (10463, 42, 11.1999998, 50, 0);

SELECT * FROM order_details1;

INSERT INTO products1 VALUES (26, 'Gumbär Gummibärchen', 11, 3, '100 - 250 g bags', 31.2299995, 15, 0, 0, 0);
INSERT INTO products1 VALUES (27, 'Schoggi Schokolade', 11, 3, '100 - 100 g pieces', 43.9000015, 49, 0, 30, 0);
INSERT INTO products1 VALUES (28, 'Rössle Sauerkraut', 12, 7, '25 - 825 g cans', 45.5999985, 26, 0, 0, 1);
INSERT INTO products1 VALUES (29, 'Thüringer Rostbratwurst', 12, 6, '50 bags x 30 sausgs.', 123.790001, 0, 0, 0, 1);
INSERT INTO products1 VALUES (30, 'Nord-Ost Matjeshering', 13, 8, '10 - 200 g glasses', 25.8899994, 10, 0, 15, 0);
INSERT INTO products1 VALUES (31, 'Gorgonzola Telino', 14, 4, '12 - 100 g pkgs', 12.5, 0, 70, 20, 0);
INSERT INTO products1 VALUES (32, 'Mascarpone Fabioli', 14, 4, '24 - 200 g pkgs.', 32, 9, 40, 25, 0);
INSERT INTO products1 VALUES (33, 'Geitost', 15, 4, '500 g', 2.5, 112, 0, 20, 0);
INSERT INTO products1 VALUES (34, 'Sasquatch Ale', 16, 1, '24 - 12 oz bottles', 14, 111, 0, 15, 0);
INSERT INTO products1 VALUES (35, 'Steeleye Stout', 16, 1, '24 - 12 oz bottles', 18, 20, 0, 15, 0);
INSERT INTO products1 VALUES (36, 'Inlagd Sill', 17, 8, '24 - 250 g  jars', 19, 112, 0, 20, 0);
INSERT INTO products1 VALUES (37, 'Gravad lax', 17, 8, '12 - 500 g pkgs.', 26, 11, 50, 25, 0);
INSERT INTO products1 VALUES (38, 'Côte de Blaye', 18, 1, '12 - 75 cl bottles', 263.5, 17, 0, 15, 0);
INSERT INTO products1 VALUES (39, 'Chartreuse verte', 18, 1, '750 cc per bottle', 18, 69, 0, 5, 0);
INSERT INTO products1 VALUES (40, 'Boston Crab Meat', 19, 8, '24 - 4 oz tins', 18.3999996, 123, 0, 30, 0);
INSERT INTO products1 VALUES (41, 'Jack''s New England Clam Chowder', 19, 8, '12 - 12 oz cans', 9.64999962, 85, 0, 10, 0);
INSERT INTO products1 VALUES (42, 'Singaporean Hokkien Fried Mee', 20, 5, '32 - 1 kg pkgs.', 14, 26, 0, 0, 1);
INSERT INTO products1 VALUES (43, 'Ipoh Coffee', 20, 1, '16 - 500 g tins', 46, 17, 10, 25, 0);

SELECT * FROM products1;

INSERT INTO categories1 VALUES (1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales', '\x');
INSERT INTO categories1 VALUES (2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings', '\x');
INSERT INTO categories1 VALUES (3, 'Confections', 'Desserts, candies, and sweet breads', '\x');
INSERT INTO categories1 VALUES (4, 'Dairy Products', 'Cheeses', '\x');
INSERT INTO categories1 VALUES (5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal', '\x');
INSERT INTO categories1 VALUES (6, 'Meat/Poultry', 'Prepared meats', '\x');
INSERT INTO categories1 VALUES (7, 'Produce', 'Dried fruit and bean curd', '\x');
INSERT INTO categories1 VALUES (8, 'Seafood', 'Seaweed and fish', '\x');

SELECT * FROM categories1;

-- 7
create or replace procedure UpdateOrder_details1(
   a INT,
   b decimal 
)
language SQL    
as $$
    update order_details1 
    set  unit_price = b 
    where order_id = a;
$$

call UpdateOrder(10458,49.2)
SELECT * FROM order_details1;


-- 6
CREATE PROCEDURE insert_order_details(a smallint,b smallint,c real,d smallint,e real )
LANGUAGE SQL
AS $$
INSERT INTO order_details1 VALUES (a,b,c,d,e);
$$;

call insert_order_details(1::smallint, 1::smallint, 1::real, 1::smallint, 0.05::real)
select *from order_details1;


-- 5
create or replace function Top_Ten_Order1() returns setof products1 as
$BODY$
DECLARE
    r products1%rowtype;
BEGIN
for r in 
    SELECT  *FROM products1 ORDER BY unit_price DESC LIMIT 10
	LOOP
        -- can do some processing here
        RETURN NEXT r; -- return current row of SELECT
    END LOOP;
    RETURN;
END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM Top_Ten_Order1();


-- 4
create or replace FUNCTION sales_by_category1(ctgr varchar)
  returns table(
  	category_name varchar,
    description text
  )
AS $$
begin
	return query
	select 
		categories1.category_name, categories1.description 
	from 
		categories1
	where 
		categories1.category_name =ctgr;
  	 
end;
$$ LANGUAGE plpgsql;

select * from sales_by_category1('Beverages');

-- 3
create or replace FUNCTION sales_by_year2(yr numeric)
returns table(
	sale_year numeric,
	ship_country varchar
)
AS $$

begin 
	return query
	select 
		extract(year from shipped_date) as sale_year,
		orders1.ship_country
	from 
		orders1
	where
		extract(year from shipped_date) = yr
	order by sale_year;
	
end;
$$ LANGUAGE plpgsql;

select * from sales_by_year2(1996);

-- 2
create or replace FUNCTION sales_by_country(cntry varchar)
  returns table(
  	Country varchar,
	last_name varchar,
	first_name varchar,
	shipped_date date,
	order_id smallint
  )
AS $$
begin
	return query
  	 SELECT
      Employees1.Country,
      Employees1.Last_Name,
      Employees1.First_Name,
      Orders1.Shipped_Date,
      Orders1.Order_ID
      
   FROM Employees1
      INNER JOIN Orders1 ON Employees1.Employee_ID = Orders1.Employee_ID
   WHERE employees1.country=cntry;

end;
$$ LANGUAGE plpgsql;

select * from sales_by_country('USA');

-- 1
CREATE OR REPLACE PROCEDURE insert_orders_with_check(order_id_input int,
													 customer_id_input character varying, 
													 employee_id_input int, 
													 order_date_input date, 
													 required_date_input date, 
													 shipped_date_input date, 
													 ship_via_input int, 
													 freight_input numeric,
													 ship_name_input character varying,
													 ship_address_input character varying, 
													 ship_city_input character varying, 
													 ship_region_input character varying, 
													 ship_postal_code_input int, 
													 ship_country_input character varying)
LANGUAGE plpgsql
AS $$
DECLARE
    avg_freight real;
BEGIN
    SELECT AVG(orders1.freight) INTO avg_freight
    FROM orders1
	WHERE orders1.customer_id = insert_orders_with_check.customer_id_input;

    IF freight_input > avg_freight THEN
        RAISE EXCEPTION 'Freight exceeds average freight for the customer.';
    ELSE
        INSERT INTO orders1 (order_id,
							customer_id,
							employee_id, 
							order_date, 
							required_date, 
							shipped_date, 
							ship_via, 
							freight, 
							ship_name, 
							ship_address, 
							ship_city, 
							ship_region, 
							ship_postal_code, 
							ship_country) 
        VALUES (order_id_input,
				customer_id_input, 
				employee_id_input, 
				order_date_input, 
				required_date_input, 
				shipped_date_input, 
				ship_via_input, 
				freight_input, 
				ship_name_input, 
				ship_address_input,
				ship_city_input, 
				ship_region_input, 
				ship_postal_code_input, 
				ship_country_input);
    END IF;
END;
$$;

CALL insert_orders_with_check(
    10247, 
    'YASH', 
    5,
    CAST ('2024-01-25' AS DATE), 
	CAST ('2024-02-05' AS DATE),
	CAST ('2024-02-05' AS DATE),
    1,
    500.00, 
	'Hanari Carnes',
	'Rua do Paço, 67',
	'Rio de Janeiro',
	'RJ',
    05454-876, 
	'Surat' 
);
select * from orders1;