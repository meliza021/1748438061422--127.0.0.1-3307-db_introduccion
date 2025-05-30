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
