---------------------------------------------------------------
-- World Life Expectancy Project (Exploratory Data Analysis) --
---------------------------------------------------------------


SELECT *
FROM world_life_expectancy
;

# Find out the life increase of each country
SELECT Country,
MIN(`Life expectancy`),
MAX(`Life expectancy`),
ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`),1) AS life_increase_15_years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0 AND MAX(`Life expectancy`) <> 0
ORDER BY life_increase_15_years DESC
;

# Average life expectancy by year
SELECT Year,
ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
GROUP BY Year
;

# Find out if there is a corelation between life expectancy and GDP
SELECT Country, ROUND(AVG(`Life expectancy`), 2) AS life_exp, ROUND(AVG(GDP), 2) AS GDP
FROM world_life_expectancy
WHERE `Life expectancy` > 0
AND GDP > 0
GROUP BY Country
ORDER BY GDP DESC, life_exp DESC
;

# Count of countries with high and low GDP and the average lift expectancy of high and low GDP countries
SELECT
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) AS High_GDP_Count,
ROUND(AVG(CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END),2) AS High_GDP_Life_Expectancy,
SUM(CASE WHEN GDP < 1500 THEN 1 ELSE 0 END) AS Low_GDP_Count,
ROUND(AVG(CASE WHEN GDP < 1500 THEN `Life expectancy` ELSE NULL END),2) AS Low_GDP__Life_Expectancy
FROM world_life_expectancy
;

# Count countries by status and the average life expectancy
SELECT Status,
COUNT(DISTINCT Country),
ROUND(AVG(`Life expectancy`), 1)
FROM world_life_expectancy
GROUP BY Status
;

# Find out if there is a corelation between life expectancy and BMI
SELECT Country, ROUND(AVG(`Life expectancy`), 2) AS life_exp, ROUND(AVG(BMI), 2) AS BMI
FROM world_life_expectancy
WHERE `Life expectancy` > 0
AND BMI > 0
GROUP BY Country
ORDER BY BMI DESC, life_exp DESC
;

# Discover the rolling total of adult mortality by country over the year
SELECT Country,
Year,
 `Life expectancy`,
 `Adult Mortality`,
 SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year ASC) AS Rolling_Total
FROM world_life_expectancy
WHERE Country LIKE '%United%'
;