#adding foreign key to the table
ALTER TABLE OrderItems 
ADD FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

#dropping a foreign key syntax-
#ALTER TABLE <table_name>
#DROP FOREIGN KEY <constraint_name>;

#Building a Relationship between Two Tables
DROP DATABASE IF EXISTS employeedemo; 
CREATE DATABASE employeedemo;  
USE employeedemo; 

CREATE TABLE department 
  ( 
      dno       INT PRIMARY KEY, 
      dname     VARCHAR(30) UNIQUE NOT NULL, 
      dlocation VARCHAR(30) UNIQUE NOT NULL 
   ) ;

CREATE TABLE employee 
( 
	eno		CHAR(4) PRIMARY KEY, 
	ename		VARCHAR(30) NOT NULL, 
	job		VARCHAR(30) NOT NULL, 
	manager	CHAR(4), 
	jdate		TIMESTAMP NOT NULL, 
	gender	CHAR(1) CONSTRAINT gender_chk 
	CHECK ( gender IN('M', 'F')), 
	salary	DECIMAL(8, 2) DEFAULT 0, 
	comission	DECIMAL(8, 2) DEFAULT 0, 
	deptno	INT NOT NULL,
    FOREIGN KEY (deptno) REFERENCES department(dno)
); 
  
#Building a Relationship between the Orders and the OrderItems table
USE packt_online_shop; 
CREATE TABLE OrderItems
  ( 
      OrderItemID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
      OrderID     INT NOT NULL, 
      ProductID INT NOT NULL,
      Quantity INT NOT NULL,
      UnitPrice DECIMAL(10, 2) NOT NULL,
      Discount DECIMAL(10, 2) NOT NULL,
      Notes VARCHAR(750) NULL,
      FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
   ) ;
CREATE TABLE Orders
  ( 
      OrderID      INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
      CustomerID     INT NOT NULL, 
      OrderNumber CHAR(50) NOT NULL,
      OrderDate DATETIME NOT NULL,
      ShipmentDate DATETIME NULL,
      OrderStatus CHAR(10) NULL,
      Notes VARCHAR(750) NULL
   ) ;