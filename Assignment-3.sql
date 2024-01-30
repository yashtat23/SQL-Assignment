CREATE TABLE Department(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT pk_Department PRIMARY KEY (id),
	dept_name VARCHAR(30) NOT NULL
);

INSERT INTO Department (dept_name) VALUES ('IT');
INSERT INTO Department (dept_name) VALUES ('Technical');
INSERT INTO Department (dept_name) VALUES ('Git');
INSERT INTO Department (dept_name) VALUES ('Sales');
INSERT INTO Department (dept_name) VALUES ('Graphics');
INSERT INTO Department (dept_name) VALUES ('Marketing');
INSERT INTO Department (dept_name) VALUES ('Management');
INSERT INTO Department (dept_name) VALUES ('Administration');
										   
SELECT * FROM Department;

CREATE TABLE  Employee
 (
     id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	 CONSTRAINT pk_Employee PRIMARY KEY (id),
	 dept_id INT NOT NULL,
	 CONSTRAINT fk_Department FOREIGN KEY (id) REFERENCES Department(id),
	 mngr_id smallint NOT NULL, 
	 emp_name character varying(50),
	 salary DECIMAL(10,2)
);

INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (1,2,'Raj K',100000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (1,2,'Riya',90000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (2,2,'Raj C',80000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (2,2,'Rahul',70000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (3,2,'Shreyansh',60000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (3,2,'Priyank',50000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (4,2,'Aditi',40000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (4,2,'Sahil',30000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (5,2,'Pulkit',20000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (5,2,'Siddharth',10000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (6,2,'Krupal',15000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (6,2,'Brinda',25000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (7,2,'Happy',35000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (1,2,'Happy',45000);

SELECT * FROM Employee;

-- 1
SELECT emp_name,dept_id 
FROM Employee
WHERE salary IN (SELECT max(salary) FROM Employee GROUP BY dept_id);

-- 2
SELECT Department.id,dept_name
FROM Department
GROUP BY id HAVING COUNT (*) < 3;

-- 3
SELECT id, COUNT(*) FROM Employee
GROUP BY id;

-- 4
SELECT dept_id,SUM(salary) 
FROM Employee
GROUP BY dept_id;
