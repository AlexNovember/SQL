CREATE DATABASE home3;
USE home3;

CREATE TABLE salespeople
(
snum INT PRIMARY KEY UNIQUE,
sname CHAR(10) NOT NULL,
city CHAR(10) NOT NULL,
comm DECIMAL(5,2) NOT NULL
);

INSERT INTO salespeople(snum, sname, city, comm)
VALUES
(1001, "Peel", "London", 0.12),
(1002, "Serres", "San Jose", 0.13),
(1004, "Motika", "London", 0.11),
(1007, "Rifkin", "Barcelona", 0.15),
(1003, "Axelrod", "New York", 0.10);

SELECT * FROM salespeople;

CREATE TABLE customers
(
cnum INT PRIMARY KEY UNIQUE,
cname CHAR(10) NOT NULL,
city CHAR(10) NOT NULL,
rating INT NOT NULL,
snum INT,
FOREIGN KEY (snum)  REFERENCES salespeople (snum)
);

INSERT INTO customers(cnum, cname, city, rating, snum)
VALUES
(2001, "Hoffman", "London", 100, 1001),
(2002, "Giovanni", "Rome", 200, 1003),
(2003, "Liu", "SanJose", 200, 1002),
(2004, "Grass", "Berlin", 300, 1002),
(2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "SanJose", 300, 1007),
(2007, "Pereira", "Rome", 100, 1004);

SELECT * FROM customers;

CREATE TABLE orders
(
onum INT PRIMARY KEY UNIQUE,
amt DECIMAL(7,2) NOT NULL,
odate DATE NOT NULL,
cnum INT,
snum INT,
FOREIGN KEY (cnum)  REFERENCES customers (cnum),
FOREIGN KEY (snum)  REFERENCES salespeople (snum)
);

INSERT INTO orders(onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, 19901003, 2008, 1007),
(3003, 767.19, 19901003, 2001, 1001),
(3002, 1900.10, 19901003, 2007, 1004),
(3005, 5160.45, 19901003, 2003, 1002),
(3006, 1098.16, 19901003, 2008, 1007),
(3009, 1713.23, 19901004, 2002, 1003),
(3007, 75.75, 19901004, 2004, 1002),
(3008, 4723.00, 19901005, 2006, 1001),
(3010, 1309.95, 19901006, 2004, 1002),
(3011, 9891.88, 19901006, 2006, 1001);

SELECT * FROM orders;

-- Задание 1 Напишите запрос, 
-- который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm.

SELECT city, sname, snum, comm
FROM salespeople;

-- Задание 2 Напишите запрос, который вывел бы таблицу со столбцами 
-- в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)

SELECT rating, cname 
FROM customers 
WHERE city = 'SanJose';

-- Задание 3  Напишите запрос, который вывел бы значения snum всех продавцов
-- из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”

SELECT DISTINCT snum FROM orders;

-- Задание 4  Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G.

SELECT * FROM customers 
WHERE cname LIKE 'G%';

-- Задание 5  Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. 
-- (“Заказы”, “amt”  - сумма)

SELECT * FROM orders 
WHERE amt > 1000;

-- Задание 6  Напишите запрос который выбрал бы наименьшую сумму заказа.
-- (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)

SELECT MIN(amt)
FROM orders;

-- Задание 7  Напишите запрос к таблице “Заказчики”, 
-- который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.

SELECT *
FROM customers
WHERE (rating > 100) AND (city != "Rome");