CREATE DATABASE home_work_5;

USE home_work_5;

CREATE TABLE Cars
(
Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
Name VARCHAR(50) NOT NULL,
Cost INT NOT NULL
);

INSERT INTO Cars (Name, Cost)
VALUES
('Audi', 52642),
('Mercedes', 57127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);

SELECT * FROM Cars;

-- 1.Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE VIEW CheapCars AS 
SELECT Name FROM Cars 
WHERE Cost<25000;

SELECT * FROM CheapCars;

/*2. Изменить в существующем представлении порог для стоимости: 
пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)*/

ALTER VIEW CheapCars AS 
SELECT Name FROM Cars 
WHERE Cost<30000;

SELECT * FROM CheapCars;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

ALTER VIEW CheapCars AS 
SELECT Name FROM Cars 
WHERE Name IN ('Skoda', 'Audi');

SELECT * FROM CheapCars;

-- 4. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю. 

CREATE TABLE Analysis
(
an_id INT PRIMARY KEY AUTO_INCREMENT, 
an_name VARCHAR(50),
an_cost INT,
an_price DECIMAL,
an_group VARCHAR(50)
);

CREATE TABLE Groups_an
(
gr_id INT PRIMARY KEY AUTO_INCREMENT, 
gr_name VARCHAR(50),
gr_temp DECIMAL
);

CREATE TABLE Orders
(
ord_id INT PRIMARY KEY AUTO_INCREMENT, 
ord_datetime DATE,
ord_an INT
);

SELECT A.an_name, A.an_price, O.ord_datetime
FROM Analysis A
JOIN Orders O
ON O.ord_id = A.an_id
WHERE O.ord_datetime BETWEEN '2020-02-05' AND '2020-02-12';

-- 5. Добавьте новый столбец под названием «время до следующей станции». 

CREATE TABLE TableWork
(
train_id INT PRIMARY KEY,
station VARCHAR(20),
station_time TIME
);

INSERT INTO TableWork (train_id, station, station_time)
VALUES
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City', '10:54:00'),
(110, 'Palo Alto', '11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Alto', '12:49:00'),
(120, 'San Jose', '13:30:00');

SELECT * FROM TableWork;

SELECT train_id, station, station_time,
SUBTIME (LEAD (station_time) OVER (PARTITION BY train_id ORDER BY train_id), station_time)
AS time_to_next_station
FROM TableWork;
 


