CREATE DATABASE ott;

USE ott;

CREATE TABLE ott_customers (
    CustomerID VARCHAR(20),
    Platform VARCHAR(50),
    Age INT,
    AgeGroup VARCHAR(20),
    Gender VARCHAR(20),
    Location VARCHAR(50),
    AccountAge_Months INT,
    SignupDate DATE,
    PreferredLanguage VARCHAR(50),
    SubscriptionType VARCHAR(50)
);

SELECT *FROM ott_customers; 

SELECT COUNT(*) AS Total_Customers
FROM ott_customers;

SELECT DISTINCT Platform
FROM ott_customers;

SELECT CustomerID, COUNT(*) AS Duplicate_Count
FROM ott_customers
GROUP BY CustomerID
HAVING COUNT(*) > 1;

SELECT *
FROM ott_customers
WHERE Platform IS NULL;

SELECT *
FROM ott_customers
WHERE Age < 18 OR Age > 100;

SELECT
    AgeGroup,
    COUNT(*) AS Total_Customers
FROM ott_customers
GROUP BY AgeGroup
ORDER BY Total_Customers DESC;

SELECT
    Location,
    COUNT(*) AS Total_Customers
FROM ott_customers
GROUP BY Location
ORDER BY Total_Customers DESC;

SELECT
    Location,
    COUNT(*) AS Total_Customers
FROM ott_customers
GROUP BY Location
ORDER BY Total_Customers DESC
LIMIT 5;

SELECT Platform, COUNT(*) AS Total_Customers
FROM ott_customers
GROUP BY Platform
ORDER BY Total_Customers DESC;

SELECT Gender, COUNT(*) AS Total_Customers
FROM ott_customers
GROUP BY Gender;

SELECT SubscriptionType, COUNT(*) AS Total_Customers
FROM ott_customers
GROUP BY SubscriptionType
ORDER BY Total_Customers DESC;

SELECT Platform,
ROUND(AVG(AccountAge_Months), 2) AS Avg_Account_Age
FROM ott_customers
GROUP BY Platform
ORDER BY Avg_Account_Age DESC;

SELECT 
    Platform,
    COUNT(*) AS Total_Customers,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS Platform_Rank
FROM ott_customers
GROUP BY Platform;