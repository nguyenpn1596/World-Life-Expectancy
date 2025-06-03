---------------------------------------------------
-- World Life Expectancy Project (Data Cleaning) --
---------------------------------------------------


SELECT * 
FROM world_life_expectancy
;

# Try to find out duplicates data based on the country name and year

SELECT country, year, CONCAT(country, year), COUNT(CONCAT(country, year)) AS count_country
FROM world_life_expectancy
GROUP BY country, year, CONCAT(country, year)
HAVING count_country > 1
ORDER BY count_country DESC
;

# CONCAT(country, year) will be a unique field, find out rows with more than 1 input
SELECT *
FROM (SELECT Row_ID,
    CONCAT(country, year),
    ROW_NUMBER() OVER(PARTITION BY CONCAT(country, year)) as row_num
    FROM world_life_expectancy) as row_table
WHERE row_num > 1
;

# Delete duplicates data
DELETE FROM world_life_expectancy
WHERE Row_ID IN (
    SELECT Row_ID
    FROM (
        SELECT Row_ID,
        CONCAT(country, year),
        ROW_NUMBER() OVER(PARTITION BY CONCAT(country, year)) as row_num
        FROM world_life_expectancy) as row_table
    WHERE row_num > 1
    )
;
    
SELECT * 
FROM world_life_expectancy
WHERE Status = ''
;

# Find out rows that don't have any data
SELECT DISTINCT Status
FROM world_life_expectancy
WHERE Status <> ''
;

# Find out status of countries
SELECT DISTINCT(Country)
FROM world_life_expectancy
WHERE Status = 'Developing'
;

SELECT DISTINCT(Country)
FROM world_life_expectancy
WHERE Status = 'Developed'
;

/*
UPDATE world_life_expectancy
SET Status = 'Developing'
WHERE Country IN (
    SELECT DISTINCT(Country)
    FROM world_life_expectancy
    WHERE Status = 'Developing'
    )
;
*/

# Update Status for developing countries
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status = 'Developing'
;

# Update Status for developed countries
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.Country = t2.Country
SET t1.Status = 'Developed'
WHERE t1.Status = ''
AND t2.Status = 'Developed'
;


SELECT *
FROM world_life_expectancy
;

# Find empty data on life expectancy colummn
Select Country, Year, `Life expectancy`
FROM world_life_expectancy
WHERE `Life expectancy` = ''
;

# Self Join table to determine the value of life_expectancy in the year before and after 
# Guessing value of life expectancy is the average of the year before and after
SELECT t1.Country, t1.Year, t1.`Life expectancy`,
    t2.Country, t2.Year, t2.`Life expectancy`,
    t3.Country, t3.Year, t3.`Life expectancy`,
    ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
    ON t1.Country = t2.Country
    AND t1.Year = t2.Year -1
JOIN world_life_expectancy t3
    ON t1.Country = t3.Country
    AND t1.Year = t3.Year +1
;

# Update the life expectanccy value
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
    ON t1.Country = t2.Country
    AND t1.Year = t2.Year -1
JOIN world_life_expectancy t3
    ON t1.Country = t3.Country
    AND t1.Year = t3.Year +1
SET t1.`Life expectancy` = ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
WHERE t1.`Life expectancy` = ''
;