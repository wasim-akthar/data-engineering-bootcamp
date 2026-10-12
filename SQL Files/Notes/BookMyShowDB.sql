/*
Objectives:
- Create a database for BookMyShow and create tables based on it
*/
 
-- Create the project database
CREATE DATABASE BookMyShowDB;
 
-- Switch context so the following statements run against it
USE BookMyShowDB;
 
-- Create a table to hold movie details
CREATE TABLE MovieInfo (
    item_no INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    released_at DATE,
    rating DECIMAL(3,1),
    running BOOLEAN
);
 
-- Load the first batch of movies (genre not tracked yet)
INSERT INTO MovieInfo (name, released_at, rating, running) VALUES
('Inception', '2010-07-16', 8.8, TRUE),
('Interstellar', '2014-11-07', 8.7, TRUE),
('The Dark Knight', '2008-07-18', 9.0, FALSE),
('Dune: Part Two', '2024-03-01', 8.5, TRUE),
('Oppenheimer', '2023-07-21', 8.6, FALSE),
('Avatar: The Way of Water', '2022-12-16', 7.6, FALSE),
('Spider-Man: No Way Home', '2021-12-17', 8.2, TRUE),
('Joker', '2019-10-04', 8.4, FALSE),
('Avengers: Endgame', '2019-04-26', 8.4, FALSE),
('The Batman', '2022-03-04', 7.8, TRUE);
 
-- Business now wants genre tracked too, so extend the schema
ALTER TABLE MovieInfo add genre VARCHAR(50);
 
-- Add a second batch of movies, this time with genre included
INSERT INTO MovieInfo (name, released_at, rating, running, genre) VALUES
('Parasite', '2019-05-30', 8.5, FALSE, 'Thriller'),
('RRR', '2022-03-25', 7.8, FALSE, 'Action'),
('Interstellar', '2014-11-07', 8.7, FALSE, 'Sci-Fi'),
('Kantara', '2022-09-30', 8.2, FALSE, 'Drama'),
('Vikram', '2022-06-03', 8.3, FALSE, 'Action');
 
-- Correct the casing of the movie name for item_no 15
UPDATE MovieInfo SET name="VIKRAM" WHERE item_no=15;
 
-- Remove movies that are still running in theatres, keeping only the finished releases
DELETE FROM MovieInfo WHERE running=TRUE;
 
-- Backfill any movie left without a genre, defaulting it to 'Action'
UPDATE MovieInfo SET genre="Action" WHERE genre IS NULL;
 
-- Check the final state of the table
SELECT * FROM MovieInfo;
 
-- Persist all the changes made above
COMMIT;
