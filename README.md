# Video Game Global Sales by Genre (Relational SQL & Tableau)

🔗 **[Live Interactive Tableau Dashboard](https://public.tableau.com/views/VideoGameGlobalSalesbyGenre_17795026858570/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

## Project Overview
This project focuses on analyzing market trends and financial performance data for top-selling video games. Moving beyond flat-file analysis, this project utilizes a relational database structure across separate informational and financial tables. By writing intermediate SQL queries (including multi-table joins and conditional classification logic) and building a Tableau data relationship, this analysis identifies revenue drivers and volume metrics by industry genre and publisher.

## Technical Skills Demonstrated
* **Database Querying:** Advanced Aggregations, Multi-table `LEFT JOIN` operations, Grouping logic.
* **Data Transformation:** Conditional logic via `CASE WHEN` to engineer custom reporting buckets.
* **Business Intelligence:** Relational data modeling, data extracts, and interactive dashboarding inside Tableau.

## Relational Database Structure
The project utilizes two separate datasets linked together by a unique primary/foreign key (`game_id`):
1. `games.csv`: Contains structural game data (`title`, `genre`, `release_year`, `publisher`).
2. `sales.csv`: Contains regional and global revenue metrics in millions of units (`na_sales`, `eu_sales`, `jp_sales`, `global_sales`).

## Key Queries & Insights

### 1. Publisher Deep Dive (Multi-Table Join & Aggregate)
* **Objective:** Extract the absolute financial footprint and average historical timeline for Take-Two Interactive.
* **SQL Query:**
SELECT games.game_id, AVG(games.release_year) AS 'Average Release Year', games.publisher, SUM(sales.global_sales) AS 'Global Sales Sum' FROM games LEFT JOIN sales ON games.game_id = sales.game_id WHERE publisher = 'Take-Two Interactive';

### 2. Market Segmentation (Conditional Logic via CASE WHEN)
* **Objective:** Transform raw sales numbers into corporate-facing performance brackets to flag mega-blockbusters dynamically.
* **SQL Query:**
SELECT games.title AS 'Title', sales.global_sales AS 'Global Sales', CASE WHEN sales.global_sales > 100 THEN 'All-Time Legend' WHEN sales.global_sales >= 40 AND sales.global_sales <= 100 THEN 'Mega Blockbuster' ELSE 'Standard Hit' END AS 'Sales Tier' FROM games LEFT JOIN sales ON games.game_id = sales.game_id;

### 3. Industry Genre Analysis (Multidimensional Aggregation)
* **Objective:** Unify both tables to calculate total unit volume alongside total global sales revenue broken down by individual genre.
* **SQL Query:**
SELECT games.genre AS 'Genre', COUNT(games.genre) AS 'Total Games Released', SUM(sales.global_sales) AS 'Total Global Sales' FROM games LEFT JOIN sales ON games.game_id = sales.game_id GROUP BY games.genre;


## Core Conclusions
* **Genre Dominance:** Sandbox and Action genres represent a significant portion of overall global revenue within the dataset, providing highly concentrated returns relative to title volume.
* **Relational Power:** Splitting transactional sales data away from operational asset details creates a cleaner, highly scalable database architecture while allowing seamless join analysis for reporting.

