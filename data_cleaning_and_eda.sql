-- ====================================================================
-- PROJECT: Pizza Orders Data Cleaning & Exploratory Data Analysis (EDA)
-- DATABASE: PostgreSQL / MySQL / SQL Server / SQLite compatible
-- ====================================================================

-----------------------------------------------------------------------
-- PART 1: DATA CLEANING & STANDARDIZATION
-----------------------------------------------------------------------

-- 1. Check for Duplicate Orders
SELECT 
    "Order ID", 
    COUNT(*) AS Duplicate_Count
FROM pizza_data_cleaned
GROUP BY "Order ID"
HAVING COUNT(*) > 1;


-- 2. Standardize Text Strings (Remove extra whitespaces and standardize cases)
UPDATE pizza_data_cleaned
SET "Restaurant Name" = TRIM("Restaurant Name"),
    "Pizza Size" = TRIM("Pizza Size"),
    "Pizza Type" = TRIM("Pizza Type"),
    "Payment Method" = TRIM("Payment Method"),
    "Weather Condition" = TRIM("Weather Condition");


-- 3. Validate and Handle Anomalies in Numerical Fields (e.g., zero or negative durations)
SELECT 
    "Order ID", 
    "Delivery Duration (min)", 
    "Distance (km)"
FROM pizza_data_cleaned
WHERE "Delivery Duration (min)" <= 0 OR "Distance (km)" <= 0;


-- 4. Verify/Create Derived Column: Minutes Per KM
-- (Checks delivery efficiency calculation consistency)
SELECT 
    "Order ID",
    "Delivery Duration (min)",
    "Distance (km)",
    "Minutes Per KM",
    ROUND(CAST("Delivery Duration (min)" AS FLOAT) / NULLIF("Distance (km)", 0), 2) AS Calculated_Minutes_Per_KM
FROM pizza_data_cleaned
LIMIT 10;


-----------------------------------------------------------------------
-- PART 2: EXPLORATORY DATA ANALYSIS (EDA)
-----------------------------------------------------------------------

-- 1. Overall Sales & Revenue Summary
SELECT 
    COUNT("Order ID") AS Total_Orders,
    SUM("Order Value (USD)") AS Total_Revenue_USD,
    AVG("Order Value (USD)") AS Average_Order_Value_USD,
    AVG("Customer Rating") AS Overall_Avg_Rating
FROM pizza_data_cleaned;


-- 2. Total Revenue and Average Rating by Restaurant
SELECT 
    "Restaurant Name",
    COUNT("Order ID") AS Total_Orders,
    ROUND(CAST(SUM("Order Value (USD)") AS NUMERIC), 2) AS Total_Revenue,
    ROUND(CAST(AVG("Customer Rating") AS NUMERIC), 2) AS Avg_Customer_Rating
FROM pizza_data_cleaned
GROUP BY "Restaurant Name"
ORDER BY Total_Revenue DESC;


-- 3. Delayed Order Rate by Restaurant
SELECT 
    "Restaurant Name",
    COUNT("Order ID") AS Total_Orders,
    SUM(CASE WHEN "Is Delayed" = TRUE THEN 1 ELSE 0 END) AS Delayed_Orders,
    ROUND(
        CAST(SUM(CASE WHEN "Is Delayed" = TRUE THEN 1 ELSE 0 END) AS FLOAT) / COUNT("Order ID") * 100, 2
    ) AS Delayed_Order_Percentage
FROM pizza_data_cleaned
GROUP BY "Restaurant Name"
ORDER BY Delayed_Order_Percentage DESC;


-- 4. Impact of Traffic Level on Delivery Duration
SELECT 
    "Traffic Level",
    COUNT("Order ID") AS Total_Orders,
    ROUND(CAST(AVG("Delivery Duration (min)") AS NUMERIC), 2) AS Avg_Delivery_Duration,
    ROUND(CAST(AVG("Minutes Per KM") AS NUMERIC), 2) AS Avg_Minutes_Per_KM
FROM pizza_data_cleaned
GROUP BY "Traffic Level"
ORDER BY Avg_Delivery_Duration DESC;


-- 5. Monthly Revenue Trends
SELECT 
    "Order Month",
    ROUND(CAST(SUM("Order Value (USD)") AS NUMERIC), 2) AS Monthly_Revenue,
    COUNT("Order ID") AS Monthly_Orders
FROM pizza_data_cleaned
GROUP BY "Order Month"
ORDER BY Monthly_Revenue DESC;


-- 6. Customer Ratings Across Order Hours
SELECT 
    "Order Hour",
    COUNT("Order ID") AS Total_Orders,
    ROUND(CAST(AVG("Customer Rating") AS NUMERIC), 2) AS Avg_Rating
FROM pizza_data_cleaned
GROUP BY "Order Hour"
ORDER BY "Order Hour";
