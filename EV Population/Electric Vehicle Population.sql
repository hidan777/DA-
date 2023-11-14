-- Remove missing values(NAs) 

DELETE FROM electric_vehicle_population_data WHERE `Legislative District` IS NULL;

-- Shorten the values in the CAFV column

ALTER TABLE electric_vehicle_population_data
ADD COLUMN `CAFV Eligibility` VARCHAR(255);

UPDATE electric_vehicle_population_data
SET `CAFV Eligibility` = CASE
    WHEN `Clean Alternative Fuel Vehicle (CAFV) Eligibility` = 'Clean Alternative Fuel Vehicle Eligible' THEN 'Eligible'
    WHEN `Clean Alternative Fuel Vehicle (CAFV) Eligibility` = 'Not eligible due to low battery range' THEN 'Not eligible'
    WHEN `Clean Alternative Fuel Vehicle (CAFV) Eligibility` = 'Eligibility unknown as battery range has not been researched' THEN 'Unknown'
    ELSE `Clean Alternative Fuel Vehicle (CAFV) Eligibility`
END;

-- Shorten the values in the Electric Vehicle Type column
ALTER TABLE electric_vehicle_population_data
ADD COLUMN `EV Type` VARCHAR(255);

UPDATE electric_vehicle_population_data
SET `EV Type` = CASE
    WHEN `Electric Vehicle Type` = 'Plug-in Hybrid Electric Vehicle (PHEV)' THEN 'PHEV'
    WHEN `Electric Vehicle Type` = 'Battery Electric Vehicle (BEV)' THEN 'BEV'
    ELSE `Electric Vehicle Type`
END;

-- Create longitude and latitude columns

ALTER TABLE electric_vehicle_population_data
ADD COLUMN `Longtitude` DOUBLE,
ADD COLUMN `Latitude` DOUBLE;

-- Updating the 'Longtitude' and 'Latitude' columns based on the 'Vehicle Location' column

UPDATE electric_vehicle_population_data
SET `Longtitude` = 
    CASE
        WHEN LENGTH(SUBSTRING_INDEX(SUBSTRING_INDEX(REPLACE(REPLACE(`Vehicle Location`, 'POINT (', ''), ')', ''), ' ', 2), ' ', -1)) > 0
        THEN SUBSTRING_INDEX(SUBSTRING_INDEX(REPLACE(REPLACE(`Vehicle Location`, 'POINT (', ''), ')', ''), ' ', 2), ' ', 1)
        ELSE NULL
    END,
    `Latitude` = 
    CASE
        WHEN LENGTH(SUBSTRING_INDEX(REPLACE(REPLACE(`Vehicle Location`, 'POINT (', ''), ')', ''), ' ', -1)) > 0
        THEN SUBSTRING_INDEX(REPLACE(REPLACE(`Vehicle Location`, 'POINT (', ''), ')', ''), ' ', -1)
        ELSE NULL
    END;


-- Creating columns Electric Utility 1, Electric Utility 2, etc.

ALTER TABLE electric_vehicle_population_data
ADD COLUMN `Electric Utility 1` VARCHAR(255),
ADD COLUMN `Electric Utility 2` VARCHAR(255),
ADD COLUMN `Electric Utility 3` VARCHAR(255),
ADD COLUMN `Electric Utility 4` VARCHAR(255);


UPDATE electric_vehicle_population_data
SET
    `Electric Utility 1` = CASE
        WHEN LENGTH(REPLACE(`Electric Utility`, '||', '|')) - LENGTH(REPLACE(REPLACE(`Electric Utility`, '||', '|'),'|','')) >= 1 
        THEN SUBSTRING_INDEX(SUBSTRING_INDEX(REPLACE(REPLACE(REPLACE(`Electric Utility`, ' - (WA)', ''), ',', ''), '||', '|'), '|', 1), '|', -1)
        ELSE NULL
    END,
`Electric Utility 2` = CASE
    WHEN LENGTH(REPLACE(`Electric Utility`, '||', '|')) - LENGTH(REPLACE(REPLACE(`Electric Utility`, '||', '|'),'|','')) >= 1 
    THEN SUBSTRING_INDEX(SUBSTRING_INDEX(REPLACE(REPLACE(REPLACE(`Electric Utility`, ' - (WA)', ''), ',', ''), '||', '|'), '|', 2), '|', -1)
    ELSE NULL 
END,

    `Electric Utility 3` = CASE
        WHEN LENGTH(REPLACE(`Electric Utility`, '||', '|')) - LENGTH(REPLACE(REPLACE(`Electric Utility`, '||', '|'),'|','')) >= 2 
        THEN SUBSTRING_INDEX(SUBSTRING_INDEX(REPLACE(REPLACE(REPLACE(`Electric Utility`, ' - (WA)', ''), ',', ''), '||', '|'), '|', 3), '|', -1)
        ELSE NULL
    END,
    `Electric Utility 4` = CASE
        WHEN LENGTH(REPLACE(`Electric Utility`, '||', '|')) - LENGTH(REPLACE(REPLACE(`Electric Utility`, '||', '|'),'|','')) >= 3 
        THEN SUBSTRING_INDEX(SUBSTRING_INDEX(REPLACE(REPLACE(REPLACE(`Electric Utility`, ' - (WA)', ''), ',', ''), '||', '|'), '|', 4), '|', -1)
        ELSE NULL
    END;



select * 
from electric_vehicle_population_data;
 

