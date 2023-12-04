-- Updating the date format in the `Date Rptd` and `Date OCC` fields
UPDATE `california_crime_Data`
SET `Date Rptd` = STR_TO_DATE(`Date Rptd`, '%m/%d/%Y %h:%i:%s %p'),
    `Date OCC` = STR_TO_DATE(`Date OCC`, '%m/%d/%Y %h:%i:%s %p');

-- Adding new important fields and changing the data type of the fields
ALTER TABLE california_crime_Data
MODIFY COLUMN `Date Rptd` DATETIME,
MODIFY COLUMN `DATE OCC` DATETIME,
ADD COLUMN `Victim Sex Group` VARCHAR(10),
ADD COLUMN `Daytime Phase` VARCHAR(20),
ADD COLUMN `Time` TIME,
ADD COLUMN `Report-Event Discrepancy` INT,
ADD COLUMN `Year` INT;

-- Updating the `Time` field by converting values from the `TIME OCC` field to a time format
UPDATE california_crime_Data
SET `Time` = STR_TO_DATE(CONCAT(LPAD(`TIME OCC` div 100, 2, '0'), ':', LPAD(`TIME OCC` mod 100, 2, '0'), ':00'), '%H:%i:%s'),

-- Setting the values of the `Daytime Phase` field based on the values in the `Time` field
`Daytime Phase` = CASE
    WHEN `Time` < '05:00:00' THEN 'Dawn'
    WHEN `Time` < '12:00:00' THEN 'Morning'
    WHEN `Time` < '17:00:00' THEN 'Afternoon'
    WHEN `Time` < '20:00:00' THEN 'Evening'
    ELSE 'Night'
END,

-- Setting the values of the `Victim Sex Group` field based on the values in the `Vict Sex` field
`Victim Sex Group` = CASE
    WHEN `Vict Sex` = 'F' THEN 'Female'
    WHEN `Vict Sex` = 'M' THEN 'Male'
    ELSE 'Others'
END,

-- Setting the values of the `Year` field based on the year from the `DATE OCC` field
`Year` = YEAR(`DATE OCC`),

-- Setting the values of the `Report-Event Discrepancy` field based on the difference in days between `DATE OCC` and `Date Rptd`
`Report-Event Discrepancy` = TIMESTAMPDIFF(DAY, `DATE OCC`, `Date Rptd`);

-- Choose important fields
SELECT `DR_NO`, `DATE OCC`, `AREA NAME`, `Crm Cd`, `Crm Cd Desc`,
       `Vict Age`, `Vict Sex`, `Premis Cd`, `Premis Desc`,
       `Weapon Used Cd`, `Weapon Desc`, `Status`, `Status Desc`, `LAT`,
       `LON`, `Daytime Phase`
FROM california_crime_Data;

-- Create Discrepancy_Data Table and Calculate the Average Discrepancy per Year
SELECT `Year`, 
       ROUND(AVG(`Report-Event Discrepancy`), 0) AS `Avg Discrepancy (days)`
FROM california_crime_Data
GROUP BY `Year`;

