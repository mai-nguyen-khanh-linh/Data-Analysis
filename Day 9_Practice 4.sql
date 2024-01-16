--Ex 1:
SELECT 
SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
SUM(CASE WHEN device_type IN ('phone','tablet') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;

--Ex 2:
SELECT *, CASE 
WHEN x<0 OR y<0 OR z<0 THEN 'No'
WHEN x+y>z AND x+z>y AND y+z>x THEN 'Yes'
ELSE 'No'
END AS triangle
FROM Triangle;

--Ex 3:
SELECT ROUND(
SUM(CASE WHEN call_category IS NULL OR call_category='n/a' THEN 1 ELSE 0 END)/
SUM(CASE WHEN call_category IS NOT NULL OR call_category!='n/a' THEN 1 ELSE 0 END)*100,1)
AS call_percentage
FROM callers;

--Ex 4:
SELECT name FROM Customer 
WHERE referee_id !=2 OR referee_id IS NULL;

--Ex 5:
SELECT survived,
COUNT(CASE WHEN pclass=1 AND survived = 1 THEN 1 WHEN pclass=1 AND survived = 0 THEN 0 END) 
AS first_class,
COUNT(CASE WHEN pclass=2 AND survived = 1 THEN 1 WHEN pclass=2 AND survived = 0 THEN 0 END) 
AS second_class,
COUNT(CASE WHEN pclass=3 AND survived = 1 THEN 1 WHEN pclass=3 AND survived = 0 THEN 0 END) 
AS third_class
from titanic
GROUP BY survived;
