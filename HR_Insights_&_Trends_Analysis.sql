/*
====================================================================================
 Project:     HR Insights & Employee Attrition Trends using SQL
 Author:      Mohan Kumar
 Description: This project analyzes employee data to uncover insights related to 
              attrition, compensation, department performance, overtime, and 
              work-life balance using SQL. It applies basic, intermediate, and 
              advanced SQL queries including CTEs and subqueries.
 Tools:       SQL Server, Power BI (for visualization)
====================================================================================
*/

-- Create and use the database

Create database HR_Trends;
use HR_Trends;

-- View the raw data

SELECT * FROM HR_Analytics;

-- Total Records Count

SELECT COUNT(*) AS Total_Record
FROM HR_Analytics;

-- Null Check on EmpID

SELECT COUNT(*) AS Total_Null_Record
FROM HR_Analytics
WHERE EmpID is null;

-- Total Employees by Age Group 

SELECT AgeGroup,
	   COUNT(EmpID) AS Total_Emp
FROM HR_Analytics
GROUP BY AgeGroup
ORDER BY AgeGroup;

-- Employees by Department

SELECT Department,
	   COUNT(EmpID) AS Total_Emp
FROM HR_Analytics
GROUP BY Department
ORDER BY Total_Emp desc;

-- Employees by Salary Slab

SELECT SalarySlab,
	   COUNT(EmpID) AS Total_Emp
FROM HR_Analytics
GROUP BY SalarySlab
ORDER BY Total_Emp desc;

-- Total Employee and AVG hourly rate by Job role 

SELECT JobRole,
       COUNT(EmpID) AS Total_Emp,
	   ROUND(AVG(HourlyRate),2) AS Avg_HourlyRate
FROM HR_Analytics
GROUP BY JobRole
ORDER BY Avg_HourlyRate desc;

-- Employee Count by Gender and Marital Status

SELECT MaritalStatus,
	   Gender,
	   COUNT(*) AS Total_Emp
FROM HR_Analytics
GROUP BY MaritalStatus,Gender
ORDER BY MaritalStatus desc,Gender desc;

-- Business Travel by Age Group

SELECT BusinessTravel,
	   AgeGroup,
	   COUNT(*) AS Total_Emp
FROM HR_Analytics
GROUP BY BusinessTravel,AgeGroup
ORDER BY BusinessTravel ,AgeGroup,Total_Emp desc;

-- Overall Attrition Rate

SELECT COUNT(*) AS Total_Record,
	   SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	   ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100.0 / COUNT(*),2) AS Attrition_Rate
FROM HR_Analytics

-- Attrition by Age Group

SELECT AgeGroup,
	  COUNT(*) AS Total_Record,
	  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition
FROM HR_Analytics
GROUP BY AgeGroup
ORDER BY AgeGroup;

-- Attrition by Job Role

SELECT JobRole,
	   COUNT(*) AS Total_Record,
	   SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition
FROM HR_Analytics
GROUP BY JobRole
ORDER BY Attrition desc;

-- Attrition by Education Field

SELECT EducationField,
	   COUNT(*) AS Total_Record,
	   SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition
FROM HR_Analytics
GROUP BY EducationField
ORDER BY Attrition desc;

-- Attrition by Salary Slab

SELECT SalarySlab,
	   COUNT(*) AS Total_Record,
	   SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition
FROM HR_Analytics
GROUP BY SalarySlab
ORDER BY Attrition desc;

-- Attrition by Department

SELECT Department,
	   COUNT(*) AS Total_Record,
	   SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition
FROM HR_Analytics
GROUP BY Department
ORDER BY Attrition desc;

-- Attrition by Gender

SELECT Gender,
	   COUNT(*) AS Total_Record,
	   SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition
FROM HR_Analytics
GROUP BY Gender
ORDER BY Attrition desc;

-- Attrition Trend by Tenure

SELECT YearsAtCompany,
	   COUNT(*) AS Total_Record,
	   SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition
FROM HR_Analytics
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

------------- Ranking of Department based ON Attrition Rate ----------

WITH Attrition_Rate AS (
SELECT Department,
	   COUNT(*) AS Total_Record,
	   SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition,
	   ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Attrition_Rate
FROM HR_Analytics
GROUP BY Department)

SELECT *,
	   RANK() OVER(ORDER BY Attrition_Rate desc) AS Attrition_Rank
FROM Attrition_Rate;

-------- Employees WITH Above-Average Income in Their Department ---------

SELECT EmpID,Department,MonthlyIncome 
FROM HR_Analytics AS A
WHERE MonthlyIncome > (
	SELECT AVG(MonthlyIncome)
	FROM HR_Analytics AS B
	WHERE A.Department = B.Department
)
ORDER BY MonthlyIncome desc;

-------- Total Employees WITH Above-Average Income in Their Department ---------

SELECT Department,
	   COUNT(*) AS Total_Emp
FROM HR_Analytics AS A
WHERE MonthlyIncome > (
	SELECT AVG(MonthlyIncome)
	FROM HR_Analytics AS B
	WHERE A.Department = B.Department
)
GROUP BY Department
ORDER BY Total_Emp desc;

-- Attrition by Work-Life Balance Category

WITH Category AS (
SELECT *,
	  CASE WHEN WorkLifeBalance = 1 THEN 'Poor'
		   WHEN WorkLifeBalance = 2 THEN 'Average'
		   WHEN WorkLifeBalance = 3 THEN 'Good'
		   WHEN WorkLifeBalance = 4 THEN 'Excellent'
	  END AS WorkLife_Category
FROM HR_Analytics)
SELECT WorkLife_Category,
	   COUNT(*) AS Total,
	   SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition
FROM Category
GROUP BY WorkLife_Category
ORDER BY Attrition desc;

-- Avg Income by Department & Job Role 

SELECT Department,
	   JobRole,
	   ROUND(AVG(MonthlyIncome),2) AS Avg_Income
FROM HR_Analytics
GROUP BY Department,JobRole
ORDER BY Department,JobRole;

-- Overtime vs Non-Overtime Attrition

SELECT OverTime,
	   COUNT(*) AS Total_Emp,
	   SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition,
	   ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Attrition_Rate
FROM HR_Analytics
GROUP BY OverTime;

----------------------------------------------- END --------------------------------------------------
