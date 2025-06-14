/* 2025-05-30 08:06:18 [34 ms] */ 
CREATE TABLE IF NOT EXISTS campers(
    ID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    birthDate DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID)
);
/* 2025-05-30 08:06:22 [8 ms] */ 
INSERT INTO campers (name, age, birthDate, email)
VALUES 
('John Doe', 25, '1998-01-15', 'jhondoe@gmail.com');
/* 2025-05-30 08:06:24 [5 ms] */ 
DROP TABLE IF EXISTS documents;
/* 2025-05-30 08:06:26 [27 ms] */ 
CREATE TABLE IF NOT EXISTS documents(
    ID VARCHAR(30) NOT NULL,
    type ENUM('CC', 'TI', 'CE', 'PP','PE','DNI', 'RC') NOT NULL DEFAULT 'CC',
    issueDate DATE NOT NULL,
    expirationDate DATE NOT NULL,
    ID_Camper INT NOT NULL, -- 1:M
    PRIMARY KEY (ID, type),
    FOREIGN KEY(ID_Camper) REFERENCES campers(ID)
);
/* 2025-05-30 08:06:29 [6 ms] */ 
INSERT INTO documents (ID, type, issueDate, expirationDate, ID_Camper)
VALUES 
('123', 'TI', '2020-01-01', '2030-01-01', 1);
/* 2025-06-03 06:41:45 [32 ms] */ 
CREATE TABLE IF NOT EXISTS firts(  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    create_time DATETIME COMMENT 'Create Time',
    name VARCHAR(255)
) COMMENT '';
/* 2025-06-03 06:45:44 [18 ms] */ 
CREATE TABLE customers (
    customerNumber           INT            NOT NULL PRIMARY KEY,
    customerName             VARCHAR(50)    NOT NULL,
    contactLastName          VARCHAR(50)    NOT NULL,
    contactFirstName         VARCHAR(50)    NOT NULL,
    phone                    VARCHAR(50)    NOT NULL,
    addressLine1             VARCHAR(50)    NOT NULL,
    addressLine2             VARCHAR(50)    NULL,
    city                     VARCHAR(50)    NOT NULL,
    state                    VARCHAR(50)    NULL,
    postalCode               VARCHAR(15)    NULL,
    country                  VARCHAR(50)    NOT NULL,
    salesRepEmployeeNumber   INT            NULL,
    creditLimit              DECIMAL(10,2)  NULL
);
/* 2025-06-03 06:45:46 [14 ms] */ 
INSERT INTO customers (
    customerNumber,
    customerName,
    contactLastName,
    contactFirstName,
    phone,
    addressLine1,
    addressLine2,
    city,
    state,
    postalCode,
    country,
    salesRepEmployeeNumber,
    creditLimit
) VALUES
    (1001, 'Acme Corporation',      'Doe',        'John',     '212-555-0101',  '123 Elm Street',         'Suite 100',    'New York',      'NY',    '10001',   'USA',        1370,  50000.00),
    (1002, 'Global Industries Ltd.', 'Smith',      'Anna',     '+44-20-7946-0958', '45 Baker Street',    NULL,          'London',        NULL,   'NW1 6XE', 'UK',         1504,  75000.00),
    (1003, 'Maple Leaf Trading',     'Brown',      'Michael',  '+1-416-555-0199','200 King Street West', 'Floor 5',      'Toronto',       'ON',    'M5H 1A1', 'Canada',     1611, 100000.00),
    (1004, 'Southern Exports LLC',   'Garcia',     'Maria',    '+61-2-9374-4000', '78 Harbour Road',     NULL,          'Sydney',        'NSW',   '2000',    'Australia', 1370,  60000.00),
    (1005, 'Rio Grande Comércio',    'Silva',      'Carlos',   '+55-21-5555-1212','Av. Atlântica, 1500',  'Apto 302',    'Rio de Janeiro','RJ',    '22021-001','Brazil',     1504,  45000.00),
    (1006, 'Deutsche Auto Parts',    'Müller',     'Sabine',   '+49-30-1234-5678','Kaiserstrasse 10',     NULL,          'Berlin',        NULL,   '10117',   'Germany',    1611,  82000.00),
    (1007, 'Lumière Import-Export',  'Dubois',     'Émilie',   '+33-1-44-55-66-77','12 Rue de Rivoli',     'Bât. B',       'Paris',         NULL,   '75001',   'France',     1370,  92000.00),
    (1008, 'Sakura Electronics',     'Tanaka',     'Yuki',     '+81-3-1234-5678', '3-2-1 Roppongi',       'Akasaka Ville 4F','Tokyo',      NULL,   '106-0032','Japan',      1504, 110000.00),
    (1009, 'Taj Textiles',           'Patel',      'Raj',      '+91-22-5555-3333','Shop No. 12, Dadar Market', NULL,       'Mumbai',        'MH',    '400014',  'India',      1611,  30000.00),
    (1010, 'Muy Caliente S.A.',      'Hernández',  'Luis',     '+52-55-1234-5678','Calle Reforma 50',     'Local 7',      'Mexico City',   'CDMX',  '06600',   'Mexico',     1370,  55000.00);
/* 2025-06-03 06:52:18 [9 ms] */ 
SELECT * FROM customers ORDER BY `customerName` DESC, contactLastName ASC LIMIT 100;
/* 2025-06-03 06:54:44 [2 ms] */ 
SELECT contactLastName,contactFirstName FROM  customers ORDER BY `contactLastName` DESC LIMIT 100;
/* 2025-06-03 06:57:15 [2 ms] */ 
SELECT contactLastName,contactFirstName FROM  customers  WHERE country ='japan' ORDER BY `contactLastName` DESC LIMIT 100;
/* 2025-06-03 07:01:03 [2 ms] */ 
SELECT contactLastName,contactFirstName,`addressLine1`,`addressLine2`,phone FROM  customers  WHERE country <>'japan' AND `addressLine2` IS NOT NULL ORDER BY `contactLastName` DESC LIMIT 100;
/* 2025-06-03 07:08:56 [2 ms] */ 
SELECT customerName,CONCAT(addressLine1,addressLine2) AS address,phone,`creditLimit` FROM customers WHERE `creditLimit` BETWEEN 45000 AND 1200000 ORDER BY `contactLastName` DESC LIMIT 100;
/* 2025-06-03 07:28:02 [3 ms] */ 
SELECT  SUM(creditLimit) AS TotalamourtCredi 
FROM customers
WHERE `creditLimit` BETWEEN 45000 AND 1200000
ORDER BY `contactLastName` DESC LIMIT 100;
/* 2025-06-03 07:31:42 [3 ms] */ 
SELECT  SUM(creditLimit) AS TotalamountCredit, country
FROM customers
WHERE `creditLimit` BETWEEN 50000 AND 1200000 
GROUP BY country
ORDER BY TotalamountCredit DESC LIMIT 100;
/* 2025-06-03 07:33:09 [2 ms] */ 
SELECT  SUM(creditLimit) AS TotalamountCredit, country
FROM customers
WHERE `creditLimit` BETWEEN 50000 AND 1200000 
GROUP BY country,city
ORDER BY TotalamountCredit DESC LIMIT 100;
/* 2025-06-03 07:33:18 [2 ms] */ 
SELECT  SUM(creditLimit) AS TotalamountCredit, country,city
FROM customers
WHERE `creditLimit` BETWEEN 50000 AND 1200000 
GROUP BY country,city
ORDER BY TotalamountCredit DESC LIMIT 100;
/* 2025-06-03 07:40:27 [25 ms] */ 
CREATE TABLE employees (
    employeeNumber   INT            NOT NULL PRIMARY KEY,
    lastName         VARCHAR(50)    NOT NULL,
    firstName        VARCHAR(50)    NOT NULL,
    extension        VARCHAR(10)    NOT NULL,
    email            VARCHAR(100)   NOT NULL UNIQUE,
    officeCode       VARCHAR(10)    NOT NULL,
    reportsTo        INT            NULL,
    jobTitle         VARCHAR(50)    NOT NULL,
    CONSTRAINT fk_employees_manager
        FOREIGN KEY (reportsTo)
        REFERENCES employees(employeeNumber)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
/* 2025-06-03 07:40:28 [15 ms] */ 
INSERT INTO employees (
    employeeNumber,
    lastName,
    firstName,
    extension,
    email,
    officeCode,
    reportsTo,
    jobTitle
) VALUES
    (1001, 'Smith',     'John',     'x101',  'john.smith@company.com',    '1',   NULL,  'President'),
    (1002, 'Doe',       'Jane',     'x102',  'jane.doe@company.com',      '1',   1001,  'VP Sales'),
    (1003, 'Brown',     'Michael',  'x103',  'michael.brown@company.com', '1',   1002,  'Sales Manager'),
    (1004, 'Lee',       'Susan',    'x104',  'susan.lee@company.com',     '2',   1002,  'Sales Rep'),
    (1005, 'Garcia',    'Carlos',   'x105',  'carlos.garcia@company.com', '2',   1003,  'Sales Rep'),
    (1006, 'Miller',    'Karen',    'x106',  'karen.miller@company.com',  '3',   1001,  'VP Marketing'),
    (1007, 'Wilson',    'David',    'x107',  'david.wilson@company.com',  '3',   1006,  'Marketing Manager'),
    (1008, 'Martinez',  'María',    'x108',  'maria.martinez@company.com','3',   1007,  'Marketing Rep'),
    (1009, 'Anderson',  'Robert',   'x109',  'robert.anderson@company.com','2',   1003,  'Sales Support'),
    (1010, 'Taylor',    'Emily',    'x110',  'emily.taylor@company.com',  '2',   1003,  'Sales Rep');
/* 2025-06-03 07:42:41 [2 ms] */ 
SELECT  email AS GMAIL
FROM employees
WHERE `email`  
ORDER BY GMAIL DESC LIMIT 100;
/* 2025-06-03 07:43:39 [2 ms] */ 
SELECT email AS GMAIL
FROM employees
WHERE email LIKE 'J%' 
ORDER BY GMAIL DESC LIMIT 100;
/* 2025-06-03 07:49:46 [2 ms] */ 
SELECT lastName AS nombre
FROM employees
WHERE lastName LIKE 'A' AND 'c'
ORDER BY nombre DESC LIMIT 100;
/* 2025-06-03 07:50:12 [1 ms] */ 
SELECT lastName AS nombre
FROM employees
WHERE lastName LIKE 'j' AND 'm'
ORDER BY nombre DESC LIMIT 100;
/* 2025-06-03 07:50:29 [2 ms] */ 
SELECT lastName AS nombre
FROM employees
WHERE lastName LIKE 'S' AND 'B'
ORDER BY nombre DESC LIMIT 100;
/* 2025-06-03 07:50:35 [1 ms] */ 
SELECT lastName AS nombre
FROM employees
WHERE lastName LIKE 'S' 
ORDER BY nombre DESC LIMIT 100;
/* 2025-06-03 07:50:38 [2 ms] */ 
SELECT email AS GMAIL
FROM employees
WHERE email LIKE 'J%' 
ORDER BY GMAIL DESC LIMIT 100;
/* 2025-06-03 07:55:11 [2 ms] */ 
SELECT lastName AS nombre
FROM employees
WHERE lastName LIKE 'S%' 
ORDER BY nombre DESC LIMIT 100;
/* 2025-06-03 07:55:27 [2 ms] */ 
SELECT lastName AS nombre
FROM employees
WHERE lastName LIKE 'S%' AND 'M%'
ORDER BY nombre DESC LIMIT 100;
/* 2025-06-03 07:55:48 [1 ms] */ 
SELECT lastName AS nombre
FROM employees
WHERE lastName LIKE 'S%' AND `lastName` LIKE 'M%'
ORDER BY nombre DESC LIMIT 100;
/* 2025-06-03 07:55:59 [1 ms] */ 
SELECT lastName AS nombre
FROM employees
WHERE lastName LIKE 'S%' OR `lastName` LIKE 'M%'
ORDER BY nombre DESC LIMIT 100;
/* 2025-06-03 07:57:25 [2 ms] */ 
SELECT lastName AS nombre
FROM employees
WHERE lastName LIKE '_S%' OR `lastName` LIKE 'M%'
ORDER BY nombre DESC LIMIT 100;
/* 2025-06-03 07:57:33 [3 ms] */ 
SELECT lastName AS nombre
FROM employees
WHERE lastName LIKE '_o%' OR `lastName` LIKE 'M%'
ORDER BY nombre DESC LIMIT 100;
/* 2025-06-03 07:59:41 [2 ms] */ 
SELECT email AS GMAIL
FROM employees
WHERE email LIKE '%gmail%'
ORDER BY GMAIL DESC LIMIT 100;
/* 2025-06-03 07:59:58 [2 ms] */ 
SELECT email AS GMAIL
FROM employees
WHERE email LIKE '%company%'
ORDER BY GMAIL DESC LIMIT 100;
/* 2025-06-03 08:00:30 [2 ms] */ 
SELECT email AS GMAIL
FROM employees
WHERE email LIKE '%@%'
ORDER BY GMAIL DESC LIMIT 100;
/* 2025-06-03 08:06:04 [7 ms] */ 
SELECT email AS GMAIL
FROM employees
WHERE email LIKE '%jobTitle%'
ORDER BY GMAIL DESC LIMIT 100;
/* 2025-06-03 08:08:02 [2 ms] */ 
SELECT jobTitle AS title
FROM employees
ORDER BY title DESC LIMIT 100;
/* 2025-06-03 08:11:28 [1 ms] */ 
SELECT jobTitle AS title
FROM employees
GROUP BY title
ORDER BY title ASC LIMIT 100;
/* 2025-06-03 08:15:01 [16 ms] */ 
DROP TABLE employees;
/* 2025-06-03 08:18:20 [24 ms] */ 
CREATE TABLE employees (
    employeeNumber   INT            NOT NULL PRIMARY KEY,
    lastName         VARCHAR(50)    NOT NULL,
    firstName        VARCHAR(50)    NOT NULL,
    extension        VARCHAR(10)    NOT NULL,
    email            VARCHAR(100)   NOT NULL UNIQUE,
    officeCode       VARCHAR(10)    NOT NULL,
    reportsTo        INT            NULL,
    jobTitle         VARCHAR(50)    NOT NULL,
    salaryAmount     INT            NOT NULL,
    CONSTRAINT fk_employees_manager
        FOREIGN KEY (reportsTo)
        REFERENCES employees(employeeNumber)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
/* 2025-06-03 08:18:21 [6 ms] */ 
INSERT INTO employees (
    employeeNumber,
    lastName,
    firstName,
    extension,
    email,
    officeCode,
    reportsTo,
    jobTitle,
    salaryAmount
) VALUES
    (1001, 'Smith',     'John',     'x101',  'john.smith@company.com',    '1',   NULL,  'President',3500),
    (1002, 'Doe',       'Jane',     'x102',  'jane.doe@company.com',      '1',   1001,  'VP Sales',2500),
    (1003, 'Brown',     'Michael',  'x103',  'michael.brown@company.com', '1',   1002,  'Sales Manager',2250),
    (1004, 'Lee',       'Susan',    'x104',  'susan.lee@company.com',     '2',   1002,  'Sales Rep',2000),
    (1005, 'Garcia',    'Carlos',   'x105',  'carlos.garcia@company.com', '2',   1003,  'Sales Rep',2000),
    (1006, 'Miller',    'Karen',    'x106',  'karen.miller@company.com',  '3',   1001,  'VP Marketing',2450),
    (1007, 'Wilson',    'David',    'x107',  'david.wilson@company.com',  '3',   1006,  'Marketing Manager',2300),
    (1008, 'Martinez',  'María',    'x108',  'maria.martinez@company.com','3',   1007,  'Marketing Rep',2300),
    (1009, 'Anderson',  'Robert',   'x109',  'robert.anderson@company.com','2',   1003,  'Sales Support',3100),
    (1010, 'Taylor',    'Emily',    'x110',  'emily.taylor@company.com',  '2',   1003,  'Sales Rep',2700);
/* 2025-06-03 08:20:27 [2 ms] */ 
SELECT jobTitle, AVG(salaryAmount) AS promedioSalario
FROM employees
GROUP BY jobTitle LIMIT 100;
/* 2025-06-03 08:46:36 [22 ms] */ 
CREATE TABLE orders (
    orderNumber      INT           NOT NULL PRIMARY KEY,
    orderDate        DATE          NOT NULL,
    requiredDate     DATE          NOT NULL,
    shippedDate      DATE          NULL,
    status           VARCHAR(15)   NOT NULL,
    comments         TEXT          NULL,
    customerNumber   INT           NOT NULL
);
/* 2025-06-03 08:46:38 [20 ms] */ 
CREATE TABLE orderdetails (
    orderNumber       INT           NOT NULL,
    productCode       VARCHAR(20)   NOT NULL,
    quantityOrdered   INT           NOT NULL,
    priceEach         DECIMAL(10,2) NOT NULL,
    orderLineNumber   SMALLINT      NOT NULL,
    PRIMARY KEY (orderNumber, productCode),
    CONSTRAINT fk_orderdetails_orders
        FOREIGN KEY (orderNumber)
        REFERENCES orders(orderNumber)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
/* 2025-06-03 08:46:39 [6 ms] */ 
INSERT INTO orders (
    orderNumber,
    orderDate,
    requiredDate,
    shippedDate,
    status,
    comments,
    customerNumber
) VALUES
    (2001, '2025-05-01', '2025-05-10', '2025-05-05', 'Shipped',  'Entregado sin inconvenientes',    1001),
    (2002, '2025-05-03', '2025-05-12', '2025-05-08', 'Shipped',  'Entrega parcial, faltan artículos',1002),
    (2003, '2025-05-05', '2025-05-15', NULL,         'In Process','Pendiente de envío',           1003),
    (2004, '2025-05-07', '2025-05-17', '2025-05-10', 'Shipped',  'Entregado con demora',          1004),
    (2005, '2025-05-10', '2025-05-20', NULL,         'Cancelled','Cliente canceló el pedido',    1005),
    (2006, '2025-05-12', '2025-05-22', '2025-05-18', 'Shipped',  'Todo correcto',                 1006),
    (2007, '2025-05-15', '2025-05-25', NULL,         'In Process','Preparando envío',            1007),
    (2008, '2025-05-17', '2025-05-27', '2025-05-20', 'Shipped',  'Entregado temprano',            1008),
    (2009, '2025-05-20', '2025-05-30', NULL,         'On Hold',  'Esperando confirmación pago',   1009),
    (2010, '2025-05-22', '2025-06-01', NULL,         'In Process','Armando paquete',             1010);
/* 2025-06-03 08:47:30 [6 ms] */ 
INSERT INTO orderdetails (
    orderNumber,
    productCode,
    quantityOrdered,
    priceEach,
    orderLineNumber
) VALUES
    (2001, 'P001',  2,  150.00,  1),
    (2001, 'P002',  1,  299.99,  2),
    (2002, 'P003',  5,   45.50,  1),
    (2003, 'P001',  1,  150.00,  1),
    (2003, 'P004', 10,   12.75,  2),
    (2004, 'P005',  3,  250.00,  1),
    (2005, 'P002',  4,  299.99,  1),
    (2006, 'P006',  2,  500.00,  1),
    (2007, 'P004', 20,   12.75,  1),
    (2008, 'P007',  1,  120.00,  1),
    (2009, 'P008', 10,   25.00,  1),
    (2010, 'P009',  2,   75.00,  1);
/* 2025-06-03 08:51:50 [3 ms] */ 
SELECT *
FROM orders AS o,orderdetails AS d 
WHERE o.orderNumber = d.orderNumber
AND o.orderNumber = 2001 LIMIT 100;
/* 2025-06-03 08:56:07 [1 ms] */ 
SELECT *
FROM orders AS o,orderdetails AS d 
WHERE o.orderNumber = d.orderNumber
AND o.orderNumber = 2011 LIMIT 100;
/* 2025-06-03 08:57:15 [3 ms] */ 
SELECT *
FROM orders AS o
INNER JOIN orderdetails  AS d ON o.orderNumber = d.orderNumber LIMIT 100;
