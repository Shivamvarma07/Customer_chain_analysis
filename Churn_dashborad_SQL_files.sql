CREATE DATABASE customer_churn;
USE customer_churn;
SHOW DATABASES;
USE customer_churn;
 
SHOW TABLES; 
SELECT *
FROM cleaned_churn_data
LIMIT 5;
# Total customers
SELECT COUNT(*) AS Total_Customers
FROM cleaned_churn_data;

# Churn distribution
SELECT Churn,
       COUNT(*) AS Customers
FROM cleaned_churn_data
GROUP BY Churn;

# Customers by contract type
SELECT Contract,
       COUNT(*) AS Total_Customers
FROM cleaned_churn_data
GROUP BY Contract
ORDER BY Total_Customers DESC;

# churn by contract type
SELECT Contract,
       COUNT(*) AS Total_Customers,
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers
FROM cleaned_churn_data
GROUP BY Contract;

# Average monthly charges by churn
SELECT Churn,
       ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charges
FROM cleaned_churn_data
GROUP BY Churn;

#Average tenure by churn
SELECT Churn,
       ROUND(AVG(tenure),2) AS Avg_Tenure
FROM cleaned_churn_data
GROUP BY Churn;

# churn rate by contract type
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM cleaned_churn_data
GROUP BY Contract
ORDER BY Churn_Rate_Percentage DESC;

# churn rate by internet service
SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM cleaned_churn_data
GROUP BY InternetService
ORDER BY Churn_Rate DESC;

# Churn rate by payment method
SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM cleaned_churn_data
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;

# Tech support impact
SELECT
    TechSupport,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM cleaned_churn_data
GROUP BY TechSupport;

# Senior citizen analyze
SELECT
    SeniorCitizen,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM cleaned_churn_data
GROUP BY SeniorCitizen;

# High risk customer segment
SELECT
    Contract,
    InternetService,
    COUNT(*) AS Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers
FROM cleaned_churn_data
GROUP BY Contract, InternetService
ORDER BY Churned_Customers DESC;

