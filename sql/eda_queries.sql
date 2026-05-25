USE collegedb;

-- Total rows
SELECT COUNT(*) AS total_rows
FROM amazon_prime;

-- Preview dataset
SELECT *
FROM amazon_prime
LIMIT 10;

-- Movies vs TV Shows
SELECT
    type,
    COUNT(*) AS total
FROM amazon_prime
GROUP BY type;

-- Missing values
SELECT
    COUNT(*) AS total_rows,
    COUNT(director) AS director_filled,
    COUNT(country) AS country_filled,
    COUNT(rating) AS rating_filled
FROM amazon_prime;

-- Top countries
SELECT
    country,
    COUNT(*) AS total_content
FROM amazon_prime
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_content DESC
LIMIT 10;

-- Most common ratings
SELECT
    rating,
    COUNT(*) AS total
FROM amazon_prime
GROUP BY rating
ORDER BY total DESC;

-- Yearly content addition
SELECT
    YEAR(added_date) AS year_added,
    COUNT(*) AS total_content
FROM amazon_prime
GROUP BY year_added
ORDER BY year_added;

-- Newest releases
SELECT
    title,
    release_year
FROM amazon_prime
ORDER BY release_year DESC
LIMIT 10;

-- Oldest releases
SELECT
    title,
    release_year
FROM amazon_prime
ORDER BY release_year ASC
LIMIT 10;