CREATE TABLE IF NOT EXISTS firts(
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    create_time DATETIME COMMENT 'Create Time',
    name VARCHAR(255)
) COMMENT '';

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
    creditLimit,
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
--   para ordenar las tablas como queremos que se muestre
    SELECT * FROM customers ORDER BY `customerName` DESC, contactLastName ASC;
--  para mostar los datos que necesitamos y en el orden que lo queremos
    SELECT contactLastName,contactFirstName FROM  customers ORDER BY `contactLastName` DESC;
--  condicion que traer el usuario si este cumple con la condiccion del pais
    SELECT contactLastName,contactFirstName FROM  customers  WHERE country ='japan' ORDER BY `contactLastName` DESC;

    SELECT contactLastName,contactFirstName,`addressLine1`,`addressLine2`,phone FROM  customers  WHERE country <>'japan' AND `addressLine2` IS NOT NULL ORDER BY `contactLastName` DESC;


    -- ID, FULLNAME, ADDRESS,PHONE,CREDIT
    -- CREDI > 4500 Y CREDIT 12000
--  trajimos todos los datos necesario que se pidio en el primer paso
-- el BETWEEN es para que don satos salga juntos
-- el AS es para nombra la tabla con el dato que tenemos
    SELECT customerName,CONCAT(addressLine1,addressLine2) AS address,phone,`creditLimit` FROM customers WHERE `creditLimit` BETWEEN 45000 AND 1200000 ORDER BY `contactLastName` DESC;
-- ESTAMOS SUMANDO TODOS LO USUARIO QUE CUMPLAN CON LA CONDICION QIUE PUSIMOS EN LA ANTERIOR Y NOS MUESTRE UN SIGNIFICADO
SELECT  SUM(creditLimit) AS TotalamourtCredi
FROM customers
WHERE `creditLimit` BETWEEN 45000 AND 1200000
ORDER BY `contactLastName` DESC;
-- ESTE SE UTILIZO PARA SUMAR POR PAISES
SELECT  SUM(creditLimit) AS TotalamountCredit, country,city
FROM customers
WHERE `creditLimit` BETWEEN 50000 AND 1200000
GROUP BY country,city
ORDER BY TotalamountCredit DESC;

DROP TABLE employees;
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
-- para sacar promedion con nombres
SELECT jobTitle, AVG(salaryAmount) AS promedioSalario
FROM employees
GROUP BY jobTitle;

-- SACAR PROMEDIO DE SALARIOS POR OTRA FORMA SIN DUPLICADOS

SELECT  AVG(salaryAmount) AS promedioSalario `jobTitle`




-- para buscar solo los que empiezan el correo solo con la j
SELECT email AS GMAIL
FROM employees
WHERE email LIKE 'J%'
ORDER BY GMAIL DESC;
-- CUALQUIER CARECTRE IGUAL A LA INTRUCCION NO LO PERMITA TRAER en este caso se trae todos los correos que tenga company
SELECT email AS GMAIL
FROM employees
WHERE email LIKE '%company%'
ORDER BY GMAIL DESC;

-- PARA QUE APARESCAN DOS DDATOS
SELECT lastName AS nombre
FROM employees
WHERE lastName LIKE 'S%' OR `lastName` LIKE 'M%'
ORDER BY nombre DESC;
-- PARA TRAER OTROS QUE EMPIEZEN CON LA LETRA DEPSUES SE LE PONE EL _ EJEMPLO SE PONE _S  ASNAF VA A SALIR DENTRO DE ESA LISTA
SELECT lastName AS nombre
FROM employees
WHERE lastName LIKE 'S%' OR `lastName` LIKE 'M%'
ORDER BY nombre DESC;
-- PARA QUE NO SE REPITA
SELECT jobTitle AS title
FROM employees
GROUP BY title
ORDER BY title ASC;

CREATE TABLE orders (
    orderNumber      INT           NOT NULL PRIMARY KEY,
    orderDate        DATE          NOT NULL,
    requiredDate     DATE          NOT NULL,
    shippedDate      DATE          NULL,
    status           VARCHAR(15)   NOT NULL,
    comments         TEXT          NULL,
    customerNumber   INT           NOT NULL
);

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
    (2011, '2025-05-23', '2025-06-02', NULL,         'In Process','Armando paquete',             1010);

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


-- como traer lña informaicon en dos tablas en este caso que pueda cumplir con la condicion que le asignamos 
SELECT *
FROM orders AS o,orderdetails AS d 
WHERE o.orderNumber = d.orderNumber
AND o.orderNumber = 2001;

-- ahora con enjoy
SELECT *
FROM orders AS o
INNER JOIN orderdetails  AS d ON o.orderNumber = d.orderNumber

