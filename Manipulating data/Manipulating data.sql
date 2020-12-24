#The INSERT operation
#Inserting One Row of Data into a Table
CREATE DATABASE EMPLOYEE;
USE EMPLOYEE;
CREATE TABLE department (
    departmentNo INT PRIMARY KEY,
    departmentName VARCHAR(20) NOT NULL,
    departmentLoc VARCHAR(50) NOT NULL
); 
INSERT INTO department (
    departmentNo,
    departmentName,
    departmentLoc
)
VALUES (
    2,
    'Engg',
    'Texas'
); 

#Multiple Inserts
#Specifying Default Values
DROP TABLE IF EXISTS department;
CREATE TABLE department (
    departmentNo INT PRIMARY KEY AUTO_INCREMENT,
    departmentName VARCHAR(20) NOT NULL,
    departmentLoc VARCHAR(50) DEFAULT 'NJ',
    departmentEstDate DATETIME DEFAULT NOW()
);  
INSERT INTO department (
    departmentName
)
VALUES (
    'MyDepartment'
); 
INSERT INTO department (
    departmentName,
    departmentLoc)
VALUES
(
    'Administration',
    DEFAULT
),
(
    'IT',
    DEFAULT
); 
INSERT INTO department (
    departmentName,
    departmentLoc)
VALUES
(
    'Administration',
    'NYC'
); 

#Using an INSERT Statement to Add Data from Another Dataset
CREATE TABLE departmentdemo AS 
	SELECT *
	FROM department;

#The DELETE operation
#Deleting a record from a table
USE packt_online_shop;
DELETE FROM newproducts     
WHERE ProductName = 'tomato sauce';

#The ALTER Operation
#Rename table
ALTER TABLE departmentdemo RENAME TO departmentcopy;

#Manipulating the Auto-Increment Values in a Table
DELETE FROM department WHERE departmentNo>2;
INSERT INTO department(departmentname, departmentloc)
VALUES('Sales', 'LV'); #the auto-increment value starts at 5 rather than 3

DELETE FROM department WHERE departmentNo=5;
ALTER TABLE department AUTO_INCREMENT=3; #reset the auto-increment col to 3
INSERT INTO department(departmentname, departmentloc)
VALUES('Sales', 'LV');
SELECT * FROM department;

#The UPDATE Operation
UPDATE employees 
SET	Email = 'Ava-May.Rodgers@awesomenes.com' 
WHERE empno = 3;

#The Basic UPDATE Statement
UPDATE department 
	SET departmentEstDate=now();
UPDATE department 
	SET departmentloc='GA', departmentEstDate=now() + INTERVAL 1 day;

#ALIASING
UPDATE department D #shorthand for table
	SET D.departmentLoc='NYC',
	D.departmentEstDate = Now()+ INTERVAL 1 DAY;

#Conditional Update of Records
UPDATE employees e 
	SET comm=2000 
    where departno=3;

#Limiting the Records Using an UPDATE Statement
UPDATE employees SET comm=1000
WHERE empno IN (
	SELECT empno FROM (
    SELECT empno FROM employees where comm<=500
    ORDER BY salary desc, comm ASC
    LIMIT 0, 3
    ) stg	
);

#UPDATE Using Computed Values
UPDATE newproducts
	SET
		NetRetailPrice = NetRetailPrice * 0.90;

#The DROP Operation
DROP TABLE Customers; #table name

#Inserting Additional values to the Products table
CREATE TABLE FoodProducts (
	ProductID INT NOT NULL AUTO_INCREMENT,
    ProductCategoryID INT NOT NULL DEFAULT 1,
    SupplierID INT NOT NULL DEFAULT 1,
    ProductName CHAR(50) NOT NULL,
    NetRetailPrice DECIMAL(10, 2) NULL DEFAULT 5.99,
    AvailableQuantity INT NOT NULL,
    WholesalePrice DECIMAL(10, 2) NULL DEFAULT 3.99,
    UnitKGWeight DECIMAL(10, 5),
    Notes VARCHAR(750) NULL,
    PRIMARY KEY (ProductID)
);
INSERT INTO FoodProducts (
	ProductName,
    AvailableQuantity,
    UnitKGWeight,
    Notes
)
VALUES (
	'Pancake batter',
    50,
    0.25,
    'Contains eggs'
),
(
	'Breakfast cereal',
    10,
    0.25,
    'Add milk'
),
(
	'Siracha sauce',
    10,
    0.25,
    'A spicy sauce'
);
SELECT * FROM FoodProducts






    
	
