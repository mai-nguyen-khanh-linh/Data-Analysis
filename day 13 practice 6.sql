–Ex 1:
WITH d AS
(SELECT title, company_id, description, COUNT(job_id) AS job_counts
FROM job_listings 
GROUP BY title, description, company_id)
SELECT COUNT(title) AS duplicate_companies FROM d  
WHERE job_counts>1;

– Ex 2:
WITH a as 
(SELECT category, product, SUM(spend) AS total_spend
FROM product_spend
WHERE category='appliance'
GROUP BY product, category
ORDER BY category, SUM(spend) DESC
LIMIT 2),
e as
(SELECT category, product, SUM(spend) AS total_spend
FROM product_spend
WHERE category='electronics'
GROUP BY product, category
ORDER BY category, SUM(spend) DESC
LIMIT 2)
SELECT * FROM a 
UNION ALL
SELECT * FROM e

–Ex 3:
WITH a AS
(SELECT policy_holder_id, COUNT(case_id) as call_count
FROM callers
GROUP BY policy_holder_id)
SELECT COUNT(policy_holder_id) as member_count
FROM a   
WHERE call_count>=3;

–Ex 4:
SELECT p.page_id
FROM pages p
LEFT JOIN page_likes AS l
ON p.page_id=l.page_id
GROUP BY p.page_id
HAVING COUNT(DISTINCT user_id)=0
ORDER BY p.page_id;

–Ex 5:
with a AS
(select * from user_actions
where event_type IN ('sign-in','like','comment')
and EXTRACT(month from event_date)=6
and EXTRACT(year from event_date)=2022),
b AS
(select * from user_actions
where event_type IN ('sign-in','like','comment')
and EXTRACT(month from event_date)=7
and EXTRACT(year from event_date)=2022)
select '7' as month, 
count(DISTINCT a.user_id) as monthly_active_users
from a FULL OUTER JOIN b 
on a.user_id=b.user_id;

–Ex 6:
select 
DATE_FORMAT(trans_date, '%Y-%m') as month,
country,
count(*) as trans_count,
sum(CASE WHEN state='approved' THEN 1 ELSE 0 END) as approved_count,
SUM(amount) as trans_total_amount,
SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) as approved_total_amount
from Transactions
group by extract(year from trans_date), extract(month from trans_date), country;

–Ex 7:
WITH a AS
(SELECT product_id, MIN(year) AS first_year, quantity, price
FROM Sales 
WHERE product_id=100),
b as 
(SELECT product_id, MIN(year) AS first_year, quantity, price
FROM Sales 
WHERE product_id=200),
c as 
(SELECT product_id, MIN(year) AS first_year, quantity, price
FROM Sales 
WHERE product_id=300)
SELECT * FROM a
UNION SELECT * FROM b
UNION SELECT * FROM c;

–Ex 8:
WITH a as
(SELECT customer_id, COUNT(DISTINCT product_key) AS prd FROM customer
GROUP BY customer_id)
SELECT customer_id FROM a
WHERE prd=(SELECT COUNT(DISTINCT product_key) FROM Product);

–EX 9:
SELECT employee_id
from Employees
where salary < 30000
and manager_id NOT IN (SELECT employee_id FROM Employees)
order by employee_id;

–Ex 10:
WITH d AS
(SELECT title, company_id, description, COUNT(job_id) AS job_counts
FROM job_listings 
GROUP BY title, description, company_id)
SELECT COUNT(title) AS duplicate_companies FROM d  
WHERE job_counts>1;

–Ex 11:
with a as
(select name as results 
from Users as u
join MovieRating as m
on u.user_id=m.user_id
group by name
order by count(*) desc, name
limit 1),
b as
(select title as results
from Movies as i
join MovieRating as m
on i.movie_id=m.movie_id
where extract(month from created_at)=2
      and extract(year from created_at)=2020
group by title
order by avg(rating) desc, title
limit 1)
select * from a
union all 
select * from b;

–Ex 12:
WITH cte as
(SELECT requester_id FROM RequestAccepted
UNION ALL SELECT accepter_id FROM RequestAccepted)
SELECT DISTINCT requester_id as id, COUNT(requester_id) as num
from cte
group by requester_id
order by COUNT(requester_id) desc
limit 1;




