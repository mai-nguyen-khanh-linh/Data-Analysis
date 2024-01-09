--Ex 1
SELECT NAME FROM CITY WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA';

--Ex 2:
SELECT * FROM CITY WHERE COUNTRYCODE = 'JPN';

--Ex 3:
SELECT CITY, STATE FROM STATION;

--Ex 4:
SELECT DISTINCT CITY FROM STATION
WHERE LEFT(CITY,1) IN('u','e','o','i','a');

--Ex 5:
SELECT DISTINCT CITY FROM STATION
WHERE RIGHT(CITY,1) IN('u','e','o','i','a');

--Ex 6:
SELECT DISTINCT CITY FROM STATION
WHERE LEFT(CITY,1) NOT IN('u','e','o','i','a');

--Ex 7:
SELECT name FROM Employee 
ORDER BY name;

--Ex 8:
SELECT name FROM Employee 
WHERE salary > 2000 AND months < 10
ORDER BY employee_id ASC;

-- Ex 9:
SELECT product_id FROM Products 
WHERE low_fats = 'Y' AND recyclable = 'Y';

--Ex 10:
SELECT name FROM Customer 
WHERE referee_id !=2 OR referee_id IS NULL;

--Ex 11:
SELECT name, population, area FROM World 
WHERE area >= 3000000 OR population >= 25000000;

--Ex 12:
SELECT DISTINCT author_id AS id FROM Views
WHERE author_id=viewer_id
ORDER BY author_id ASC;

-- Ex 13:
SELECT part, assembly_step FROM parts_assembly
WHERE finish_date IS NULL;

-- Ex 14:
select * from lyft_drivers
WHERE yearly_salary <= 30000 OR yearly_salary >= 70000 ;

-- Ex 15:
select * from uber_advertising
where money_spent > 100000 AND year = 2019;



















