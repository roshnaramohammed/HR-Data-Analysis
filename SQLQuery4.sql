USE [Human Resource];

SELECT * FROM hr;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'hr';

SELECT birthdate FROM hr;

-- Update 'birthdate' column
UPDATE hr
SET birthdate = CASE
      WHEN birthdate LIKE '%/%' THEN CONVERT(DATE, CONVERT(DATE, birthdate, 101), 23)
      WHEN birthdate LIKE '%-%' THEN CONVERT(DATE, CONVERT(DATE, birthdate, 101), 23)
      ELSE NULL
   END;

-- Update 'hire_date' column
UPDATE hr
SET hire_date = CASE
      WHEN hire_date LIKE '%/%' THEN CONVERT(DATE, CONVERT(DATE, hire_date, 101), 23)
      WHEN hire_date LIKE '%-%' THEN CONVERT(DATE, CONVERT(DATE, hire_date, 101), 23)
      ELSE NULL
   END;

-- Modify 'hire_date' column data type
ALTER TABLE hr
ALTER COLUMN hire_date DATE;

-- Add 'age' column
ALTER TABLE hr
ADD age INT;

-- Update 'age' column
UPDATE hr
SET age = DATEDIFF(YEAR, birthdate, GETDATE());

SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;

SELECT count(*) FROM hr WHERE age < 18;

-- Count employees with a future termination date
SELECT COUNT(*) FROM hr WHERE termdate > GETDATE();

SELECT Distinct(location) FROM hr;