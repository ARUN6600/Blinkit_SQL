Create database Blinkit


use blinkit


select * from [BlinkIT-Grocery-Data]

----------------------------------------------------------DATA CLEANING----------------------------------------------------------------------------------------------------------------

--ITEM_FAT_CONTENT DISTINCT
SELECT DISTINCT(ITEM_FAT_CONTENT) FROM [BlinkIT-Grocery-Data]

UPDATE [BlinkIT-Grocery-Data]
SET Item_Fat_Content = 'Regular'
WHERE Item_Fat_Content = 'reg'


UPDATE [BlinkIT-Grocery-Data]
SET Item_Fat_Content = 'Low Fat'
WHERE Item_Fat_Content = 'LF'


--REMOVE ITEM_VISIBILITY WHICH IS 0.
DELETE [BlinkIT-Grocery-Data]
WHERE Item_Visibility = '0'


--CHANGE NULL VALUE INTO O THEN REMOVE FROM THE LIST BECUSE IT GIVES ERROR CHANGE DATATPYE VARCHAR TO FLOAT 
UPDATE [BlinkIT-Grocery-Data]
SET Item_Weight = '0'
WHERE Item_Weight IS NULL

DELETE [BlinkIT-Grocery-Data]
WHERE Item_Weight = '0'


--ROUND 2 DIGIT SALES DATA 
UPDATE [BlinkIT-Grocery-Data]
SET Sales = ROUND(SALES,2) 
WHERE SALES = SALES 


--ROUND 2 DIGIT ITEM_WEIGHT
UPDATE [BlinkIT-Grocery-Data]
SET Item_Weight = ROUND(Item_Weight,2)
WHERE Item_Weight = Item_Weight


--ROUND 2 DIGIT Item_Visibility
UPDATE [BlinkIT-Grocery-Data]
SET Item_Visibility = ROUND(Item_Visibility,2)
WHERE Item_Visibility = Item_Visibility


--DELETE NULL VALUES FROM THE BlinkIT-Grocery-Data.
DELETE FROM [BlinkIT-Grocery-Data]
WHERE RATING IS NULL


