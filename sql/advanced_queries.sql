USE collegedb;

-- Rank content by release year
SELECT
    title,
    release_year,
    RANK() OVER (
        ORDER BY release_year DESC
    ) AS rank_num
FROM amazon_prime;

-- Dense rank
SELECT
    title,
    release_year,
    DENSE_RANK() OVER (
        ORDER BY release_year DESC
    ) AS dense_rank_num
FROM amazon_prime;

-- Running total
SELECT
    YEAR(added_date) AS year_added,
    COUNT(*) AS yearly_content,
    SUM(COUNT(*)) OVER (
        ORDER BY YEAR(added_date)
    ) AS running_total
FROM amazon_prime
GROUP BY year_added;

-- CTE example
WITH country_stats AS (
    SELECT
        country,
        COUNT(*) AS total_titles
    FROM amazon_prime
    WHERE country IS NOT NULL
    GROUP BY country
)

SELECT *
FROM country_stats
WHERE total_titles > 50;

-- Latest release using subquery
SELECT
    title,
    release_year
FROM amazon_prime
WHERE release_year = (
    SELECT MAX(release_year)
    FROM amazon_prime
);