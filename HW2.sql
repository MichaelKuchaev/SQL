CREATE TABLE sales
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
order_date DATE NOT NULL,
bucket VARCHAR(50) NOT NULL 
);

SELECT * FROM sales;

INSERT INTO sales (order_date, bucket) 
VALUES
('2021-01-01', '101 to 300'),
('2021-01-02', '101 to 300'),
('2021-01-03', 'less than equal to 100'),
('2021-01-04', '101 to 300'),
('2021-01-05', 'greater than 300');

ALTER TABLE sales
ADD COLUMN segments VARCHAR(30);

UPDATE sales SET segments=
CASE WHEN sales.bucket='less than equal to 100' THEN 'Маленький заказ'
WHEN sales.bucket='101 to 300' THEN 'Средний заказ'
WHEN sales.bucket='greater than 300' THEN 'Большой заказ'
END;



CREATE TABLE orders
(
orderid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
employeeid VARCHAR(20),
amount INT NOT NULL,
orderstatus VARCHAR(20) 
);

SELECT * FROM orders;
SELECT * FROM orders_fin;
SELECT * FROM sales;

truncate table orders;

INSERT INTO orders (employeeid, amount, orderstatus) 
VALUES
('e03', '15.00', 'OPEN'),
('e01', '25.50', 'OPEN'),
('e05', '100.70', 'CLOSED'),
('e02', '22.18', 'OPEN'),
('e04', '9.50', 'CANCELLED'),
('e04', '99.99', 'OPEN');

CREATE TABLE orders_fin 
(
orderid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
orderstatus VARCHAR(20),
order_summary VARCHAR(100)
);

ALTER TABLE orders_fin
ADD FOREIGN KEY (orderid) REFERENCES orders(orderid);

INSERT INTO orders_fin (orderstatus)
VALUES
('OPEN'),
('OPEN'),
('CLOSED'),
('OPEN'),
('CANCELLED'),
('OPEN');

UPDATE orders_fin SET order_summary=
CASE WHEN orders_fin.orderstatus='OPEN' THEN 'Order is in open state'
WHEN orders_fin.orderstatus='CLOSED' THEN 'Order is closed'
WHEN orders_fin.orderstatus='CANCELLED' THEN 'Order is cancelled'
END;  