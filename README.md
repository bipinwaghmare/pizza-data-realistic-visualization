# pizza-data-realistic-visualization

# 🍕 Pizza Orders Data Cleaning & Preparation using SQL

## 📌 Project Overview
This project demonstrates end-to-end data cleaning, standardization, and feature engineering on a commercial pizza restaurant orders dataset using **SQL**. Raw operational datasets often contain inconsistencies, unformatted text strings, missing values, and redundant fields. This project showcases how structured SQL queries can transform messy raw data into a clean, highly reliable, and analysis-ready relational dataset.

---

<img width="1337" height="741" alt="BI1" src="https://github.com/user-attachments/assets/581be5f9-1b6c-4862-a48e-690e8710a87d" />


## 🛠️ Dataset Schema & Features
The dataset contains transaction, customer, and delivery details spanning multiple dimensions:
* **Order Information:** `Order ID`, `Order_Time_Date`, `Order Hour`, `Is Peak Hour`, `Is Weekend`, `Order Month`
* **Restaurant & Location:** `Restaurant Name`, `Location`, `Distance (km)`, `Traffic Level`
* **Pizza Details:** `Pizza Size`, `Pizza Type`, `Toppings Count`, `Pizza Complexity`, `Items in Order`
* **Financials & Payment:** `Order Value (MYR)`, `Order Value (USD)`, `Payment Method`, `Payment Category`, `Promo Used`
* **Delivery & Performance:** `Delivery Duration (min)`, `Minutes Per KM`, `Customer Rating`, `Weather Condition`, `Driver Experience (yrs)`, `Is Delayed`

---

## 🧹 Key Data Cleaning Steps Performed in SQL
1. **Handling Missing & Null Values:** Identified missing records and handled invalid log entries to prevent distorted metrics.
2. **Text Standardization:** Normalized string values across `Restaurant Name`, `Pizza Type`, `Payment Method`, and `Weather Condition` using string trimming and case manipulation.
3. **Date & Time Formatting:** Parsed timestamps to extract individual components like `Order Hour` and `Order Month`.
4. **Outlier & Metric Validation:** Computed and verified derived metrics such as `Minutes Per KM` and currency conversions (`Order Value (USD)`).
5. **Categorical Encoding & Flagging:** Created boolean flags for operational analysis (e.g., `Is Peak Hour`, `Is Weekend`, `Is Delayed`).

---

## 💻 Sample SQL Queries
Here is a snippet of the data cleaning and transformation logic used in this project:

```sql
-- Standardize text formatting and filter valid records
SELECT 
    UPPER(TRIM(Restaurant Name)) AS Cleaned_Restaurant,
    LOWER(TRIM(Pizza Type)) AS Cleaned_Pizza_Type,
    Payment Method,
    Order Value (MYR)
FROM pizza_orders
WHERE Order Value (MYR) > 0;

-- Flagging peak delivery hours and calculating delivery efficiency
SELECT 
    Order ID,
    Delivery Duration (min),
    Distance (km),
    ROUND(Delivery Duration (min) / NULLIF(Distance (km), 0), 2) AS Calculated_Minutes_Per_KM
FROM pizza_orders;

📜 ##License
📌 ###This project is licensed under the MIT License. See the LICENSE file for details.

<img width="1328" height="742" alt="image" src="https://github.com/user-attachments/assets/ec045c06-d85d-4229-b308-89457b91c6bd" />


