The project being conducted is to determine the number of Electric Vehicle (EV) populations in the US. The dataset can be downloaded here: [Dataset EV Population from kaggle](https://www.kaggle.com/datasets/ishmaelkiptoo/us-electric-vehicle-population-data)


There are several steps to process this dataset:
- **Data Transformation** :

Here, we are using two tools: Jupyter Notebook for Python and MySQL.
  1. [Jupyter Notebook for Python](https://github.com/hidan777/DA-/blob/main/EV%20Population/Electric%20Vehicle%20Population%20Transform.ipynb)
2.  [Mysql](https://github.com/hidan777/DA-/blob/main/EV%20Population/Electric%20Vehicle%20Population%20Transform.sql)

- **Data Analysis**: 

At this stage, the transformed dataset is analyzed and several questions are answered before making conclusions, such as:
  1. What is the total number of electric vehicles (EVs) ?
  2. Which EV model is the best-selling?
  3. Which manufacturer sells the most?
  4. Which cities and counties have the most EVs?
  5. etc.

For data analysis, we only use MySQL which can be [accessed here](https://github.com/hidan777/DA-/blob/main/EV%20Population/Electric%20Vehicle%20Population%20Analysis.sql).

- **Data Visualization**: 
Data visualization is done using Power BI tools.



![image](https://github.com/hidan777/DA-/assets/116585951/40cb9334-180f-462e-a8b3-caeed7d58d65)





Based on the results, there are approximately 150 thousand electric vehicles (EVs), produced by 37 manufacturers and across 127 models. The most common model year is 2023, indicating a growing trend over the past five years. This suggests that interest in EVs continues to rise, as sales in the most recent year have consistently increased from the previous year.

The number of EVs eligible under the Clean Alternative Fuel Vehicles (CAFV) program is close to the number of vehicles with unknown status, specifically 62 thousand and 69 thousand vehicles respectively. The large number of unknowns is due to many vehicles not having been researched yet.

In terms of EV types, 22.35% are Plug-in Hybrid Electric Vehicles (PHEVs) and 77.65% are Battery Electric Vehicles (BEVs). The majority of people prefer cars that are powered 100% directly from battery electricity.

Tesla products dominate the EV market, followed by other manufacturers such as Nissan and Chevrolet. Three out of the four most popular EVs are the Model Y, Model 3, and Model S.

Lastly, the data reveals that the city of Seattle has the highest number of EV enthusiasts, with a total of 26 thousand vehicles. This is significantly more than in Bellevue and Redmond, which have 8 thousand and 6 thousand vehicles respectively.



