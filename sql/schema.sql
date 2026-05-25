CREATE DATABASE IF NOT EXISTS collegedb;

USE collegedb;

DROP TABLE IF EXISTS amazon_prime;

CREATE TABLE amazon_prime (
    show_id VARCHAR(20),
    type VARCHAR(20),
    title TEXT,
    director TEXT,
    cast_members TEXT,
    country TEXT,
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(30),
    listed_in TEXT,
    description TEXT
);

ALTER TABLE amazon_prime
ADD COLUMN added_date DATE;

ALTER TABLE amazon_prime
ADD COLUMN duration_num INT;