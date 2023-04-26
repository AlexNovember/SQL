-- DROP DATABASE IF EXISTS home5;
CREATE DATABASE IF NOT EXISTS home5;
USE home5;

CREATE TABLE cars
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT INTO cars (name, cost)
VALUES
	("Audi", 52642),
    ("Mercedes", 57127 ),
    ("Skoda", 9000 ),
    ("Volvo", 29000),
	("Bentley", 350000),
    ("Citroen ", 21000 ), 
    ("Hummer", 41400), 
    ("Volkswagen ", 21600);

SELECT * FROM cars;

-- 1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE VIEW cars_view AS
SELECT * FROM Cars
WHERE cost < 25000;

SELECT *
FROM cars_view;

-- 2. Изменить в существующем представлении порог для стоимости: 
-- пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW cars_view1 AS
SELECT * FROM Cars
WHERE cost < 30000;

SELECT *
FROM cars_view1;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE VIEW cars_view2 AS
SELECT * FROM Cars
WHERE name IN ("Skoda", "Audi");

SELECT *
FROM cars_view2;

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

SELECT an_name, an_price, ord_datetime
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_id
AND Orders.ord_datetime >= '2020-02-05'
AND Orders.ord_datetime <= '2020-02-12';




CREATE TABLE trains(
	train_id INT NOT NUll,
    station VARCHAR(20) NOT NUll,
    station_time TIME NOT NUll
);

INSERT INTO trains
VALUES
(110, "San Francisco", '10:00:00'),
(110, "Redwood City", '10:54:00'),
(110, "Palo Alto", '11:02:00'),
(110, "San Jose", '12:35:00'),
(120, "San Francisco", '11:00:00'),
(120, "Palo Alto", '12:49:00'),
(120, "San Jose", '13:30:00');

SELECT * FROM trains;

-- Добавьте новый столбец под названием «время до следующей станции». 

SELECT 
	trains.*,
	TIMEDIFF (LEAD(station_time) OVER (PARTITION BY train_id), station_time) AS time_to_next_station
FROM trains;

