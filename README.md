# 🍕 Pizza Orders: Data Cleaning & Visualization (SQL + Power BI)

## 📌 Project Overview
This project covers end-to-end data cleaning, standardization, and feature engineering on a pizza restaurant orders dataset using **SQL**, followed by an interactive **Power BI dashboard** for analysis.

Raw operational data often contains inconsistent text, missing values, and redundant fields. This project shows how structured SQL queries can turn messy raw data into a clean, reliable, analysis-ready dataset, and how that data can be visualized to find delivery and sales insights.

---

## 🛠️ Tools Used
- **SQL**: data cleaning, transformation, feature engineering
- **Power BI**: dashboard design and visualization
- **Excel**: source data (`pizza_data_cleaned.xlsx`)

---

## 📊 Dashboard Preview

### Page 1
<img width="1337" height="741" alt="BI1" src="https://github.com/user-attachments/assets/581be5f9-1b6c-4862-a48e-690e8710a87d" />

### Page 2
<img width="1351" height="746" alt="image" src="https://github.com/user-attachments/assets/e003cc04-9307-4615-99f2-c498a2fc36e0" />

### Page 3
<img width="1332" height="732" alt="BI3" src="https://github.com/user-attachments/assets/36460c26-0181-4cf5-ba59-604c82cdf148" />

### Page 4
<img width="1337" height="737" alt="BI4" src="https://github.com/user-attachments/assets/53a25543-978d-4e60-90d8-906024854e64" />

### Page 5
<img width="967" height="667" alt="BI5" src="https://github.com/user-attachments/assets/0ff4d065-6fd4-4e65-bea6-836341004ece" />

---

## 🗂️ Dataset Schema & Features
The dataset contains transaction, customer, and delivery details:

| Category | Columns |
|---|---|
| **Order Information** | `Order ID`, `Order_Time_Date`, `Order Hour`, `Is Peak Hour`, `Is Weekend`, `Order Month` |
| **Restaurant & Location** | `Restaurant Name`, `Location`, `Distance (km)`, `Traffic Level` |
| **Pizza Details** | `Pizza Size`, `Pizza Type`, `Toppings Count`, `Pizza Complexity`, `Items in Order` |
| **Financials & Payment** | `Order Value (MYR)`, `Order Value (USD)`, `Payment Method`, `Payment Category`, `Promo Used` |
| **Delivery & Performance** | `Delivery Duration (min)`, `Minutes Per KM`, `Customer Rating`, `Weather Condition`, `Driver Experience (yrs)`, `Is Delayed` |

---

## 🧹 Key Data Cleaning Steps (SQL)
1. **Handling missing & null values:** identified missing records and handled invalid entries to avoid distorted metrics.
2. **Text standardization:** normalized `Restaurant Name`, `Pizza Type`, `Payment Method`, and `Weather Condition` using trimming and case functions.
3. **Date & time formatting:** parsed timestamps to extract `Order Hour` and `Order Month`.
4. **Outlier & metric validation:** computed and verified derived metrics such as `Minutes Per KM` and `Order Value (USD)`.
5. **Categorical flagging:** created flags for operational analysis (`Is Peak Hour`, `Is Weekend`, `Is Delayed`).

---

## 💻 Sample SQL Queries

```sql
-- Standardize text formatting and filter valid records
SELECT
    UPPER(TRIM("Restaurant Name")) AS Cleaned_Restaurant,
    LOWER(TRIM("Pizza Type"))      AS Cleaned_Pizza_Type,
    "Payment Method",
    "Order Value (MYR)"
FROM pizza_orders
WHERE "Order Value (MYR)" > 0;

-- Calculate delivery efficiency (minutes per km)
SELECT
    "Order ID",
    "Delivery Duration (min)",
    "Distance (km)",
    ROUND("Delivery Duration (min)" / NULLIF("Distance (km)", 0), 2) AS Calculated_Minutes_Per_KM
FROM pizza_orders;
```

> Quoting style depends on your database: use `"Column Name"` in PostgreSQL, `[Column Name]` in SQL Server, and backticks in MySQL.

---

## 🔍 Key Insights
- Add 3 to 5 findings from your dashboard here, with numbers
- Example: "Delivery time increases by X% during peak hours"
- Example: "Orders in heavy traffic had an average rating of X"

---

## 📁 Repository Structure
```
├── data/            # Dataset
├── sql/             # Cleaning and transformation queries
├── dashboard/       # Power BI (.pbix) file
└── README.md
```

---

## 🚀 How to Use
1. Clone the repository: `git clone https://github.com/bipinwaghmare/pizza-data-realistic-visualization.git`
2. Run the SQL scripts in the `sql/` folder on your database.
3. Open the `.pbix` file in **Power BI Desktop** to explore the dashboard.

---

## 📜 License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 📬 Contact
**Bipin Waghmare**
[LinkedIn](https://www.linkedin.com/in/bipin-waghmare-2bb623167) | [Portfolio](https://bipinwaghmare.github.io/Bipin_Portfolio/) | [GitHub](https://github.com/bipinwaghmare)
