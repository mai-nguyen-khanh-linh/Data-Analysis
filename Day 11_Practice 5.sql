--Ex 1:
SELECT b.Continent, FLOOR(AVG(a.Population))
FROM City AS a
JOIN Country AS b
ON a.CountryCode=b.Code
GROUP BY b.Continent;

--Ex 2:
SELECT ROUND(
CAST(SUM(CASE WHEN t.signup_action='Confirmed' THEN 1 ELSE 0 END) AS numeric)
/COUNT(user_id), 2) 
AS confirm_rate
FROM emails AS e  
LEFT JOIN texts AS t  
ON e.email_id=t.email_id
AND t.signup_action='Confirmed';

-- Ex 3:
SELECT a.age_bucket,
ROUND((SUM(CASE WHEN act.activity_type='send' THEN act.time_spent ELSE 0 END)/
(SUM(CASE WHEN act.activity_type='open' THEN act.time_spent ELSE 0 END)+ 
SUM(CASE WHEN act.activity_type='send' THEN act.time_spent ELSE 0 END)))*100.0,2)
AS send_perc,
ROUND((SUM(CASE WHEN act.activity_type='open' THEN act.time_spent ELSE 0 END)/
(SUM(CASE WHEN act.activity_type='open' THEN act.time_spent ELSE 0 END)+ 
SUM(CASE WHEN act.activity_type='send' THEN act.time_spent ELSE 0 END)))*100.0,2)
AS open_perc
FROM activities AS act  
JOIN age_breakdown AS a
ON act.user_id=a.user_id
GROUP BY a.age_bucket;

-- Ex 4:
SELECT a.customer_id
FROM customer_contracts AS a  
JOIN products AS b  
ON a.product_id=b.product_id
GROUP BY a.customer_id
HAVING COUNT(DISTINCT b.product_category)=3; 

-- Ex 5:
SELECT
m.employee_id, m.name,
COUNT(e.employee_id) AS reports_count, ROUND(AVG(e.age)) AS average_age
FROM Employees AS e
INNER JOIN Employees AS m
ON e.reports_to=m.employee_id
GROUP BY m.employee_id, m.name 
ORDER BY m.employee_id;

--Ex 6:
SELECT p.product_name, SUM(o.unit) AS unit
FROM Products AS p
INNER JOIN Orders AS o
ON p.product_id=o.product_id
WHERE extract(year FROM o.order_date)=2020 AND extract(month FROM o.order_date)=2
GROUP BY p.product_name 
HAVING SUM(o.unit) >=100;

--Ex7:
SELECT p.page_id
FROM pages p
LEFT JOIN page_likes AS l
ON p.page_id=l.page_id
GROUP BY p.page_id
HAVING COUNT(DISTINCT user_id)=0
ORDER BY p.page_id;

--MID COURSE TEST
--Ex 1:
SELECT DISTINCT replacement_cost FROM film
ORDER BY replacement_cost;

--Ex 2:
SELECT 
SUM(CASE WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 1 ELSE 0 END) 
AS low,
SUM(CASE WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 1 ELSE 0 END) 
AS medium,
SUM(CASE WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 1 ELSE 0 END) 
AS high
FROM film;

-- Ex 3:
SELECT b.title, b.length, a.name
FROM public.film AS b 
JOIN public.film_category AS c
ON b.film_id=c.film_id
JOIN public.category AS a
ON a.category_id=c.category_id
WHERE a.name IN ('Drama','Sports')
ORDER BY b.length DESC;

--Ex 4:
SELECT COUNT(b.title), a.name
FROM public.film AS b 
JOIN public.film_category AS c
ON b.film_id=c.film_id
JOIN public.category AS a
ON a.category_id=c.category_id
GROUP BY a.name
ORDER BY COUNT(b.title) DESC
LIMIT 1;

-- Ex 5:
SELECT a.first_name, a.last_name, COUNT(b.film_id)
FROM public.film AS b
JOIN public.film_actor AS c
ON b.film_id=c.film_id
JOIN public.actor AS a
ON a.actor_id=c.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY COUNT(b.film_id) DESC;

-- Ex 6:
SELECT a.address_id, a.address, a.address2, b.customer_id
from public.address AS a
left jOIN public.customer AS b
ON a.address_id=b.address_id
WHERE b.customer_id IS NULL;

-- Ex 7:
SELECT city.city, SUM(p.amount)
FROM public.payment AS p
JOIN public.customer AS cus
ON p.customer_id=cus.customer_id
JOIN public.address AS a 
ON cus.address_id=a.address_id
JOIN public.city AS city
ON city.city_id=a.city_id
GROUP BY city.city
ORDER BY SUM(p.amount) DESC;

--Ex 8:
SELECT city.city||'.'||country.country, 
SUM(p.amount)
FROM public.payment AS p
JOIN public.customer AS cus
ON p.customer_id=cus.customer_id
JOIN public.address AS a 
ON cus.address_id=a.address_id
JOIN public.city AS city
ON city.city_id=a.city_id
JOIN public.country AS country
ON country.country_id=city.country_id
GROUP BY city.city||'.'||country.country
ORDER BY SUM(p.amount) DESC;

