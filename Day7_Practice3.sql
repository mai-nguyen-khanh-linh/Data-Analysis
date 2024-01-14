–-Ex 1:
SELECT Name FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name,3), ID;

--Ex 2:
SELECT user_id, CONCAT(UPPER(LEFT(name,1)),LOWER(RIGHT(name, LENGTH(name)-1))) AS name FROM Users;


--Ex 3:
SELECT manufacturer, '$'||ROUND(SUM(total_sales)/1000000)||' '||'million' AS sales
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer;

--Ex 4:
SELECT EXTRACT(month FROM submit_date) AS month, product_id, ROUND(AVG(stars),2) FROM reviews
GROUP BY EXTRACT(month FROM submit_date), product_id
ORDER BY EXTRACT(month FROM submit_date), product_id;

--Ex5:
SELECT sender_id, COUNT(DISTINCT message_id) AS message_count FROM messages
WHERE EXTRACT(month FROM sent_date) =8
AND EXTRACT(year FROM sent_date)= 2022
GROUP BY sender_id
ORDER BY COUNT(message_id) DESC
LIMIT 2;

--Ex 6:
SELECT tweet_id FROM Tweets
WHERE LENGTH(content) > 15;

--Ex7:
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date
HAVING COUNT(activity_type) >= 1;

--Ex8:
select COUNT(id) from employees
where extract(year FROM joining_date) = 2022 
AND extract(month FROM joining_date) IN (1,2,3,4,5,6,7);

--Ex9:
select POSITION('a' IN first_name) from worker
WHERE first_name = 'Amitah';

--Ex 10:
select title, SUBSTRING(title FROM LENGTH(winery)+2 FOR 4) AS year
from winemag_p2;
