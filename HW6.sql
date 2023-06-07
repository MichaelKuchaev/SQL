-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER //
CREATE FUNCTION sec(numb INT)
RETURNS CHAR(100)
DETERMINISTIC
BEGIN
	DECLARE days CHAR(3);
	DECLARE hours, minutes, seconds CHAR(2);
	DECLARE result CHAR(100);
	SET days = cast(floor(numb/60/60/24) AS CHAR(3));
	SET hours = cast(floor(mod(numb/60/60/24,1)*24) AS CHAR(2));
	SET minutes = cast(floor(mod(mod(numb/60/60/24,1)*24,1)*60) AS CHAR(2));
	SET seconds = cast(round(mod(mod(mod(numb/60/60/24,1)*24,1)*60,1)*60) AS CHAR(2));
	SET result = concat(days,' days ',hours,' hours ',minutes,' minutes ',seconds,' seconds');
	RETURN result;
END //
DELIMITER ;

DROP FUNCTION sec;

SELECT sec(123456) AS RESULT; 

-- 2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

DELIMITER //
CREATE PROCEDURE numbers()
BEGIN
    DECLARE n INT default 0;
    DROP TABLE IF EXISTS numb;
    CREATE TABLE numb (n INT);

    WHILE n < 10 DO
    SET n = n + 2;
    INSERT INTO numb VALUES(n);
    END WHILE;

SELECT * FROM numb;
END //
DELIMITER ;

DROP PROCEDURE numbers;

CALL numbers();