-- QUESTIONS
USE [Human Resource];

SELECT * FROM hr;
-- 1. What is the gender breakdown of employees in the company?

SELECT gender,COUNT(gender) AS Employees FROM hr 
WHERE termdate IS NULL
GROUP BY gender
ORDER BY Employees DESC
-- 2. What is the race/ethnicity breakdown of employees in the company?

SELECT race,COUNT(race) As Employees FROM hr
WHERE termdate IS NULL
GROUP BY race
ORDER BY Employees DESC


-- 3. What is the age distribution of employees in the company?

WITH AgeRangesCTE AS (
 SELECT
    CASE
      WHEN age >= 20 AND age <= 30 THEN '20-30'
      WHEN age >= 31 AND age <= 40 THEN '31-40'
      WHEN age >= 41 AND age <= 50 THEN '41-50'
      WHEN age >= 51 AND age <= 60 THEN '51-60'
    END AS AgeRange,
    Age
 FROM hr
 WHERE termdate IS NULL
)

SELECT AgeRange,COUNT(Age) AS Employees
FROM AgeRangesCTE
GROUP BY AgeRange
ORDER BY AgeRange;

-- 4. How many employees work at headquarters versus remote locations?
 
 SELECT location, Count(location) AS Employees FROM hr
 WHERE termdate IS NULL
 GROUP BY location

-- 5. How does the gender distribution vary across departments and job titles?
  
  SELECT department,gender,Count(*) AS Employees FROM hr
  WHERE termdate IS NULL
  GROUP BY department,gender

-- 6. What is the distribution of job titles across the company?
  SELECT jobtitle,Count(*) AS Employees FROM hr
  WHERE termdate IS NULL
  GROUP BY jobtitle
  ORDER BY Employees Desc

-- 7. What is the distribution of employees across locations by city and state?
  SELECT location_state,location_city,Count(*) AS Employees FROM hr
  WHERE termdate IS NULL
  GROUP BY location_city,location_state
  ORDER BY Employees Desc
