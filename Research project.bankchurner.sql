SELECT 
    *
FROM
    researchproject.bankchurner;
    -- Number of Attrited Customers based on Age_group
SELECT 
    CASE
        WHEN Customer_Age BETWEEN 20 AND 30 THEN '20-30'
        WHEN Customer_Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Customer_Age BETWEEN 40 AND 50 THEN '40-50'
        WHEN Customer_Age BETWEEN 50 AND 60 THEN '50-60'
        WHEN Customer_Age > 60 THEN '60 Above'
    END AS 'Age Group',
    COUNT(*) AS 'Number of Attrited Customer'
FROM
    researchproject.bankchurner
WHERE
    Attrition_Flag = 'Attrited Customer'
GROUP BY 1
ORDER BY 1;
-- Distribution of Attrited customers based on age group
SELECT 
    SUM(IF(Gender = 'M', 1, 'NULL')) AS 'Male Attrited Customers',
    SUM(IF(Gender = 'F', 1, 'NULL')) AS 'Female Attrited Customers'
FROM
    bankchurner
WHERE
    Attrition_Flag = 'Attrited Customer';
    -- or
SELECT 
    COUNT(CASE
        WHEN Gender = 'M' THEN 1
        ELSE NULL
    END) AS 'Male Attrited Customers',
    COUNT(CASE
        WHEN Gender = 'F' THEN 1
        ELSE NULL
    END) AS 'Female Attrited Customers'
FROM
    bankchurner
WHERE
    Attrition_Flag = 'Attrited Customer';
-- Distribution of existing customers based on gender
SELECT 
    Attrition_Flag,
    COUNT(CASE
        WHEN GENDER = 'M' THEN 1
        ELSE NULL
    END) AS 'Male',
    COUNT(CASE
        WHEN GENDER = 'F' THEN 1
        ELSE NULL
    END) AS 'Female'
FROM
    bankchurner
GROUP BY 1;
-- Dispersion of existing and attrited customers per education level
SELECT 
    Attrition_Flag,
    COUNT(CASE
        WHEN Education_Level = 'College' THEN 1
        ELSE NULL
    END) AS 'College',
    COUNT(CASE
        WHEN Education_Level = 'Doctorate' THEN 1
        ELSE NULL
    END) AS 'Doctorate',
    COUNT(CASE
        WHEN Education_Level = 'Graduate' THEN 1
        ELSE NULL
    END) AS 'Graduate',
    COUNT(CASE
        WHEN Education_Level = 'High School' THEN 1
        ELSE NULL
    END) AS 'High School',
    COUNT(CASE
        WHEN Education_Level = 'Post-Graduate' THEN 1
        ELSE NULL
    END) AS 'Post_graduate',
    COUNT(CASE
        WHEN Education_Level = 'Uneducated' THEN 1
        ELSE NULL
    END) AS 'Uneducated',
    COUNT(CASE
        WHEN Education_Level = 'Unknown' THEN 1
        ELSE NULL
    END) AS 'Unknown'
FROM
    bankchurner
GROUP BY 1;
-- Distribution of exixting and attrited customers per marital status
SELECT 
    Attrition_Flag,
    COUNT(CASE
        WHEN Marital_Status = 'Married' THEN 1
        ELSE NULL
    END) AS Married,
    COUNT(CASE
        WHEN Marital_Status = 'Single' THEN 1
        ELSE NULL
    END) AS single,
    COUNT(CASE
        WHEN Marital_Status = 'Unknown' THEN 1
        ELSE NULL
    END) AS Unknown,
    COUNT(CASE
        WHEN Marital_Status = 'Divorced' THEN 1
        ELSE NULL
    END) AS Divorced
FROM
    bankchurner
GROUP BY 1;
-- Dispersion of customers per income category
SELECT 
    Attrition_Flag,
    COUNT(CASE
        WHEN Income_Category = '$120K +' THEN 1
        ELSE NULL
    END) AS '$120k +',
    COUNT(CASE
        WHEN Income_Category = '$40K - $60K' THEN 1
        ELSE NULL
    END) AS '$40K - $60K',
    COUNT(CASE
        WHEN Income_Category = '$60K - $80K' THEN 1
        ELSE NULL
    END) AS '$60K - $80K',
    COUNT(CASE
        WHEN Income_Category = '$80K - $120K' THEN 1
        ELSE NULL
    END) AS '$80K - $120K',
    COUNT(CASE
        WHEN Income_Category = 'Less than $40K' THEN 1
        ELSE NULL
    END) AS 'Less than $40K',
    COUNT(CASE
        WHEN Income_Category = 'Unknown' THEN 1
        ELSE NULL
    END) AS 'Unknown'
FROM
    bankchurner
GROUP BY 1
ORDER BY 1 ASC;
-- Months on book range of attrited customers
SELECT 
    CASE
        WHEN Months_on_book < 20 THEN '0-20'
        WHEN Months_on_book BETWEEN 20 AND 30 THEN '20-30'
        WHEN Months_on_book BETWEEN 30 AND 40 THEN '30-40'
        WHEN Months_on_book BETWEEN 40 AND 50 THEN '40-50'
        WHEN Months_on_book > 50 THEN '50 Above'
    END AS 'Tenure of relationship(months)',
    COUNT(*) AS 'Number of attrited customers'
FROM
    bankchurner
WHERE
    Attrition_Flag = 'Attrited Customer'
GROUP BY 1
ORDER BY 1;
-- Distribution of attrited customers based on their inactivity
SELECT 
    Attrition_Flag,
    COUNT(CASE
        WHEN Months_Inactive_12_mon = '0' THEN 1
        ELSE NULL
    END) AS '0',
    COUNT(CASE
        WHEN Months_Inactive_12_mon = '1' THEN 1
        ELSE NULL
    END) AS '1',
    COUNT(CASE
        WHEN Months_Inactive_12_mon = '2' THEN 1
        ELSE NULL
    END) AS '2',
    COUNT(CASE
        WHEN Months_Inactive_12_mon = '3' THEN 1
        ELSE NULL
    END) AS '3',
    COUNT(CASE
        WHEN Months_Inactive_12_mon = '4' THEN 1
        ELSE NULL
    END) AS '4',
    COUNT(CASE
        WHEN Months_Inactive_12_mon = '5' THEN 1
        ELSE NULL
    END) AS '5',
    COUNT(CASE
        WHEN Months_Inactive_12_mon = '6' THEN 1
        ELSE NULL
    END) AS '6'
FROM
    bankchurner
GROUP BY 1
ORDER BY 1 ASC;
    -- Average utilization ratio of both attrited and existing customers
SELECT 
    Attrition_Flag,
    ROUND(AVG(Avg_Utilization_Ratio), 3) AS 'Average Utilization ratio'
FROM
    bankchurner
GROUP BY 1;



