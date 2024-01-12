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
SELECT * FROM Cinema
WHERE RIGHT(id, 1) IN (1,3,5,7,9) AND description NOT LIKE '%boring%'
ORDER BY rating DESC;

--Ex 10:
SELECT DISTINCT teacher_id, COUNT(DISTINCT subject_id) AS cnt FROM Teacher
GROUP BY teacher_id;

--Ex 11:
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id;

--Ex 12:
SELECT class FROM Courses
GROUP BY class
HAVING COUNT(student) >=5;
