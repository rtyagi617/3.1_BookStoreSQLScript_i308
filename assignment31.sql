/* SQL file for INFO I308 Assignment 3.1. */

/* Drop tables if they exist. Add more DROP TABLE statements as you create more tables. Order matters due to foreign keys. */
DROP TABLE IF EXISTS A_trans CASCADE;
DROP TABLE IF EXISTS A_customer CASCADE;
DROP TABLE IF EXISTS A_book CASCADE;
DROP TABLE IF EXISTS A_publisher CASCADE;

/* Create all tables. Order matters due to foreign keys. */

CREATE TABLE A_customer (
id INT auto_increment,
name VARCHAR(30) NOT NULL,
address VARCHAR(50),
phone VARCHAR(15),
PRIMARY KEY (id)
) ENGINE = innodb;

CREATE TABLE A_publisher (
id INT auto_increment,
name VARCHAR(50) NOT NULL,
city VARCHAR(50),
PRIMARY KEY (id)
) ENGINE = innodb;

CREATE TABLE A_book (
id INT auto_increment,
title VARCHAR(50) NOT NULL,
price DECIMAL(5,2),
pubid INT,
PRIMARY KEY (id),
FOREIGN KEY (pubid) REFERENCES A_publisher(id)
) ENGINE = innodb;

CREATE TABLE A_trans(
custid INT NOT NULL,
bookid INT NOT NULL,
tdate DATE,
FOREIGN KEY (custid) REFERENCES A_customer(id),
FOREIGN KEY (bookid) REFERENCES A_book(id)
) ENGINE = innodb;

/* Inserting data into tables. Order matters because of foreign keys. */

INSERT INTO A_publisher (id, name, city) VALUES
(300, 'Penguin', 'NYC'),
(301, 'Richert, Inc','Madison'),
(302, 'Instructure','Orlando');

INSERT INTO A_customer(id,name,address,phone) VALUES
(500,'Matt','420 Baker Street','800-555-4242'),
(501,'Jenny','12 Tutone Ave','555-867-5309'),
(502,'Sean','1600 N Penn Dr','555-555-1550');

INSERT INTO A_book (id, title, price, pubid) VALUES
(1001,'The Code Book',14.00, 300),
(1002,'Web Programming',49.95, NULL),
(1003,'The Hacker Ethic',19.95, 301);

INSERT INTO A_trans VALUES
(500,1001,'2017-09-13'),
(501,1002,'2017-09-17'),
(501,1002,'2017-09-26'),
(502,1003,'2017-10-01'),
(501,1001,'2017-10-12'),
(502,1002,'2017-10-25');

/* Add your own queries below to modify the tables, create new tables, insert data, and SELECT data according to the assignment instructions. */

/* Step 2a */
DROP TABLE IF EXISTS A_bookcase;
CREATE TABLE A_bookcase (
bcid INT auto_increment,
location VARCHAR(30),
num_shelf INT,
capacity INT,
PRIMARY KEY (bcid)
) ENGINE = INNODB;

DROP TABLE IF EXISTS A_book_bookcase;
CREATE TABLE A_book_bookcase(
bookid INT auto_increment,
bcid INT,
quantity INT, 
FOREIGN KEY (bookid) REFERENCES A_book(id),
FOREIGN KEY (bcid) REFERENCES A_bookcase(bcid),
PRIMARY KEY (bookid,bcid)
) ENGINE = INNODB;

UPDATE A_customer
    SET phone = "555-123-1111"
    WHERE id = 502
;

INSERT INTO A_bookcase VALUES
(100,"UL 303",6,50),
(101,"UL 201",6,40),
(102,"UL 201",5,45),
(103,"UL 303",5,25);

INSERT INTO A_book_bookcase VALUES
(1001,100,277),
(1001,101,200),
(1002,101,22),
(1003,102,141),
(1002,103,74);

ALTER TABLE A_book
    ADD COLUMN format VARCHAR(50)
;

UPDATE A_book
    SET format = "paperback"
    WHERE id = 1001
;

UPDATE A_book
    SET format = "paperback"
    WHERE id = 1003
;

UPDATE A_book
    SET format = "hardcover"
    WHERE id = 1002
;

SELECT * FROM A_bookcase WHERE 
capacity IN(40,45);

SELECT Abook.title, Abookcase.bcid 
FROM A_book as Abook
JOIN A_book_bookcase as Abookcase
ON Abook.id = Abookcase.bookid
WHERE Abookcase.bcid NOT IN (101)
;

SELECT Abook.title, Abook.price, Publisher.name, Abookcase.quantity
FROM A_book as Abook
JOIN A_publisher as Publisher
ON Abook.pubid = Publisher.id 
JOIN A_book_bookcase as Abookcase
ON Abook.id = Abookcase.bookid
WHERE Abook.format IN ("paperback")
;









