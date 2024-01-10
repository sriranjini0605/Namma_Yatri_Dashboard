# Namma_Yatri_Dashboard

## Overview 
Namma Yatri is an autorickshaw aggregator service similar to Ola Auto and Uber Auto but with some key differences as you will see later in this article.
It has been launched in Bangalore and while there are plans to expand it to other cities.
The website of Namma Yatri application has a real time dashboard and real time numbers on how many searches have been made on the app, what have been the drivers earnings and what is estimated of the number of completed trips that particular day. 
I have mimicked this dashboard and learn all the concepts from data exploration, data cleaning and manipulation to data visualisation. 

## Data Sources: 
The primary dataset is a csv file containing information about all the actions taken by both the customer and the driver.

## Tools: 
1. Excel : Data cleaning
2. SQL Server Management Studio: Data analysis
3. Power BI : Creating reports

## Data cleaning/preparation : 
In the initial stage, I performed the following tasks: 
1. Data loading 
2. Handling missing values
3. Data cleaning and formatting

## Data Analysis :
Exploratory data analysis included examining the data to answer key questions such as : 
1. Which area got the highest cancellations of rides from the driver?
2. Which is the most used payment method by customers?
3. Which duration had the highest trips?
4. Top 5 earning drivers
5. Which two locations had the most trips?

## Results/ Findings:
The analysis results are summarised as follows : 
1. Padmanabha nagar and Byatarayanapura got the highest cancellations from drivers.
2. Payment method 4 which is credit card is the most preferred and used payment method by customers.
3. The duration that got the highest trips and made the most earnings was from 11-12pm.
4. The top five earning drivers had the following ids : 8, 12, 21, 24 and 30
5. The location id’s for the two locations that had the most trips are 35,5 and 16,21.

## Data Visualization:
The visual dashboard has an overview of the following according to the location chosen by the person viewing it on that day:
1. It contains the number of completed trips, searches made by the customer for that particular location.
2. The driver earnings for that particular day. 
3. It has a gauge axis that shows how many searches have converted to complete trips.
4. It has graphs that give us an insight of how many trips were made in that duration, what was the total fare for that duration and the total distance travelled during that particular time.
5. It has a map which shows each area of Bangalore with the trip count.
