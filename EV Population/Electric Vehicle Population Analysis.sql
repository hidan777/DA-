-- Analyzing EV Population

--  5 best-selling car model and manufacturer 
Select model, count(*) 'Sum of model', round(count(*) * 100 / (SELECT COUNT(*) FROM electric_vehicle_population_data),2) AS Presentage
from electric_vehicle_population_data
group by Model
order by count(*) DESC
limit 5;

Select  Make 'Manufacturer', count(*) 'Sum of manufacturer', 
round(count(*) * 100 / (SELECT COUNT(*) FROM electric_vehicle_population_data),2) AS Presentage
from electric_vehicle_population_data
group by Make
order by count(*) DESC
limit 5;

-- the most successful production year for Tesla based on the model year
SELECT `Model Year`, count(*) 'Sum of model year'
FROM electric_vehicle_population_data
group by `Model Year`
order by count(*) DESC;

SELECT `Model Year` , count(*) 'Sum of model year'
FROM electric_vehicle_population_data
where Make = 'Tesla'
group by `Model Year`
order by count(*) DESC;


-- Cites and counties with most EV 
select City,count(*) 'Sum of city'
from electric_vehicle_population_data
group by City
limit 5;

select County,count(*) 'Sum of county'
from electric_vehicle_population_data
group by County
order by count(*) DESC
limit 10;

-- The most common models and manufacturers in the most adaptive counties and cities for EV
select County,Model, Make Manufacturer,count(*) 'Sum of model'
from electric_vehicle_population_data
where County = 'King'
group by Model,Make
order by count(*) DESC
limit 10;

select City,Model, Make Manufacturer,count(*) 'Sum of model'
from electric_vehicle_population_data
where City = 'Seattle'
group by Model,Make
order by count(*) DESC
limit 10;

-- Most Eligible, Not Eligible and Unknown CAFV Manufacturer 
SELECT Make Manufacturer, SUM(CASE WHEN `CAFV Eligibility` = 'Eligible' THEN 1 ELSE 0 END) 'Eligible',
SUM(CASE WHEN `CAFV Eligibility` = 'Not eligible' THEN 1 ELSE 0 END)  'Not eligible',
SUM(CASE WHEN `CAFV Eligibility` = 'Unknown' THEN 1 ELSE 0 END) 'Unknown'
FROM electric_vehicle_population_data
GROUP BY Make;

-- Count of EV Type each of manufacturer
SELECT Make Manufacturer, SUM(CASE WHEN `EV Type` = 'BEV' THEN 1 ELSE 0 END) 'BEV',
SUM(CASE WHEN `EV Type` = 'PHEV' THEN 1 ELSE 0 END)  'PHEV'
FROM electric_vehicle_population_data
GROUP BY Make;

-- Most popular EV type 
SELECT  SUM(CASE WHEN `EV Type` = 'BEV' THEN 1 ELSE 0 END) 'BEV',
SUM(CASE WHEN `EV Type` = 'PHEV' THEN 1 ELSE 0 END)  'PHEV'
FROM electric_vehicle_population_data;

-- Most electric utilities are used for EV
SELECT CONCAT_WS('',`Electric Utility 1` ,`Electric Utility 2`) 'Electric utility',count(CONCAT_WS('',`Electric Utility 1` ,`Electric Utility 2`)) 'Sum of electric utility'
FROM electric_vehicle_population_data
group by CONCAT_WS('',`Electric Utility 1` ,`Electric Utility 2`)
order by Count(CONCAT_WS('',`Electric Utility 1` ,`Electric Utility 2`)) DESC;  