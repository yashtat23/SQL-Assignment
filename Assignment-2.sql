CREATE TABLE salesman (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
   primary key(id),
   name VARCHAR(100) NOT NULL,
   city VARCHAR(100) NOT NULL,
   commission decimal(6,3) NOT NULL 
);

insert into salesman values(default,'varun','bhuj',10.123123);
insert into salesman values(default,'hardik','hmt',20.123);
insert into salesman values(default,'jay','anand',12.123);
insert into salesman values(default,'abhishek','changa',16.123);
insert into salesman values(default,'aniket','rajkot',17.123);
insert into salesman values(default,'kevel','rajkot',19.123);
insert into salesman values(default,'parth','surat',15.123);
insert into salesman values(default,'maharsh','valsad',8.123);
insert into salesman values(default,'henil','bharuch',5.123);
insert into salesman values(default,'soham','HMT',12.123);

SELECT * FROM salesman;

CREATE TABLE customer(
  id INT GENERATED ALWAYS AS IDENTITY ,
  CONSTRAINT pk_salesman PRIMARY KEY(id),
  cust_name VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  grade VARCHAR NOT null,
  salesman_id INT NOT NULL,
  CONSTRAINT fk_salesman
  FOREIGN KEY (salesman_id)
      REFERENCES salesman(id)
);

insert into customer values(default,'Kavan','idar','A',1);
insert into customer values(default,'jayesh','anand','B',2);
insert into customer values(default,'yes','rajkot','C',3);
insert into customer values(default,'keya','kutch','D',5);
insert into customer values(default,'Vrund','hmt','B',2);
insert into customer values(default,'anjan','bhavnagar','A',6);
insert into customer values(default,'jaykumar','rajkot','B',3);
insert into customer values(default,'Umang','idar','C',7);
insert into customer values(default,'Vatsal','rajkot','D',3);
insert into customer values(default,'Vanshita','porbandar','A',9);
insert into customer values(default,'vidhi','bhavnagar','A',5);

SELECT * FROM customer;

create table orders(
	id INT NOT NUll GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT pk_order PRIMARY KEY(id),
	purch_amt decimal NOT NULL,
	ord_date date NOT NULl,
	customer_id INT NOT NUll,
	salesman_id INT NOT NUll,
	CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
	  REFERENCES customer(id),
	CONSTRAINT fk_salesman
      FOREIGN KEY(salesman_id) 
	  REFERENCES salesman(id)
);

insert into orders values(default,5000,'2023-12-12',2,3);
insert into orders values(default,10000,'2023-12-12',2,3);
insert into orders values(default,15000,'2023-12-13',3,5);
insert into orders values(default,20000,'2023-12-15',4,7);
insert into orders values(default,25000,'2023-12-17',5,8);
insert into orders values(default,50000,'2023-12-19',2,2);
insert into orders values(default,15000,'2023-12-21',7,4);
insert into orders values(default,25000,'2023-12-25',6,6);
insert into orders values(default,35000,'2023-12-27',9,8);
insert into orders values(default,45000,'2023-12-29',10,10);
insert into orders values(default,50000,'2023-12-31',8,10);

SELECT * FROM orders;

-- 1
SELECT name,cust_name,salesman.city 
FROM salesman
INNER JOIN customer ON salesman.city = customer.city;

-- 2
SELECT orders.id,purch_amt,cust_name,customer.city 
FROM orders
INNER JOIN customer ON orders.id = customer.id  where orders.purch_amt BETWEEN 5000 AND 20000;

-- 3
SELECT name, commission, customer.cust_name,customer.city
FROM salesman
INNER JOIN customer ON salesman.id = customer.id;

-- 4
SELECT customer.cust_name,customer.city,name,commission
FROM salesman
INNER JOIN customer ON salesman.id = customer.id WHERE commission>0.12;

-- 5
SELECT customer.cust_name, customer.city, name, salesman.city ,commission
FROM salesman
INNER JOIN customer ON salesman.id = customer.id
WHERE (salesman.city <> customer.city) AND commission>0.12;

-- 6
SELECT orders.id,ord_date,purch_amt,cust_name,grade,name,commission
FROM orders
INNER JOIN customer ON orders.id = customer.id
INNER JOIN salesman ON orders.id = salesman.id;

-- 7
SELECT * FROM orders
NATURAL JOIN (SELECT name,city,commission FROM salesman)
NATURAL JOIN (SELECT cust_name,grade FROM customer);

-- 8
SELECT cust_name,customer.city,grade,salesman.name,salesman.city
FROM customer
LEFT JOIN salesman ON customer.id = salesman.id
ORDER BY customer.id ASC;

-- 9
SELECT cust_name,customer.city,grade,salesman.name,salesman.city
FROM customer
LEFT OUTER JOIN salesman ON salesman.id = customer.id
ORDER BY customer.id;

-- 10
SELECT cust_name,customer.city,orders.id,ord_date,purch_amt
FROM customer
LEFT OUTER JOIN orders ON customer.id = orders.id 
ORDER BY ord_date;

-- 11
SELECT cust_name,customer.city,orders.id,ord_date,purch_amt,salesman.name,commission
FROM customer
LEFT OUTER JOIN orders ON customer.id = orders.id
LEFT OUTER JOIN salesman ON customer.id = salesman.id;

-- 12
SELECT cust_name,customer.city,grade,salesman.name,salesman.city
FROM customer
RIGHT OUTER JOIN salesman ON customer.id = salesman.id
ORDER BY salesman.id;

-- 13
SELECT salesman.name,cust_name,customer.city,grade,orders.id,ord_date,purch_amt
FROM salesman
INNER JOIN customer ON customer.id=salesman.id
INNER JOIN orders ON salesman.id=orders.id;

-- 14
SELECT salesman.name,customer.cust_name,customer.city,grade,orders.id,ord_date,purch_amt
FROM customer
LEFT OUTER JOIN salesman ON customer.id = salesman.id
RIGHT OUTER JOIN orders ON customer.id = orders.id
WHERE purch_amt>2000 AND grade IS NOT NULL;

-- 15
SELECT salesman.name,customer.cust_name,customer.city,grade,orders.id,ord_date,purch_amt
FROM customer
LEFT OUTER JOIN salesman ON customer.id = salesman.id
RIGHT OUTER JOIN orders ON customer.id = orders.id
WHERE purch_amt>2000 AND grade IS NOT NULL;

-- 16
SELECT cust_name,customer.city,orders.id,ord_date,purch_amt,grade
FROM customer
INNER JOIN orders ON customer.id = orders.id
WHERE grade IS NOT NULL;

-- 17
SELECT * FROM salesman CROSS JOIN customer;

-- 18
SELECT * FROM salesman CROSS JOIN customer
WHERE salesman.city IS NOT NULL;

-- 19
SELECT * FROM salesman CROSS JOIN customer
WHERE salesman.city IS NOT NULL AND grade IS NOT NULL;

-- 20
SELECT * FROM salesman CROSS JOIN customer
WHERE salesman.city IS NOT NULL 
AND grade IS NOT NULL
AND salesman.city <> customer.city;