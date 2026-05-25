USE collegedb;

-- Which year had highest content addition?
SELECT
    YEAR(added_date) AS year_added,
    COUNT(*) AS total_content
FROM amazon_prime
GROUP BY year_added
ORDER BY total_content DESC;

-- Top directors
SELECT
    director,
    COUNT(*) AS total_titles
FROM amazon_prime
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;

-- Most common genres
SELECT
    listed_in,
    COUNT(*) AS total
FROM amazon_prime
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;

-- Longest movies
SELECT
    title,
    duration_num
FROM movies_only
ORDER BY duration_num DESC
LIMIT 10;

-- TV shows with most seasons
SELECT
    title,
    duration_num AS seasons
FROM tvshows_only
ORDER BY seasons DESC
LIMIT 10;

-- Movies released after 2015
SELECT
    title,
    release_year
FROM amazon_prime
WHERE type = 'Movie'
AND release_year > 2015;

-- Most common movie ratings
SELECT
    rating,
    COUNT(*) AS total
FROM amazon_prime
WHERE type = 'Movie'
GROUP BY rating
ORDER BY total DESC;

-- Content trend by decade
SELECT
    FLOOR(release_year / 10) * 10 AS decade,
    COUNT(*) AS total_content
FROM amazon_prime
GROUP BY decade
ORDER BY decade;