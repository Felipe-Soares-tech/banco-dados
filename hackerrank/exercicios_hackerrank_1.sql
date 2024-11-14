/* exercicio 1*/

select * from city;

/* exercicio 2*/
select * from city where id = 1661;

/* exercicio 3*/
select city,state from station;

/* exercicio 4*/
select * from city where countrycode = 'JPN';

/* exercicio 5*/
select * from city where countrycode = 'USA' and population > 100000;

/* exercicio 6*/
select name from city where countrycode = 'USA' and population > 120000;

/* exercicio 7*/
select name from city where countrycode = 'USA' and population > 120000;

/* exercicio 8*/
select distinct city from station where city like 'i%'
 or city like 'e%' 
 or city like 'a%' 
 or city like 'o%' 
 or city like 'u%';
 

/* exercicio 9*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%A' 
   OR CITY LIKE '%E' 
   OR CITY LIKE '%I' 
   OR CITY LIKE '%O' 
   OR CITY LIKE '%U';

/* exercicio 10*/
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) IN ('A', 'E', 'I', 'O', 'U')
  AND RIGHT(CITY, 1) IN ('A', 'E', 'I', 'O', 'U');

