-- CREATE A DATABASE 
CREATE DATABASE Netflix_titles;
USE Netflix_titles;

-- CREATE TABLE 
CREATE TABLE Netflix(
  show_id VARCHAR(100) PRIMARY KEY,
  type VARCHAR(100),
  title VARCHAR(700),
  director VARCHAR(500),
  country VARCHAR(200),
  date_added VARCHAR(50),
  release_year VARCHAR(50),
  rating VARCHAR(100),
  duration VARCHAR(100),
  listed_in TEXT
);

-- DATA IMPORTED USING 'TABLE DATA IMPORT WIZARD'

-- View dataset
SELECT *
FROM Netflix;

SELECT COUNT(*)
FROM Netflix;

-- The show_id cloumn is the primary key for the dataset so we are going to check duplicates
SELECT show_id, COUNT(*) AS COUNT
FROM Netflix
GROUP BY show_id
HAVING COUNT > 1;
-- No duplicates

-- Check null in all the columns
SELECT COUNT(*),
	   SUM(CASE WHEN show_id IS NULL OR show_id = '' THEN 1 ELSE 0 END) AS show_id_nulls,
	   SUM(CASE WHEN type IS NULL OR type = '' THEN 1 ELSE 0 END) AS type_nulls,
	   SUM(CASE WHEN title IS NULL OR title = '' THEN 1 ELSE 0 END) AS title_nulls,
	   SUM(CASE WHEN director IS NULL OR director = '' THEN 1 ELSE 0 END) AS director_nulls,
	   SUM(CASE WHEN country IS NULL OR country = '' THEN 1 ELSE 0 END) AS country_nulls,
	   SUM(CASE WHEN date_added IS NULL OR date_added = '' THEN 1 ELSE 0 END) AS date_added_nulls,
	   SUM(CASE WHEN release_year IS NULL OR release_year = '' THEN 1 ELSE 0 END) AS release_year_nulls,
	   SUM(CASE WHEN rating IS NULL OR rating = '' THEN 1 ELSE 0 END) AS rating_nulls,
	   SUM(CASE WHEN duration IS NULL OR duration = '' THEN 1 ELSE 0 END) AS duration_nulls,
	   SUM(CASE WHEN listed_in IS NULL OR listed_in = '' THEN 1 ELSE 0 END) AS listed_in_nulls
FROM Netflix;

-- Total rows is same in all columns

-- Key Business Questions

-- 1. How many Movies vs TV Shows are there on Netflix?
SELECT type, COUNT(*) total
FROM netflix
GROUP BY type
ORDER BY total DESC;

-- 2. What type of content (Movies vs TV Shows) dominates Netflix’s catalog over the years?
SELECT type, release_year, COUNT(*) AS total_titles
FROM Netflix
GROUP BY type, release_year
ORDER BY type, release_year;

-- 3. What countries produces the most content on Netflix?
SELECT country, COUNT(*) AS total_content
FROM Netflix
GROUP BY country
ORDER BY total_content DESC
LIMIT 10;

-- 4. What are the top genres ("listed_in") offered on Netflix?
SELECT listed_in, COUNT(*) AS total
FROM netflix
GROUP BY listed_in
ORDER BY total desc
LIMIT 10;

-- 5. In which YEAR(release year) does netflix added the most content?
SELECT COUNT(*) AS total_content, release_year
FROM netflix
GROUP BY release_year
ORDER BY total_content DESC
LIMIT 1;

-- 6. What are the most common movie durations or TV show formats (e.g., number of seasons)?
SELECT Duration, COUNT(*) AS total_movies
FROM netflix
WHERE type = 'movie'
GROUP BY Duration
ORDER BY total_movies DESC
LIMIT 10;

SELECT Duration, COUNT(*) AS total_shows
FROM netflix
WHERE type = 'TV show'
GROUP BY Duration
ORDER BY total_shows DESC
LIMIT 10;

-- 7. Which directors have contributed the most content to Netflix?
SELECT director, COUNT(*) AS total_content
FROM netflix
GROUP BY director
ORDER BY total_content DESC
LIMIT 10 OFFSET 1;

-- 8. Which is the oldest and newest show on Netflix?
     -- Query for oldest show
SELECT title, type, release_year
FROM Netflix
ORDER BY release_year ASC
LIMIT 1;

     -- Query for newest show
SELECT title, type, release_year
FROM Netflix
ORDER BY release_year DESC
LIMIT 1;

-- 9. Which countries have more TV Shows than Movies?
SELECT country, 
       SUM(CASE WHEN type = 'movie' THEN 1 ELSE 0 END) AS total_movie,
	   SUM(CASE WHEN type = 'tv show' THEN 1 ELSE 0 END) AS total_shows
FROM netflix
GROUP BY country
HAVING total_shows > total_movie;


-- END OF THE PROJECT




   
   








  
