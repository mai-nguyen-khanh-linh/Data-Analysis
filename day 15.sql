–ex 1:
select 
EXTRACT(year from transaction_date) as year,
product_id, 
sum(spend) over (PARTITION BY EXTRACT(year from transaction_date), product_id) as curr_year_spend,
lag(spend) over (PARTITION BY product_id order by EXTRACT(year from transaction_date)) as prev_year_spend,
round(
sum(spend) over (PARTITION BY EXTRACT(year from transaction_date), product_id)*100.0
/lag(spend) over (PARTITION BY product_id order by EXTRACT(year from transaction_date)) - 100
:: DECIMAL,2) as yoy_rate
from user_transactions
order by product_id;

–ex 2:
SELECT DISTINCT card_name,
first_value(issued_amount) over(PARTITION BY card_name order by issue_year, issue_month ) as issued_amount
from monthly_cards_issued
group by DISTINCT(card_name), issued_amount, issue_month, issue_year
order by issued_amount desc;

–ex 3:
SELECT    
  user_id,    
  tweet_date,   
  round((AVG(tweet_count) OVER (
    PARTITION BY user_id     
    ORDER BY tweet_date)
  ),2) AS rolling_avg_3d
FROM tweets;

–ex 4:
with cte AS
(SELECT transaction_date, user_id, rank() OVER(PARTITION BY user_id order by transaction_date desc) as no,
count(*) over (PARTITION BY user_id)
FROM user_transactions)
select transaction_date, user_id, count(*)
from cte
WHERE no=1
group by transaction_date, user_id;

–ex 5:
SELECT    
  user_id,    
  tweet_date,   
  round((AVG(tweet_count) OVER (
    PARTITION BY user_id     
    ORDER BY tweet_date)
  ),2) AS rolling_avg_3d
FROM tweets;

–ex 6:
with cte AS
(select *, lag(transaction_timestamp) 
over (PARTITION BY merchant_id,credit_card_id,amount order by 
transaction_timestamp) as prv_transaction_time
from transactions)
select count(transaction_id) as payment_count
from cte   
WHERE EXTRACT(EPOCH from transaction_timestamp - prv_transaction_time)/60 <=10

–ex 7:
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

–ex 8:
with ctee AS
(
with cte AS
(select DISTINCT a.artist_name as artist_name, 
count(c.song_id) over(PARTITION BY artist_name) as cnt  
from artists as a  
join songs as b  
on a.artist_id=b.artist_id
join global_song_rank as c 
on b.song_id=c.song_id
ORDER BY count(c.song_id) over(PARTITION BY artist_name) DESC)
select DISTINCT artist_name, 
dense_rank() over(order by cnt desc) as artist_rank
from cte
ORDER BY dense_rank() over(order by cnt desc)
)
select * from ctee
where artist_rank <=5


