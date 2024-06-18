--Database to use

USE GenZ;
GO

--Inspect the data
SELECT * FROM ['Career Responses$'] 

--Filter data only by India
SELECT * FROM ['Career Responses$']
WHERE Country = 'India'

--Total Responses
SELECT COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']

--Count of Gender-wise responses
SELECT Gender, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY Gender
ORDER BY [Total Responses] DESC

--Count the breakdown of Influencing Factors
SELECT [Influencing Factors], COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY [Influencing Factors]
ORDER BY [Total Responses]

--Count the breakdown of Higher Study Aspiration
SELECT [Higher Education Aspiration], COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY [Higher Education Aspiration]
ORDER BY [Total Responses] DESC

--Count the breakdown of 3 Years of Employment
SELECT LongevityLikelihood_3YrsPlus, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY LongevityLikelihood_3YrsPlus
ORDER BY [Total Responses] DESC

--Count the breakdown of the likelihood of working (Question not clear)
--Mission clarity preference
SELECT CompanyMissionClarityPreference, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY CompanyMissionClarityPreference
ORDER BY [Total Responses] DESC

--Action Mislignment tolerance
SELECT CompanyMissionActionMislignmentTolerance, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY CompanyMissionActionMislignmentTolerance
ORDER BY [Total Responses] DESC

--Count the breakdown of not bringing social impact
SELECT SocialImpactImportanceRating, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY SocialImpactImportanceRating
ORDER BY [Total Responses] DESC

--Count the breakdown of preferred working environment
SELECT PreferredWorkEnvironment, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY PreferredWorkEnvironment
ORDER BY [Total Responses] DESC

--Count the breakdown of employer preference
SELECT EmployerPreference, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY EmployerPreference
ORDER BY [Total Responses] DESC

--Count the breakdown of the learning environment
SELECT Preferred_Learning_Env_Type, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY Preferred_Learning_Env_Type
ORDER BY [Total Responses] DESC

--Count the breakdown of aspirational job
SELECT Aspirational_Job_Selection, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY Aspirational_Job_Selection
ORDER BY [Total Responses] DESC

--Count the breakdown of mananger preference
SELECT PreferredManagerType, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY PreferredManagerType
ORDER BY [Total Responses] DESC

--Count the breakdown of the work setup
SELECT Preferred_Work_Setup, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY Preferred_Work_Setup
ORDER BY [Total Responses] DESC

--Count the breakdown of laid-off employees
SELECT WillingnessToJoinPostLayoffs, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY WillingnessToJoinPostLayoffs
ORDER BY [Total Responses] DESC

--Count the breakdown of work for 7 years
SELECT LikelihoodToStay_7YrsPlus, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY LikelihoodToStay_7YrsPlus
ORDER BY [Total Responses] DESC

--Count the breakdown of minimum salary expected at 3 years
SELECT MinExpectedMonthlySalary_3Yrs, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY MinExpectedMonthlySalary_3Yrs
ORDER BY [Total Responses] DESC

--Count the breakdown of maximum salary expected at 3 years (Data not present)

--Count the breakdown of minimum salary expected at 5 years
SELECT MinExpectedMonthlySalary_5Yrs, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY MinExpectedMonthlySalary_5Yrs
ORDER BY [Total Responses] DESC

--Count the breakdown of the No remote working policy
SELECT WillingnessToWork_NoRemotePolicy, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY WillingnessToWork_NoRemotePolicy
ORDER BY [Total Responses] DESC

--Count the breakdown of the starting salary expected
SELECT MinStartingSalaryExpectations, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY MinStartingSalaryExpectations
ORDER BY [Total Responses] DESC

--Count the breakdown of work for a company
--Prefered company
SELECT Preferred_Company_Type, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY Preferred_Company_Type
ORDER BY [Total Responses] DESC

--Count the breakdown of managers who use abusive words
SELECT Tolerance_For_Abusive_Leadership, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY Tolerance_For_Abusive_Leadership
ORDER BY [Total Responses] DESC

--Count the breakdown of hours you will work every day
SELECT Daily_Work_Hours_Willingness, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY Daily_Work_Hours_Willingness
ORDER BY [Total Responses] DESC

--Count the breakdown of full week break
SELECT Weekly_Break_Interval_Needed, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY Weekly_Break_Interval_Needed
ORDER BY [Total Responses] DESC

--Count the breakdown of productive at work
SELECT Happiness_Productivity_Factor, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY Happiness_Productivity_Factor
ORDER BY [Total Responses] DESC

--Count the breakdown of frustrate you at work
SELECT Work_Frustration_Factors, COUNT(*) AS 'Total Responses'
FROM ['Career Responses$']
GROUP BY Work_Frustration_Factors
ORDER BY [Total Responses] DESC
