
-- What is the total number of criminal cases over the past three years?
SELECT COUNT(*) TotalCrime
FROM california_crime_data
WHERE DR_NO IS NOT NULL;


SELECT Year, COUNT(*) TotalCrime
FROM california_crime_data
GROUP BY Year;

-- How many criminal cases occurred each year?
SELECT Year, COUNT(*) TotalCrime
FROM california_crime_data
GROUP BY Year;

-- Which area in California is the most dangerous?
SELECT `AREA NAME`, COUNT(*) TotalCrime
FROM california_crime_data
GROUP BY `AREA NAME`
ORDER BY TotalCrime DESC
LIMIT 5;

-- What is the most common type of crime in the year with the highest crime rate, 
-- and what are the top three types of crimes for each three-year period ?

SELECT `Crm Cd Desc` CrimeDescriptions, COUNT(*) TotalCrime
FROM california_crime_data
GROUP BY `Crm Cd Desc`
ORDER BY TotalCrime DESC
LIMIT 3;

SELECT `Crm Cd Desc` CrimeDescriptions, COUNT(*) TotalCrime
FROM california_crime_data
GROUP BY `Crm Cd Desc`
ORDER BY TotalCrime DESC
LIMIT 3;

WITH RankedCrimes AS (
  SELECT
    Year,
    `Crm Cd Desc` CrimeDescriptions,
    COUNT(`Crm Cd Desc`) TotalCrime,
    ROW_NUMBER() OVER (PARTITION BY Year ORDER BY COUNT(`Crm Cd Desc`) DESC) AS RowNum
  FROM
    california_crime_data
  GROUP BY
    Year,
    `Crm Cd Desc`
)
SELECT Year, CrimeDescriptions, TotalCrime
FROM RankedCrimes
WHERE RowNum = 1;

-- What are the ages most vulnerable to becoming crime victims, both overall and for each year?

SELECT `Vict Age`, COUNT(*) totalcrime
FROM california_crime_data
GROUP BY `Vict Age`
ORDER BY totalcrime DESC
LIMIT 10;


-- What is the proportional distribution of crime victims based on gender, considering both the entire dataset and the past three years?
SELECT
  Year,
  ROUND(SUM(`Victim Sex Group` = 'Female') * 100 / COUNT(*), 2) Female_Percentage,
  ROUND(SUM(`Victim Sex Group` = 'Male') * 100 / COUNT(*), 2) Male_Percentage,
  ROUND(SUM(`Victim Sex Group` = 'Others') * 100 / COUNT(*), 2) Others_Percentage
FROM california_crime_data
GROUP BY Year;


SELECT
  ROUND((SELECT COUNT(*) FROM california_crime_data WHERE `Victim Sex Group` = 'Female') * 100 / COUNT(*), 2) Female_Percentage,
  ROUND((SELECT COUNT(*) FROM california_crime_data WHERE `Victim Sex Group` = 'Male') * 100 / COUNT(*), 2) Male_Percentage,
  ROUND((SELECT COUNT(*) FROM california_crime_data WHERE `Victim Sex Group` = 'Others') * 100 / COUNT(*), 2) Others_Percentage
FROM california_crime_data;

SELECT `Crm Cd Desc` CrimeDescriptions, COUNT(*) TotalCrime
FROM california_crime_data
GROUP BY `Crm Cd Desc`
ORDER BY TotalCrime DESC
LIMIT 3;


-- Where do crimes occur most frequently? Provide the top 5 locations.

SELECT `Premis Desc`, COUNT(*) totalcrime
FROM california_crime_data
GROUP BY `Premis Desc`
ORDER BY totalcrime DESC
LIMIT 5;

-- During which daytime phase do crimes most frequently occur?

SELECT `Daytime Phase`, COUNT(*) totalcrime
FROM california_crime_data
GROUP BY `Daytime Phase`
ORDER BY totalcrime DESC;

-- In the area with the highest crime rate, during which daytime phase do crimes most frequently occur?

SELECT `Daytime Phase`, COUNT(*) totalcrime
FROM california_crime_data
WHERE `AREA NAME` = 'central' 
GROUP BY `Daytime Phase`
ORDER BY totalcrime DESC;

-- During which daytime phase do crimes most frequently occur for each three-year period?

WITH RankedCrimes AS (
  SELECT
    Year,
    `Daytime Phase`,
    COUNT(`Daytime Phase`) TotalCrime,
    ROW_NUMBER() OVER (PARTITION BY Year ORDER BY COUNT(`Daytime Phase`) DESC) AS RowNum
  FROM
    california_crime_data
  GROUP BY
    Year,
    `Daytime Phase`
)
SELECT Year, `Daytime Phase`, TotalCrime
FROM RankedCrimes
WHERE RowNum = 1;


-- What is the average discrepancy in days between the occurrence of an event and the time it is reported for each three-year period?

SELECT
  Year,
  ROUND(AVG(`Report-Event Discrepancy`), 0) AvgDiscrepancyDays
FROM california_crime_data
GROUP BY Year;
