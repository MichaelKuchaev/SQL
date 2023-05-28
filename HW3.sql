create database home_work_3;
 
show databases;

use home_work_3;

create table salespeople 
(
snum int primary key not null,
sname varchar (50) not null,
city varchar(50) not null,
comn varchar(10) not null 
);

insert into salespeople (snum, sname, city, comn)
values
(1001, 'Peel', 'London', '.12'),
(1002, 'Serres', 'London', '.13'),
(1004, 'Motika', 'London', '.11'),
(1007, 'Rifkin', 'Barcelona', '.15'),
(1003, 'Axelrod', 'New York', '.10');

select * from salespeople;

create table customers 
(
cnum int primary key not null,
cname varchar (50) not null,
city varchar(50) not null,
rating int not null,
snum int not null  
);

insert into customers (cnum, cname, city, rating, snum)
values
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'SanJose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clement', 'London', 100, 1001),
(2008, 'Cisneros', 'SanJose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004);

select * from customers;

create table orders 
(
onum int primary key not null,
amt double not null,
odate date not null,
cnum int not null,
snum int not null  
);

insert into orders (onum, amt, odate, cnum, snum)
values
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4723.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);

select * from orders;

/* 1. Напишите запрос, который вывел бы таблицу со столбцами в 
следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)*/

select distinct city, sname, snum, comn 
from salespeople;

/* 2. Напишите команду SELECT, которая вывела бы оценку(rating), 
сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)*/

select distinct cname, rating 
from customers
where city='SanJose';

/* 3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы 
заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)*/

select distinct snum 
from orders;

/* 4. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
Используется оператор "LIKE": (“заказчики”)*/

select cname 
from customers
where cname like 'G%';

/* 5. Напишите запрос, который может дать вам все заказы со значениями 
суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)*/

select *
from orders
where amt > 1000;

/* 6. Напишите запрос который выбрал бы наименьшую сумму заказа.
 (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)*/
 
select MIN(amt) as 'Минимальный заказ'
from orders;

/* 7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, 
у которых рейтинг больше 100 и они находятся не в Риме.*/

select * 
from customers
where rating>100 && city!='Rome';

# Создаем таблицу из семинара

create table work_table 
(
id INT not null auto_increment primary key,
first_name varchar(50) not null,
surname varchar(50) not null,
specialty varchar(50) not null,
seniority int not null,
salary int not null,
age int not null	 
);

select * from work_table;

insert into work_table (first_name, surname, specialty, seniority, salary, age)
values
("Вася", "Васькин", "начальник", 40, 100000, 60),
("Петя", "Петькин", "начальник", 8, 70000, 30),
("Катя", "Каткина", "инженер", 2, 70000, 25),
("Саша", "Сашкин", "инженер", 12, 50000, 35),
("Иван", "Иванов", "рабочий", 40, 30000, 59),
("Петр", "Петров", "рабочий", 20, 25000, 40),
("Сидор", "Сидоров", "рабочий", 10, 20000, 40),
("Антон", "Антонов", "рабочий", 8, 19000, 28),
("Юра", "Юркин", "рабочий", 5, 15000, 25),
("Максим", "Воронин", "рабочий", 2, 11000, 22),
("Юра", "Галкин", "рабочий", 3, 12000, 24),
("Люся", "Люськина", "уборщик", 10, 10000, 49);

/* 1. Отсортируйте поле “зарплата” в порядке убывания и возрастания*/

select * 
from work_table
order by salary; # по возрастанию 

select * 
from work_table
order by salary desc; # по убыванию 

/* 2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с 
наибольшей заработной платой (возможен подзапрос)*/

select * 
from work_table
order by salary desc
limit 5;

/* 3. Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000*/

select specialty, sum(salary) sum_salary 
from work_table
group by specialty 
having sum_salary > 100000;