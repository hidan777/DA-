The project being conducted is to determine the number of Electric Vehicle (EV) populations in the US. The dataset can be downloaded here: [Dataset US EV Population from kaggle](https://www.kaggle.com/datasets/ishmaelkiptoo/us-electric-vehicle-population-data)


There are several steps to process this dataset:
- **Data Transformation** :

Here, we are using two tools: Jupyter Notebook for Python and MySQL.
  1. [Jupyter Notebook for Python](https://github.com/hidan777/DA-/blob/main/EV%20Population/Electric%20Vehicle%20Population%20Transform.sql)
2.  [Mysql](https://github.com/hidan777/DA-/blob/main/EV%20Population/Electric%20Vehicle%20Population%20Transform.sql)

- **Data Analysis**: 

At this stage, the transformed dataset is analyzed and several questions are answered before drawing conclusions, such as:
  1. What is the total number of electric vehicles (EVs) ?
  2. Which EV model is the best-selling?
  3. Which manufacturer sells the most?
  4. Which cities and counties have the most EVs?
  5. etc.

For data analysis, we only use MySQL which can be [accessed here](https://github.com/hidan777/DA-/blob/main/EV%20Population/Electric%20Vehicle%20Population%20Analysis.sql).

- **Data Visualization**: 
Data visualization is done using Power BI tools.



![image](https://github.com/hidan777/DA-/assets/116585951/b484074b-d95d-4d98-860a-07dc42255a12)



From the visualization results, the total number of circulating EVs is about 149 thousand vehicles, divided into 35 manufacturers and 124 models. The most common model year is 2023. This trend has been increasing over the past 5 years. It can be said that the interest in EVs continues to increase because sales in the latest year at that time always increase from the previous year. The comparison of Clean Alternative Fuel Vehicles (CAFV) that are eligible with unknown is very close, namely 62 thousand vehicles and 69 thousand vehicles. The large number of unknowns is because many vehicles have not been researched. The type of EV from the circulating EV is 22.2% Plug-in Hybrid Electric Vehicle (PHEV) and 77.8% Battery Electric Vehicle (BEV). The majority of people prefer cars that are supplied 100% directly from battery electricity. Tesla's product still dominates the circulating EV followed by manufacturers Nissan and Chevron. 3 out of 4 most circulating EVs are Model Y, Model 3, and Model S. And the biggest fans of EVs come from the city of Seattle, reaching 26 thousand vehicles. This is very different from the total in the two cities below it, namely Bellevue and Redmond, which are 8 thousand and 5 thousand respectively. This could be because Seattle is a larger city compared to other cities.




