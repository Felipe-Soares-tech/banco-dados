-- exercicio 1--
SELECT CITY.NAME 
FROM CITY
INNER JOIN COUNTRY
ON CITY.CountryCode = country.Code
WHERE COUNTRY.CONTINENT = 'Africa'

-- exercicio 2--
select sum(city.population) from city
inner join country 
on CITY.CountryCode = COUNTRY.Code
where continent = 'Asia'

-- exercicio 3--
SELECT COUNTRY.CONTINENT, TRUNCATE(AVG(CITY.POPULATION), 0) AS AvgCityPopulation
FROM CITY
INNER JOIN COUNTRY
ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT;