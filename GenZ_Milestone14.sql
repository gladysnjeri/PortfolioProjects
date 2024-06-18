USE GenZ;
GO

--Inspect the data
SELECT * FROM ['Career Responses$'] 

--Distribution of minimum salary expectation when starting their career to third and fifth year
SELECT
    Salary_Type,
    Salary,
    Count
FROM (SELECT 
    'Starting Salary' AS Salary_type, 
    MinStartingSalaryExpectations AS Salary, 
    COUNT(*) AS Count
FROM 
    ['Career Responses$']
GROUP BY 
    MinStartingSalaryExpectations

UNION ALL

SELECT 
    '3rd Year Salary' AS Salary_type, 
    MinExpectedMonthlySalary_3Yrs AS Salary, 
    COUNT(*) AS Count
FROM 
    ['Career Responses$']
GROUP BY 
    MinExpectedMonthlySalary_3Yrs

UNION ALL

SELECT 
    '5th Year Salary' AS Salary_type, 
    MinExpectedMonthlySalary_5Yrs AS Salary, 
    COUNT(*) AS Count
FROM 
    ['Career Responses$']
GROUP BY 
    MinExpectedMonthlySalary_5Yrs
	) AS Survey_data
ORDER BY
    CASE Salary_type
        WHEN 'Starting Salary' THEN 1
        WHEN '3rd Year Salary' THEN 2
        WHEN '5th Year Salary' THEN 3
    END,
    Salary;

--Distribution of maximum salary expectation when starting their career to third and fifth year (No data on this)