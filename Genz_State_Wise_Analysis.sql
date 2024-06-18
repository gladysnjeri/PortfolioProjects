--Database to use

USE GenZ;
GO

--Inspect the data
SELECT * FROM ['Career Responses$'] 
SELECT * FROM ['India_pincode $']

--Filter data only by India
SELECT * FROM ['Career Responses$']
WHERE Country = 'India'

--Total Responses
SELECT COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']

--State-wise contribution of Gender-wise responses
SELECT
    State,
	Gender,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,Gender
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of influencing factors
SELECT
    State,
	[Influencing Factors],
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,[Influencing Factors]
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of Higher Study Aspiration
SELECT
    State,
	[Higher Education Aspiration],
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,[Higher Education Aspiration]
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of 3 Years of Employment
SELECT
    State,
	LongevityLikelihood_3YrsPlus,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,LongevityLikelihood_3YrsPlus
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of the likelihood of working (Question not clear)
--Mission clarity preference
SELECT
    State,
	CompanyMissionClarityPreference,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,CompanyMissionClarityPreference
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--Action Mislignment tolerance
SELECT
    State,
	CompanyMissionActionMislignmentTolerance,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,CompanyMissionActionMislignmentTolerance
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of not bringing social impact
SELECT
    State,
	SocialImpactImportanceRating,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,SocialImpactImportanceRating
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of preferred working environment
SELECT
    State,
	PreferredWorkEnvironment,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,PreferredWorkEnvironment
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of employer preference
SELECT
    State,
	EmployerPreference,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,EmployerPreference
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of the learning environment
SELECT
    State,
	Preferred_Learning_Env_Type,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,Preferred_Learning_Env_Type
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of aspirational job
SELECT
    State,
	Aspirational_Job_Selection,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,Aspirational_Job_Selection
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of mananger preference
SELECT
   State,
   PreferredManagerType,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,PreferredManagerType
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of the work setup
SELECT
    State,
	Preferred_Work_Setup,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,Preferred_Work_Setup
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of laid-off employees
SELECT
    State,
	WillingnessToJoinPostLayoffs,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,WillingnessToJoinPostLayoffs
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of work for 7 years
SELECT
    State,
	LikelihoodToStay_7YrsPlus,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,LikelihoodToStay_7YrsPlus
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of minimum salary expected at 3 years
SELECT
    State,
	MinExpectedMonthlySalary_3Yrs,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,MinExpectedMonthlySalary_3Yrs
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of maximum salary expected at 3 years (Data not present)

--State-wise contribution of the breakdown of minimum salary expected at 5 years
SELECT
    State,
	MinExpectedMonthlySalary_5Yrs,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,MinExpectedMonthlySalary_5Yrs
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of the No remote working policy
SELECT
    State,
	WillingnessToWork_NoRemotePolicy,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,WillingnessToWork_NoRemotePolicy
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of the starting salary expected
SELECT
    State,
	MinStartingSalaryExpectations,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,MinStartingSalaryExpectations
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of work for a company
--Prefered company
SELECT
    State,
	Preferred_Company_Type,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,Preferred_Company_Type
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;


--State-wise contribution of the breakdown of managers who use abusive words
SELECT
    State,
	Tolerance_For_Abusive_Leadership,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,Tolerance_For_Abusive_Leadership
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of hours you will work every day
SELECT
    State,
	Daily_Work_Hours_Willingness,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,Daily_Work_Hours_Willingness
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of full week break
SELECT
    State,
	Weekly_Break_Interval_Needed,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,Weekly_Break_Interval_Needed
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of productive at work
SELECT
    State,
	Happiness_Productivity_Factor,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,Happiness_Productivity_Factor
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;

--State-wise contribution of the breakdown of frustrate you at work
SELECT
    State,
	Work_Frustration_Factors,
    COUNT(*) AS 'Total Responses',
    CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') AS 'Contribution Percentage'
FROM
    ['Career Responses$'] AS c
JOIN 
	['India_pincode $'] AS z
ON 
	c.[Zip Code / Pin Code]=z.Pincode
GROUP BY
	State,Work_Frustration_Factors
ORDER BY 
	State,CONCAT(ROUND((CAST(COUNT(*) AS FLOAT) * 100.0 / (SELECT COUNT(*) FROM ['Career Responses$'])), 2), '%') DESC;