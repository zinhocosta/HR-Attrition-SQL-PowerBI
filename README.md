# HR Attrition Analysis Using SQL & Power BI

## 📊 Project Overview

This project focuses on analyzing employee attrition trends using an HR dataset. The goal is to understand the key factors driving employee turnover and provide actionable insights through data analysis and interactive visualization. By applying SQL queries and visualizing insights in Power BI, the project helps HR teams make data-driven decisions to reduce attrition and improve employee satisfaction.

---

## 🛠️ Tools Used

- **SQL Server** — For querying, aggregation, and KPI extraction  
  👉 [SQL Code](./HR_Insights_&_Trends_Analysis.sql)
- **Power BI** — For data visualization and dashboarding  
  👉 [Dashboard Screenshot](./HR_Insights_&_Trends_Analysis.png)
- **Excel / CSV** — Raw dataset in spreadsheet format  
  👉 [Dataset File](./Dataset/HR_Analytics.xlsx)


---

## 📂 Dataset Description

The dataset contains information on 1470 employees and includes features such as:

- **Demographic details**: Age, Gender, Education, Marital Status
- **Employment details**: Department, Job Role, Monthly Income, Job Level, Business Travel
- **Performance metrics**: Job Satisfaction, Environment Satisfaction, Work-Life Balance, OverTime
- **Attrition status**: Yes/No indicator and trends across segments

---

## ❓ Questions We Want to Answer

1. What is the overall employee attrition rate?
2. Which age groups, departments, and roles face the highest attrition?
3. Does salary slab impact employee turnover?
4. Is overtime contributing to attrition?
5. How does work-life balance affect attrition?
6. Which departments and job roles have higher average salaries?
7. Are there education or demographic patterns related to attrition?

---

## 🧠 Key SQL Concepts Used

### ✅ Basic SQL
- `SELECT`, `GROUP BY`, `ORDER BY`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`

### 🔁 Intermediate SQL
- `CASE` statements
- `JOIN` logic (if extended)
- `ROUND()`, aliases, filtering using `WHERE`

### 🧮 Advanced SQL
- Common Table Expressions (CTEs)
- Subqueries
- Window functions like `RANK() OVER(...)`

---

## 📌 Insights from Analysis

- **Attrition Rate**: Overall attrition is **16.12%**, with the highest occurring among the **26-35 age group**.
- **Job Role**: **Laboratory Technicians**, **Sales Executives**, and **Research Scientists** show the highest attrition counts.
- **Salary Trends**: Employees earning **less than ₹5k** monthly contribute to the majority of attrition.
- **Work-Life Balance**: Attrition is higher among employees with **‘Poor’ or ‘Average’ work-life balance**.
- **Overtime Effect**: Employees working **overtime** exhibit a significantly higher attrition rate.
- **Department Impact**: **Sales** and **R&D departments** have the highest attrition rates.

---

## 🔚 Conclusion

This analysis reveals that employee attrition is influenced by multiple factors like income, overtime, age group, work-life balance, and department. By addressing salary disparities and improving work-life balance, HR managers can significantly reduce turnover.

---

## 📁 Repository Structure

```plaintext
HR-Attrition-Analysis/
├── HR_Analytics.xlsx                # Original Dataset
├── HR_Insights & Trends Analysis.sql   # SQL Queries (Basic to Advanced)
├── PowerBI_Dashboard_Screenshot.png    # Visual Dashboard Snapshot
└── README.md                        # Project Documentation
