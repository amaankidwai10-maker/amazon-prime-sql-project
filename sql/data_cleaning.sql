USE collegedb;

UPDATE amazon_prime
SET rating = 'Unknown'
WHERE rating IS NULL;

UPDATE amazon_prime
SET added_date =
STR_TO_DATE(TRIM(date_added), '%M %d, %Y')
WHERE date_added IS NOT NULL
AND date_added != '';

UPDATE amazon_prime
SET duration_num =
CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED);

CREATE VIEW movies_only AS
SELECT *
FROM amazon_prime
WHERE type = 'Movie';

CREATE VIEW tvshows_only AS
SELECT *
FROM amazon_prime
WHERE type = 'TV Show';