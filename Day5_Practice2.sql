--Ex 1:
SELECT DISTINCT CITY FROM STATION
WHERE RiGHT(ID,1) IN (0,2,4,6,8);

--Ex 2:
SELECT COUNT(*) - COUNT(DISTINCT CITY) FROM STATION;

--Ex 3:
SELECT CEILING(AVG(Salary) - AVG(Replace(Salary,'0','')))
FROM EMPLOYEES;

--Ex 4:
SELECT ROUND(CAST((SUM(item_count*order_occurrences))/(SUM(order_occurrences)) AS DECIMAL),1)
FROM items_per_order;

--Ex 5:
SELECT candidate_id, COUNT(skill)
FROM candidates
WHERE skill IN('Python', 'Tableau','PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3;

--Ex 6:
SELECT user_id, COUNT(user_id), (MAX(DATE(post_date))-MIN(DATE(post_date))) AS differences
FROM posts
WHERE DATE(post_date) BETWEEN '01/01/2021' AND '01/01/2022'
GROUP BY user_id
HAVING COUNT(user_id) >=2

--Ex 7:
SELECT card_name, MAX(issued_amount)-MIN(issued_amount) AS differences
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY MAX(issued_amount)-MIN(issued_amount) DESC;

--Ex 8:
SELECT manufacturer, COUNT(product_id) AS drug_count, abs(SUM(total_sales-cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales-cogs <=0
GROUP BY manufacturer
ORDER BY abs(SUM(total_sales-cogs)) DESC;

--Ex 9:

--Ex 10:

--Ex 11:

--Ex 12:


























