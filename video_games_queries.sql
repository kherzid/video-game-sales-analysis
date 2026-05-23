--1. Find the total global sales and average release year for a specific publisher. 

SELECT games.game_id, avg(games.release_year) AS 'Average Release Year' , 
games.publisher, sum(sales.global_sales) AS 'Global Sales Sum'
FROM games LEFT JOIN sales 
ON games.game_id = sales.game_id
WHERE publisher = 'Take-Two Interactive';

-- 2. Write a query that lists every game's title and its global sales, and creates a custom Sales Tier column.

SELECT games.title as 'Title', sales.global_sales as 'Global Sales', 
CASE WHEN sales.global_sales > 100 THEN 'All-Time Legend'
WHEN sales.global_sales >= 40 AND sales.global_sales <= 100 THEN 'Mega Blockbuster'
ELSE 'Standard Hit' END AS 'Sales Tier'
FROM games LEFT JOIN sales 
ON games.game_id = sales.game_id;

-- 3. Write a query that shows the total global sales and the total number of games for each genre in the database.
SELECT games.genre AS 'Genre', 
count(games.genre) AS 'Total Games Released', 
sum(sales.global_sales) as 'Total Global Sales'
FROM games LEFT JOIN sales 
ON games.game_id = sales.game_id
GROUP BY games.genre;
