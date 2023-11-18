-- Analyzing EV Population


-- What is the total number of Electric Vehicles (EVs), and how many manufacturers and models exist in the EV market?

SELECT count(`VIN (1-10)`) 'Count of EVs'
FROM electric_vehicle_population_data;

SELECT count( distinct `Make`) 'Count of Manufacturer'
FROM electric_vehicle_population_data;

SELECT count( distinct `Model`) 'Count of Model'
FROM electric_vehicle_population_data ;

-- Which are the top 5 best-selling EV models and their manufacturers?
Select model, count(*) 'Count of model', round(count(*) * 100 / (SELECT COUNT(*) FROM electric_vehicle_population_data),2) AS Presentage
from electric_vehicle_population_data
group by Model
order by count(*) DESC
limit 5;

Select  Make 'Manufacturer', count(*) 'Count of manufacturer', 
round(count(*) * 100 / (SELECT COUNT(*) FROM electric_vehicle_population_data),2) AS Presentage
from electric_vehicle_population_data
group by Make
order by count(*) DESC
limit 5;

-- What was the most successful production year for Tesla based on the model year?
SELECT `Model Year`, count(*) 'Count of model year'
FROM electric_vehicle_population_data
group by `Model Year`
order by count(*) DESC;

SELECT `Model Year` , count(*) 'Count of model year'
FROM electric_vehicle_population_data
where Make = 'Tesla'
group by `Model Year`
order by count(*) DESC;


-- Which cities and counties have the highest number of EVs?
select City,count(*) 'Count of city'
from electric_vehicle_population_data
group by City
limit 5;

select County,count(*) 'Count of county'
from electric_vehicle_population_data
group by County
order by count(*) DESC
limit 10;

-- What are the most common EV models and manufacturers in the cities and counties with the highest EV adoption?
select County,Model, Make Manufacturer,count(*) 'Count of model'
from electric_vehicle_population_data
where County = 'King'
group by Model,Make
order by count(*) DESC
limit 10;

select City,Model, Make Manufacturer,count(*) 'Count of model'
from electric_vehicle_population_data
where City = 'Seattle'
group by Model,Make
order by count(*) DESC
limit 10;

-- Which manufacturers are most eligible, not eligible, and unknown for the Clean Alternative Fuel Vehicle (CAFV) program?
SELECT Make Manufacturer, SUM(CASE WHEN `CAFV Eligibility` = 'Eligible' THEN 1 ELSE 0 END) 'Eligible',
SUM(CASE WHEN `CAFV Eligibility` = 'Not eligible' THEN 1 ELSE 0 END)  'Not eligible',
SUM(CASE WHEN `CAFV Eligibility` = 'Unknown' THEN 1 ELSE 0 END) 'Unknown'
FROM electric_vehicle_population_data
GROUP BY Make;

-- What is the count of each type of EV produced by each manufacturer?
SELECT Make Manufacturer, SUM(CASE WHEN `EV Type` = 'BEV' THEN 1 ELSE 0 END) 'BEV',
SUM(CASE WHEN `EV Type` = 'PHEV' THEN 1 ELSE 0 END)  'PHEV'
FROM electric_vehicle_population_data
GROUP BY Make;

-- What is the most popular type of EV?
SELECT  SUM(CASE WHEN `EV Type` = 'BEV' THEN 1 ELSE 0 END) 'BEV',
SUM(CASE WHEN `EV Type` = 'PHEV' THEN 1 ELSE 0 END)  'PHEV'
FROM electric_vehicle_population_data;

-- Which electric utilities are most commonly used for EVs?
SELECT CONCAT_WS('',`Electric Utility 1` ,`Electric Utility 2`) 'Electric utility',count(CONCAT_WS('',`Electric Utility 1` ,`Electric Utility 2`)) 'Sum of electric utility'
FROM electric_vehicle_population_data
group by CONCAT_WS('',`Electric Utility 1` ,`Electric Utility 2`)
order by Count(CONCAT_WS('',`Electric Utility 1` ,`Electric Utility 2`)) DESC;  
