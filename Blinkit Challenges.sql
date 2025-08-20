--CHALLENGES


-------- BASIC SELECT QUESTION.


--1. WRITE A SQL QUERY TO SELECT ALL DATA FROM THE TABLE
SELECT * FROM [BlinkIT-Grocery-Data]


--2. WRITE A SQL QUERY TO SELECT ONLY THE "ITEM IDENTIFIER", "ITEM TYPE", "SALES" COLUMNS.
SELECT Item_Identifier, Item_Type, Sales FROM [BlinkIT-Grocery-Data]


--3. WRITE A SQL QUERY TO SELECT THE FIRST 10 RECORDS BASED ON THE SALES ORDER.
SELECT TOP(10) * 
FROM [BlinkIT-Grocery-Data]
ORDER BY Sales DESC


-------- FILTERING WITH WHERE CHALLENGES.


--4. WRITE A SQL QUERY TO FIND ALL ITEMS WHERE "ITEM FAT CONTENT" IS LOW FAT.
SELECT * FROM [BlinkIT-Grocery-Data]
WHERE Item_Fat_Content = 'Low Fat'


--5. WRITE A SQL QUERY TO FIND ITEMS WITH "SALES" BETWEEN 100 AND 200.
SELECT Item_Type, Sales FROM [BlinkIT-Grocery-Data]
WHERE Sales BETWEEN 100 AND 200


--6. WRITE A SQL QUERY TO FIND ITEMS_TYPE WHERE "OUTLET LOCATION TYPE" IS 'TIER 1' AND "RATING" IS 5.
SELECT Item_Type, Outlet_Location_Type, Rating FROM [BlinkIT-Grocery-Data]
WHERE Outlet_Location_Type = 'Tier 1'
AND 
Rating = '5'


--7. WRITE A SQL QUERY TO FIND ITEMS WHERE "ITEM TYPE" STARTS WITH 'FRUIT'.
SELECT * FROM [BlinkIT-Grocery-Data]
WHERE Item_Type LIKE 'FRUIT%';


--8. WRITE A SQL QUERY TO FIND RECORDS WHERE "OUTLET TYPE" IS EITHER "SUPERMARKET TYPE1" OR "GROCERY STORE".
SELECT * FROM [BlinkIT-Grocery-Data]
WHERE Outlet_Type IN ('Supermarket Type1','Grocery Store');


-------- SORTING WITH ORDER BY CHALLENGES


--9. WRITE A SQL QUERY TO SELECT ALL ITEMS SORTED BY "SALES" IN DESCENDING ORDER SORT BY MULTIPLE COLUMNS
SELECT * FROM [BlinkIT-Grocery-Data]
ORDER BY SALES ASC, Item_Fat_Content ASC, Rating ASC, Item_Visibility ASC;


--10. WRITE A SQL QUERY TO SELECT ITEM SORTED FIRST BY "RATING" DESCENDING, THEN BY "ITEM VISIBILITY" ASCENDING.
SELECT Item_Identifier, Item_Type, Item_Visibility, Item_Weight, Sales, Rating FROM [BlinkIT-Grocery-Data]
ORDER BY Rating DESC, Item_Visibility ASC;



-------- AGGREGATION CHALLENGES (COUNT, SUM, AVG, ETC)


--11. WRITE A SQL QUERY TO COUNT THE TOTAL NUMBER OF ITEMS IN THE TABLE SUM OF A SALES.
SELECT ITEM_TYPE,  COUNT(*) AS 'Total_Iden', SUM(SALES) AS 'Total_Sales' FROM [BlinkIT-Grocery-Data]
GROUP BY ITEM_TYPE


--12. WRITE A SQL QUERY TO CALCULATE THE TOTAL "SALES" ACROSS ALL ITEMS AVERAGE VALUES.
SELECT Outlet_Establishment_year, SUM(SALES) AS 'Total_Sales', AVG(SALES) AS 'Avg_sales' FROM [BlinkIT-Grocery-Data]
GROUP BY Outlet_establishment_year;


--13. WRITE A SQL QUERY TO FIND THE AVERAGE "RATING" OF ALL ITEMS MAXIMUM AND MINIMUM.
SELECT Outlet_Establishment_Year, AVG(RATING) AS 'Avg_Rating', MAX(RATING) AS 'Max_Rating', MIN(RATING) AS 'Min_Rating' FROM [BlinkIT-Grocery-Data]
GROUP BY Outlet_Establishment_Year;


--14. WRITE A SQL QUERY TO FIND THE MAXIMUM "SALES" AND MINIMUM "ITEM VISIBILITY" COUNT DISTINCT VALUES.
SELECT Item_Type, MAX(SALES) AS 'Max_Sales', MIN(ITEM_VISIBILITY) AS 'Min_Visibility', COUNT(DISTINCT(ITEM_TYPE)) AS 'Counts' FROM [BlinkIT-Grocery-Data]
GROUP BY Item_Type;


--15. WRITE A SQL QUERY TO COUNT THE DISTINCT "ITEM TYPE" VALUES 
SELECT COUNT(DISTINCT(ITEM_TYPE)) AS 'Distinct_Item_Type' FROM [BlinkIT-Grocery-Data]


------ Date and String Manipulation Challenges


--16. Write a SQL query to find outlets established after 2015.
SELECT * FROM [BlinkIT-Grocery-Data]
WHERE Outlet_Establishment_Year > 2015;


--17. WRITE A SQL QUERY TO SELECT "ITEM TYPE" AND CONVERT IT TO UPPERCASE CONCATENATION.
SELECT UPPER(Item_Type)AS 'Item_Type_In_Uppercase' FROM [BlinkIT-Grocery-Data]


--18. WRITE A SQL QUERY TO CONCATENATE "ITEM IDENTIFIER" AND "ITEM TYPE" INTO A SINGLE COLUMN CALLED "ITEM DESCRIPTION"
SELECT CONCAT(Item_Identifier,'  ',Item_Type) AS 'Item_Description' FROM [BlinkIT-Grocery-Data]


--19. Total Sales: The overall revenue generated from all items sold.
SELECT FLOOR(SUM(SALES)) AS 'Total_sales_amount' FROM [BlinkIT-Grocery-Data]


--20. Average Sales: The average revenue per sale.
SELECT Item_Type, FLOOR(SUM(SALES))AS 'Total_Revenue' FROM [BlinkIT-Grocery-Data]
GROUP BY Item_Type
ORDER BY Total_Revenue;


--21. Number of Items: The total count of different items sold.
SELECT Item_Type, COUNT(ITEM_TYPE) AS 'Total_Item_Sold' FROM [BlinkIT-Grocery-Data]
GROUP BY Item_Type
ORDER BY Total_Item_Sold;


--22. Average Rating: The average customer rating for items sold.
SELECT Item_Type, AVG(RATING) AS 'Avg_Rating' FROM [BlinkIT-Grocery-Data]
GROUP BY Item_Type
ORDER BY Avg_Rating DESC;


--23. 
--Total Sales by Fat Content:
--Objective: Analyze the impact of fat content on total sales.
--Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.
SELECT 
Item_Fat_Content,
ROUND(SUM(SALES),2) AS 'Sum',
ROUND(AVG(SALES),2) AS 'Avg',
COUNT(SALES) AS 'Count',
AVG(RATING) AS 'Rating' 
FROM [BlinkIT-Grocery-Data]
GROUP BY Item_Fat_Content;


--24. 
--Total Sales by Item Type:
--Objective: Identify the performance of different item types in terms of total sales.
--Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.
SELECT 
Item_Type,
ROUND(SUM(SALES),2) AS 'Total_Sales',
ROUND(AVG(SALES),2) AS 'Avg_Sales',
COUNT(ITEM_TYPE) AS 'No_Of_Items',
AVG(RATING)AS 'Avg_Rating'
FROM [BlinkIT-Grocery-Data]
GROUP BY Item_Type;


--25. 
--Fat Content by Outlet for Total Sales:
--Objective: Compare total sales across different outlets segmented by fat content.
--Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.
SELECT 
Outlet_Type, 
ROUND(SUM(SALES),2) AS 'Total_Sales',
ROUND(AVG(SALES),2) AS 'Avg_Sales',
COUNT(OUTLET_TYPE) AS 'Total_No_Of_Outlet_Type',
AVG(RATING) AS 'Avg_Rating'
FROM [BlinkIT-Grocery-Data]
GROUP BY Outlet_Type


--26. 
--Percentage of Sales by Outlet Size:
--Objective: Analyze the correlation between outlet size and total sales.
SELECT Outlet_Size, COUNT(SALES)*100/COUNT(SALES) AS 'Percentage' FROM [BlinkIT-Grocery-Data]
GROUP BY Outlet_Size --ERROR 


--27. Sales by Outlet Location:
SELECT 
Outlet_Location_Type,
ROUND(SUM(Sales),2) AS 'Total_Sales'
FROM [BlinkIT-Grocery-Data]
GROUP BY Outlet_Location_Type;


--28. 
--All Metrics by Outlet Type:
--Objective: Provide a comprehensive view of all key metrics (Total Sales, Average Sales, Number of Items, Average Rating) broken down by different outlet types.
SELECT 
Outlet_Type, 
ROUND(SUM(SALES),2) AS 'Total_Sales',
AVG(SALES) AS 'Avg_Sales',
COUNT(*) AS 'Number_Of_Items',
AVG(RATING) AS 'Avg_Rating'
FROM [BlinkIT-Grocery-Data]
GROUP BY Outlet_Type;


--29. FOR EACH YEAR OF OUTLET ESTABLISHMENT, HOW DO DIFFERENT OUTLET SIZES PERFORM IN TERMS OF TOTAL SALES, AND HOW DO THEY RANK WITHIN THAT YEAR?
WITH SalesSummary AS (
    SELECT  
        Outlet_Establishment_Year,  
        Outlet_Size,
        SUM(SALES) AS Sales,
        ROUND(AVG(SALES), 2) AS Avg_Sales,
        AVG(RATING) AS Avg_Rating,
        COUNT(ITEM_TYPE) AS No_Of_Total_Item_Type
    FROM [BlinkIT-Grocery-Data]
    GROUP BY Outlet_Establishment_Year, Outlet_Size
)
SELECT *,
    ROW_NUMBER() OVER (
        PARTITION BY Outlet_Establishment_Year 
        ORDER BY Sales DESC
    ) AS rk
FROM SalesSummary
ORDER BY Outlet_Establishment_Year ASC, rk ASC;


------WINDOW FUNCTIONS CHALLENGES


--30. WRITE A SQL QUERY TO ASSIGN ROW NUMBERS TO ITEMS ORDEED BY "SALES" DESCENDING RANK ITEMS.
SELECT *, 
ROW_NUMBER()
OVER
(ORDER BY SALES DESC) AS 'RANKED'
FROM [BlinkIT-Grocery-Data]


--31. WRITE A SQL QUERY TO RANK ITEMS WITHIN EACH "ITEM TYPE" BY "SALES" USEING RANK() RUNNING TOTAL.
SELECT 
Item_Type, Sales,
RANK()
OVER 
(PARTITION BY ITEM_TYPE ORDER BY SALES DESC) AS 'Ranked'
FROM [BlinkIT-Grocery-Data]


--32. WRITE A SQL QUERY TO CALCULATE A RUNNING TOTAL OF "SALES" ORDERED BY "OUTLET ESTABLISHMENT YEAR"
SELECT 
  Item_Type,
  Sales,
  SUM(Sales) OVER (
    PARTITION BY Item_Type 
    ORDER BY Sales DESC 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS Running_Total
FROM [BlinkIT-Grocery-Data];


-------- SET OPERATIONS CHALLENGES (UNION, INTERSECT, EXCEPT)


--33. WRITE A SQL QUERY TO COMBINE ITEMS WITH "RATING" = 5 FROM "TIER 1" LOCATIONS AND ITEMS WITH "RATING" = 4 FROM "TIER 2" LOCATIONS.
SELECT 
Item_Type, Outlet_Location_Type, Rating  
FROM [BlinkIT-Grocery-Data]
WHERE Outlet_Location_Type = 'Tier 1'
AND 
Rating = '5'
UNION
SELECT 
Item_Type, Outlet_Location_Type, Rating
FROM [BlinkIT-Grocery-Data]
WHERE Outlet_Location_Type = 'Tier 2' 
AND 
Rating = '2'
ORDER BY Outlet_Location_Type ASC;


--34. WRITE A SQL QUERY TO FIND "ITEM TYPE" COMMON BETWEEN OUTLETS ESTABLISHED IN 2012 AND 2018. 
SELECT Item_Type, Outlet_Establishment_Year FROM [BlinkIT-Grocery-Data]
WHERE Outlet_Establishment_Year = '2012'
INTERSECT
SELECT Item_Type, Outlet_Establishment_Year FROM [BlinkIT-Grocery-Data]
WHERE Outlet_Establishment_Year = '2018'


--35. WRITE A SQL QUERY TO FIND "OUTLET IDENTFIER" THAT EXIST IN "TIER 3" BUT NOT IN "TIER 1".
SELECT Outlet_Identifier, Outlet_Location_Type FROM [BlinkIT-Grocery-Data]
WHERE Outlet_Location_Type = 'Tier 3'


------ COMPLEX CHALLENGES (COMBINING MULTIPLE CONCEPTS).


--36. WRITE A SQL QUERY TO FIND THE TOP 3 ITEMS BY "SALES" IN EACH "OUTLET LOCATION TYPE" USING WINDOW FUNCTIONS.
SELECT
Outlet_Size,
SUM(SALES)AS 'Total_Sales',
ROW_NUMBER()
OVER 
(PARTITION BY Outlet_Size ORDER BY SALES DESC) AS 'Ranked'
FROM [BlinkIT-Grocery-Data]
GROUP BY Outlet_Size;


--37. WRITE A SQL QUERY TO PIVOT "SALES" SUMS BY "ITEM FAT CONTENT" AS COLUMNS, GROUPED BY "ITEM TYPE" CONDITIONAL AGGREGATION.
SELECT Item_Type, Item_Fat_Content, FLOOR(SUM(SALES)) AS 'Total_Sales' FROM [BlinkIT-Grocery-Data]
GROUP BY Item_Type, Item_Fat_Content
ORDER BY Item_Type ASC, Item_Fat_Content ASC;


--38. WRITE A SQL QUERY TO COUNT ITEMS WHERE "SALES" > 200 AND GROUP BY "RATING"
SELECT 
Item_Type,
Rating,
COUNT(ITEM_TYPE) AS 'Total_Item_Sold',
SALES
FROM [BlinkIT-Grocery-Data]
WHERE Sales > 200
GROUP BY Item_Type, Sales, Rating 
ORDER BY Rating DESC, Total_Item_Sold DESC, Sales DESC;


--39. FOR EACH OUTLET ESTABLISHMENT YEAR, WHAT IS THE TOTAL SALES GENERATED BY EACH OUTLET SIZE, AND HOW DO OUTLET SIZES RANK ALPHABETICALLY WITHIN THAT YEAR?
SELECT Outlet_Establishment_Year,
Outlet_Size,
ROW_NUMBER()
OVER 
(PARTITION BY Outlet_Establishment_Year ORDER BY Outlet_Size asc) 'RANKED',
FLOOR(SUM(Sales)) as 'Total_sales'  FROM [BlinkIT-Grocery-Data]
GROUP BY Outlet_Establishment_Year, Outlet_Size
ORDER BY Outlet_Establishment_Year ASC, Outlet_Size ASC;


--40. FOR EACH OUTLET ESTABLISHMENT YEAR, HOW MANY ITEMS OF EACH TYPE AND FAT CONTENT WERE SOLD?
select Outlet_Establishment_Year, 
Item_Fat_Content, Item_Type, 
Count(Item_Type) as 'Total_Saleing' 
from [BlinkIT-Grocery-Data]
Group by Outlet_Establishment_Year,Item_Fat_Content, Item_Type
Order by Outlet_Establishment_Year asc;


--41. Find the top 3 outlets with the highest average sales per item. Show outlet ID, outlet type, and avg sales.
SELECT
TOP(3)
Outlet_Type,ITEM_TYPE,
ROUND(AVG(SALES),2) AS 'Avg_Sales',
Outlet_Identifier 
FROM [BlinkIT-Grocery-Data]
GROUP BY Outlet_Type,ITEM_TYPE, Outlet_Identifier
ORDER BY (Avg_Sales)DESC;--


--42. SALES BY ITEM TYPE FOR EACH ITEM CALCULATE TOTAL SALES AVERAGE SALES % CONTRIBUTION TO TOTAL SALES. 
SELECT 
Item_Type,
ROUND(SUM(SALES),2) AS 'Total_Sales',
ROUND(AVG(SALES),2) AS 'Avg_Sales',
ROUND(SUM(SALES)*100.0/(SELECT SUM(SALES) FROM [BlinkIT-Grocery-Data]),2) AS 'Percentage'
FROM [BlinkIT-Grocery-Data]
GROUP BY Item_Type
ORDER BY Item_Type;


--43. COMPARE AVERAGE SALES BETWEEN OUTLETS ESTABLISHED BEFORE 2015 AND THOSE AFTER 2015.
SELECT 
ROUND(AVG(CASE WHEN Outlet_Establishment_Year < 2015 THEN SALES END),2) AS 'Avg_sales_before_2015',
ROUND(AVG(CASE WHEN Outlet_Establishment_Year >2015 THEN SALES END),2) AS ' Avg_sales_after_2015'
FROM 
[BlinkIT-Grocery-Data]


--44. GET THE TOP 5 PRODUCTS (ITEM IDENTIFIER WITH THE HIGHEST SALES TO VISIBILITY RATIO.
SELECT TOP(5) 
Item_Identifier,
Item_Type, 
SALES AS 'Total_Sales' FROM [BlinkIT-Grocery-Data]
ORDER BY Total_Sales DESC;


--45. WHAT IS THE AVERAGE SALES FOR EACH OUTLET SIZE CATEGORY -SMALL, MEDIUM AND HIGH - IN THE BLINKIT GROCERY DATASET?
SELECT 
ROUND(AVG(CASE WHEN OUTLET_SIZE = 'Small' THEN SALES END),2) AS 'Small_sales',
ROUND(AVG(CASE WHEN OUTLET_SIZE = 'MEDIUM' THEN SALES END),2) AS 'Medium_sales',
ROUND(AVG(CASE WHEN OUTLET_SIZE = 'HIGH' THEN SALES END),2) AS 'High_sales'
FROM [BlinkIT-Grocery-Data]


--46. ASSUMING PROFIT MARGIN = 20% OF SALES, LIST THE TOP 10 MOST PROFITABLE ITEMS WITH OUTLET INTO.
SELECT TOP(10)
    Item_Identifier,
    Item_Type,
    Outlet_Identifier,
    Outlet_Type,
    Outlet_Location_Type,
    ROUND(Sales * 0.20, 2) AS Profit
FROM [BlinkIT-Grocery-Data]
ORDER BY Profit DESC;


--47. FOR EACH OUTLET SIZE (SMALL, MEDIUM, HIGH), CALCULATE TOTOAL SALES, AVERAGE RATING AND NUMBER OF UNIQUE ITEMS SOLD 
SELECT
Outlet_Size, 
ROUND(SUM(SALES),2) AS 'Total_Sales',
AVG(Rating) AS 'Avg_Sales',
COUNT(DISTINCT(ITEM_TYPE)) AS 'Unique_Item_Sold' 
FROM [BlinkIT-Grocery-Data]
GROUP BY Outlet_Size;


--48. COMPARE TOTAL SALES OF REGUALR VS LOW FAT ITMES, BUT ONLY IN TIER 3 OUTLETS.
SELECT
Outlet_Location_Type,
Item_Fat_Content, 
ROUND(SUM(SALES),2) AS 'Total_Sales'
FROM [BlinkIT-Grocery-Data]
WHERE Outlet_Location_Type = 'Tier 3'
GROUP BY Outlet_Location_Type, Item_Fat_Content;


--49. FIND THE HIGHEST-SELLING ITEM FOR EACH OUTLET_TYPE USING WINDOW FUNCTION (NOT GROUP BY WITH MAX) FORCES YOU TO USE ROW_NUMBER(). 
SELECT 
Outlet_Size,
FLOOR(SUM(Sales)) AS 'Total_Sales',
ROW_NUMBER()
OVER 
(PARTITION BY OUTLET_SIZE ORDER BY Outlet_Size DESC) AS 'Ranked'
FROM [BlinkIT-Grocery-Data]
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;


--50. FIND THE HIGHEST-SELLING ITEM FOR EACH OUTLET USING WINDOW FUNCTION (NOT GROUP BY WITH MAX). FORCES YOU TO USE ROW_NUMBER()
SELECT 
Item_Type,
COUNT(ITEM_TYPE) AS 'Total_Item_Sales',
ROW_NUMBER()
OVER 
(PARTITION BY ITEM_TYPE ORDER BY ITEM_TYPE DESC) AS 'Ranked'
FROM [BlinkIT-Grocery-Data]
GROUP BY Item_Type
ORDER BY Total_Item_Sales DESC;


--51. GROUP RATING INTO BUCKETS (1-2 = Low, 3-4 = Medium, 5= High) AND CALCULATE AVG SALES FRO EACH BUCKET.
SELECT 
Item_Type, 
Rating,
CASE
WHEN RATING BETWEEN '1' AND '2' THEN 'Low_Rating'
WHEN RATING BETWEEN '3' AND '4' THEN 'Medium_Rating'
WHEN RATING = '5' THEN 'High_Rating'
END AS 'Ranking_Bucket',
ROUND(AVG(SALES),2) AS 'Avg_Sales',
FLOOR(SUM(SALES)) AS 'Total_Sales'
FROM [BlinkIT-Grocery-Data]
GROUP BY Item_Type, Rating,
CASE
WHEN RATING BETWEEN '1' AND '2' THEN 'Low_Rating'
WHEN RATING BETWEEN '3' AND '4' THEN 'Medium_Rating'
WHEN RATING = '5' THEN 'High_Rating'
END 
ORDER BY Rating ASC;


--42. FIND THE DIFFERENCE IN SALES BETWEEN REGULAR AND LOW FAT ITEMS FOR EACH OUTLET. USE CASE WHEN AGGRAGATION.
SELECT 
FLOOR(AVG(CASE WHEN ITEM_FAT_CONTENT = 'Regular' THEN SALES END)) AS 'Regualr_Total_Sales',
FLOOR(AVG(CASE WHEN ITEM_FAT_CONTENT = 'Low Fat' THEN SALES END)) AS 'Low_Fat_Total_Sales'
FROM [BlinkIT-Grocery-Data]

