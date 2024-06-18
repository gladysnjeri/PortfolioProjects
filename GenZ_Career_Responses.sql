--View data

SELECT * FROM GenZ..Responses

--Database to use

USE GenZ;
GO

--Confirm the Exact Names of Table and Columns

SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME LIKE '%Responses%'


--Standardize Column Headers

sp_rename 'Responses.Your Gender', 'Gender'
sp_rename 'Responses.Your Current Country#', 'Country'
sp_rename 'Responses.Your Current Zip Code / Pin Code', 'Zip Code / Pin Code'
sp_rename 'Responses.Which of the below factors influence the most about your career ', 'Influencing Factors'
sp_rename 'Responses.Would you definitely pursue a Higher Education / Post Graduation', 'Higher Education Aspiration'
sp_rename 'Responses.How likely is that you will work for one employer for 3 years or', 'LongevityLikelihood_3YrsPlus'
sp_rename 'Responses.Would you work for a company whose mission is not clearly define', 'CompanyMissionClarityPreference'
sp_rename 'Responses.How likely would you work for a company whose mission is misalig', 'CompanyMissionActionMislignmentTolerance'
sp_rename 'Responses.How likely would you work for a company whose mission is not bri', 'SocialImpactImportanceRating'
sp_rename 'Responses.What is the most preferred working environment for you#', 'PreferredWorkEnvironment'
sp_rename 'Responses.Which of the below Employers would you work with#', 'EmployerPreference'
sp_rename 'Responses.Which type of learning environment that you are most likely to w', 'PreferredLearningEnvType'
sp_rename 'Responses.Which of the below careers looks close to your Aspirational job ', 'AspirationalJobSelection'
sp_rename 'Responses.What type of Manager would you work for without looking into you', 'PreferredManagerType'
sp_rename 'Responses.Which of the following setup you would like to work ?', 'PreferredWorkSetup'
sp_rename 'Responses.Would you work for a company that has Laid-Off Employees recentl', 'WillingnessToJoinPostLayoffs'
sp_rename 'Responses.How likely is that you will work for one employer for 7 years or', 'LikelihoodToStay_7YrsPlus'
sp_rename 'Responses.For the First 3 years of your career, what is your minimum expec', 'MinExpectedMonthlySalary_3Yrs'
sp_rename 'Responses.After 5 years of your career from now, what is your minimum expe', 'MinExpectedMonthlySalary_5Yrs'
sp_rename 'Responses.Would you work for a company that has NO-REMOTE working policy', 'WillingnessToWork_NoRemotePolicy'
sp_rename 'Responses.What is your minimum expectations of salary when you are startin', 'MinStartingSalaryExpectations'
sp_rename 'Responses.What Kind of company would you like to work', 'Preferred_Company_Type'
sp_rename 'Responses.Would you work under a manager who uses abusive words at workpla', 'Tolerance_For_Abusive_Leadership'
sp_rename 'Responses.How many hours would you be willing to work every day', 'Daily_Work_Hours_Willingness'
sp_rename 'Responses.How often do you need a full week break, to stay healthy with th', 'Weekly_Break_Interval_Needed'
sp_rename 'Responses.What would make you happier and productive at work', 'Happiness_Productivity_Factors'
sp_rename 'Responses.What would frustrate you at work ?', 'Work_Frustration_Factors'

--Standardize the data

	--Add new column
ALTER TABLE Responses
ADD Preferred_Work_Setup NVARCHAR(MAX);

	--Populate the new column with the split data

UPDATE Responses
SET Preferred_Work_Setup = (
    SELECT TOP 1 value FROM STRING_SPLIT(PreferredWorkSetup , ',')
);

	--Drop the old columns
ALTER TABLE Responses
DROP COLUMN PreferredWorkSetup;

	--Repeat for other colunms that requires split
ALTER TABLE Responses
ADD Preferred_Learning_Env_Type NVARCHAR(MAX),
	Aspirational_Job_Selection NVARCHAR(MAX),
	Happiness_Productivity_Factor NVARCHAR(MAX);

UPDATE Responses
SET
	Preferred_Learning_Env_Type = (
    SELECT TOP 1 value FROM STRING_SPLIT(PreferredLearningEnvType , ',')),
	Aspirational_Job_Selection = (
    SELECT TOP 1 value FROM STRING_SPLIT(AspirationalJobSelection , ',')),
	Happiness_Productivity_Factor = (
    SELECT TOP 1 value FROM STRING_SPLIT(Happiness_Productivity_Factors , ','))
	
	;

ALTER TABLE Responses
DROP COLUMN PreferredLearningEnvType,
	 COLUMN AspirationalJobSelection,
	 COLUMN Happiness_Productivity_Factors;


--Standardize data

--Aspirational_Job_Selection

UPDATE Responses
SET Aspirational_Job_Selection = 
			REPLACE(
            REPLACE(
            REPLACE(
			REPLACE(
			REPLACE(
			REPLACE(
			REPLACE(
			REPLACE(
			REPLACE(
			REPLACE(
			REPLACE(Aspirational_Job_Selection, 
                    'Business Operations in any organization', 'Business Operations'),
                    'Manage and drive End-to-End Projects or Products', 'Project Or Product Management'),
                    'Teaching in any of the institutes/colleges/online or offline', 'Teaching'),
				    'Look deeply into Data and generate insights', 'Data Analytics'),
				    'Design and Develop amazing software', 'Software Engineering'),
				    'Build and develop a Team', 'Team Management'),
				    'An Artificial Intelligence Specialist / Talking to Robots', 'AI_Specialist / Talking To Robots'),
				    'Become a content Creator in some platform', 'Content Creator'),
				    'Work in a BPO setup for some well known client', 'BPO For Reputed Client'),
				    'Design and Creative strategy in any company', 'Design And Creative Strategy'),
				    'Work as a freelancer and do my thing my way', 'Freelancer')
		
WHERE Aspirational_Job_Selection LIKE '%Business Operations in any organization%' 
   OR Aspirational_Job_Selection LIKE '%Manage and drive End-to-End Projects or Products%'
   OR Aspirational_Job_Selection LIKE '%Teaching in any of the institutes/colleges/online or offline%'
   OR Aspirational_Job_Selection LIKE '%Look deeply into Data and generate insights%'
   OR Aspirational_Job_Selection LIKE '%Design and Develop amazing software%'
   OR Aspirational_Job_Selection LIKE '%Build and develop a Team%'
   OR Aspirational_Job_Selection LIKE '%An Artificial Intelligence Specialist / Talking to Robots%'
   OR Aspirational_Job_Selection LIKE '%Become a content Creator in some platform%'
   OR Aspirational_Job_Selection LIKE '%Work in a BPO setup for some well known client%'
   OR Aspirational_Job_Selection LIKE '%Design and Creative strategy in any company%'
   OR Aspirational_Job_Selection LIKE '%Work as a freelancer and do my thing my way%';


--Preferred_Learning_Env_Type

UPDATE Responses
SET Preferred_Learning_Env_Type = 
				REPLACE(
                REPLACE(
                REPLACE(
				REPLACE(
				REPLACE(Preferred_Learning_Env_Type, 
					'Instructor or Expert Learning Programs', 'Instructor Led Or Expert'),
					'Self Paced Learning Portals', 'Self Paced Online'),
					'Learning by observing others', 'Observational'),
					'Self Paced Online of the Company', 'Company Self Paced Learning'),
					'Trial and error by doing side projects within the company', 'Trial_Error Company Side Projects')
		
WHERE Preferred_Learning_Env_Type LIKE '%Instructor or Expert Learning Programs%' 
   OR Preferred_Learning_Env_Type LIKE '%Self Paced Learning Portals%'
   OR Preferred_Learning_Env_Type LIKE '%Learning by observing others%'
   OR Preferred_Learning_Env_Type LIKE '%Self Paced Online of the Company%'
   OR Preferred_Learning_Env_Type LIKE '%Trial and error by doing side projects within the company%';

--Preferred_Work_Setup

UPDATE Responses
SET Preferred_Work_Setup = 
                REPLACE(
                REPLACE(
				REPLACE(
				REPLACE(Preferred_Work_Setup, 
					'Work with 5 to 6 people in my team', 'TeamSize_5To6'),
					'Work with 2 to 3 people in my team', 'TeamSize_2To3'),
					'Work with 7 to 10 or more people in my team', 'TeamSize_7To10Plus'),
					'Work with more than 10 people in my team', 'TeamSize_MoreThan10')
		
WHERE Preferred_Work_Setup LIKE '%Work with 5 to 6 people in my team%' 
   OR Preferred_Work_Setup LIKE '%Work with 2 to 3 people in my team%'
   OR Preferred_Work_Setup LIKE '%Work with 7 to 10 or more people in my team%'
   OR Preferred_Work_Setup LIKE '%Work with more than 10 people in my team%';

--Influencing Factors

UPDATE Responses
SET [Influencing Factors]= 
                REPLACE(
				REPLACE(
				REPLACE(
                REPLACE(
				REPLACE(
				REPLACE(
				REPLACE([Influencing Factors], 
					'People who have changed the world for better', 'World Leaders'),
					'Social Media like LinkedIn', 'Social Media'),
					'People from my circle, but not family members', 'Acquitance'),
					'My Parents', 'Parents'),
					'My Friends', 'Friends'),
					'Social Media, YouTube, Instagram', 'Social Media'),
					'Influencers who had successful careers', 'Influencers')
					
		
WHERE [Influencing Factors] LIKE '%People who have changed the world for better%' 
   OR [Influencing Factors] LIKE '%Social Media like LinkedIn%'
   OR [Influencing Factors] LIKE '%People from my circle, but not family members%'
   OR [Influencing Factors] LIKE '%My Parents%'
   OR [Influencing Factors] LIKE '%My Friends%'
   OR [Influencing Factors] LIKE '%Social Media, YouTube, Instagram%'
   OR [Influencing Factors] LIKE '%Influencers who had successful careers%';
   
--Higher Education Aspiration
UPDATE Responses
SET [Higher Education Aspiration] = 
                
                REPLACE(
				REPLACE(
				REPLACE([Higher Education Aspiration], 
					'Yes, I will earn and do that', 'Yes'),
					'No, But if someone could bare the cost I will', 'Needs Sponsorship'),
					'No I would not be pursuing Higher Education outside of India', 'No')
		
WHERE [Higher Education Aspiration] LIKE '%Yes, I will earn and do that%' 
   OR [Higher Education Aspiration] LIKE '%No, But if someone could bare the cost I will%'
   OR [Higher Education Aspiration] LIKE '%No I would not be pursuing Higher Education outside of India%';	

--LongevityLikelihood_3YrsPlus

UPDATE Responses
SET LongevityLikelihood_3YrsPlus = 
                
                REPLACE(
				REPLACE(
				REPLACE(
				REPLACE(LongevityLikelihood_3YrsPlus, 
					'This will be hard to do, but if it is the right company I would try', 'Depends on Company Culture'),
					'Will work for 3 years or more', 'Yes'),
					'No way, 3 years with one employer is crazy', 'No'),
					'No way', 'No')
		
WHERE LongevityLikelihood_3YrsPlus LIKE '%This will be hard to do, but if it is the right company I would try%' 
   OR LongevityLikelihood_3YrsPlus LIKE '%Will work for 3 years or more%'
   OR LongevityLikelihood_3YrsPlus LIKE '%No way, 3 years with one employer is crazy%'
   OR LongevityLikelihood_3YrsPlus LIKE '%No way%';

--CompanyMissionActionMislignmentTolerance

UPDATE Responses
SET CompanyMissionActionMislignmentTolerance = 
                
				REPLACE(
				REPLACE(CompanyMissionActionMislignmentTolerance, 
					'Will NOT work for them', 'No'),
					'Will work for them', 'Yes')
				
WHERE CompanyMissionActionMislignmentTolerance LIKE '%Will NOT work for them%' 
   OR CompanyMissionActionMislignmentTolerance LIKE '%Will work for them%';

--PreferredWorkEnvironment

UPDATE Responses
SET PreferredWorkEnvironment = 
                
				REPLACE(
				REPLACE(
				REPLACE(
				REPLACE(
				REPLACE(
				REPLACE(
				REPLACE(PreferredWorkEnvironment, 
					'Fully Remote with No option to visit offices', 'Fully Remote'),
					'Fully Remote with Options to travel as and when needed', 'Fully Remote Travel Option'),
					'Hybrid Working Environment with less than 15 days a month at office', 'Hybrid Less Than 15 Days Office'),
					'Hybrid Working Environment with more than 15 days a month at office', 'Hybrid More Than 15 Days Office'),
					'Every Day Office Environment', 'Daily Office'),
					'Hybrid Working Environment with less than 10 days a month at office', 'Hybrid Less Than 10 Days Office'),
					'Hybrid Working Environment with less than 3 days a month at office', 'Hybrid Less Than 3 Days Office')
				
WHERE PreferredWorkEnvironment LIKE '%Fully Remote with No option to visit offices%' 
   OR PreferredWorkEnvironment LIKE '%Fully Remote with Options to travel as and when needed%'
   OR PreferredWorkEnvironment LIKE '%Hybrid Working Environment with less than 15 days a month at office%'
   OR PreferredWorkEnvironment LIKE '%Hybrid Working Environment with more than 15 days a month at office%'
   OR PreferredWorkEnvironment LIKE '%Every Day Office Environment%'
   OR PreferredWorkEnvironment LIKE '%Hybrid Working Environment with less than 10 days a month at offic%'
   OR PreferredWorkEnvironment LIKE '%Hybrid Working Environment with less than 3 days a month at offic%';


--EmployerPreference

UPDATE Responses
SET EmployerPreference = REPLACE(EmployerPreference, 'Employer who rewards learning and enables that environment', 'Learning Rewards')
WHERE EmployerPreference LIKE '%Employer who rewards learning and enables that environment%';

UPDATE Responses
SET EmployerPreference = REPLACE(EmployerPreference, 'Employer who pushes your limits by enabling an learning environment, and rewards you at the end', 'High Demand Learning Rewards')
WHERE EmployerPreference LIKE '%Employer who pushes your limits by enabling an learning environment, and rewards you at the end%';

UPDATE Responses
SET EmployerPreference = REPLACE(EmployerPreference, 'Employer who appreciates learning and enables that environment', 'Learning Environment')
WHERE EmployerPreference LIKE '%Employer who appreciates learning and enables that environment%';

UPDATE Responses
SET EmployerPreference = REPLACE(EmployerPreference, 'Employer who pushes your limits and doesn''t enables learning environment and never rewards you', 'High Demand No Learning No Rewards')
WHERE EmployerPreference LIKE '%Employer who pushes your limits and doesn''t enables learning environment and never rewards you%';

UPDATE Responses
SET EmployerPreference = REPLACE(EmployerPreference, 'Employers who appreciates learning but doesn''t enables an learning environment', 'Learning No Environment')
WHERE EmployerPreference LIKE '%Employers who appreciates learning but doesn''t enables an learning environment%';

--PreferredManagerType

UPDATE Responses
SET PreferredManagerType = 
                
				REPLACE(
				REPLACE(
				REPLACE(
				REPLACE(
				REPLACE(PreferredManagerType, 
					'Manager who clearly describes what she/he needs', 'Clarity In Expectations'),
					'Manager who explains what is expected, sets a goal and helps achieve it', 'Guided Goal Achievement'),
					'Manager who sets goal and helps me achieve it', 'Supports Goal Achievement'),
					'Manager who sets targets and expects me to achieve it', 'Target Setting Expectation'),
					'Manager who sets unrealistic targets', 'Unrealistic Targets')
				
WHERE PreferredManagerType LIKE '%Manager who clearly describes what she/he needs%' 
   OR PreferredManagerType LIKE '%Manager who explains what is expected, sets a goal and helps achieve it%'
   OR PreferredManagerType LIKE '%Manager who sets goal and helps me achieve it%'
   OR PreferredManagerType LIKE '%Manager who sets targets and expects me to achieve it%'
   OR PreferredManagerType LIKE '%Manager who sets unrealistic targets%';

--Gender

UPDATE Responses
SET Gender = REPLACE(Gender, 'Transgender', 'Other')
WHERE Gender LIKE '%Transgender%';


--WillingnessToJoinPostLayoffs

UPDATE Responses
SET WillingnessToJoinPostLayoffs = 
                
				REPLACE(
				REPLACE(WillingnessToJoinPostLayoffs, 
					'I have NO other choice', 'Yes'),
					'Yes, I Understand this is gonna happen everywhere', 'Yes')
				
WHERE WillingnessToJoinPostLayoffs LIKE '%I have NO other choice%' 
   OR WillingnessToJoinPostLayoffs LIKE '%Yes, I Understand this is gonna happen everywhere%';

--LikelihoodToStay_7YrsPlus

UPDATE Responses
SET LikelihoodToStay_7YrsPlus = 
                
				REPLACE(
				REPLACE(
				REPLACE(LikelihoodToStay_7YrsPlus, 
					'No way', 'No'),
					'This will be hard to do, but if it is the right company I would try', 'Depends on company culture'),
					'Will work for 7 years or more', 'Yes')
				
WHERE LikelihoodToStay_7YrsPlus LIKE '%No way%' 
   OR LikelihoodToStay_7YrsPlus LIKE '%This will be hard to do, but if it is the right company I would try%'
   OR LikelihoodToStay_7YrsPlus LIKE '%Will work for 7 years or more%';

--Remove duplicates using CTE and ROW_NUMBER()

WITH Duplicate_CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY 
                   Timestamp,
                   Country,
                   [Zip Code / Pin Code],
                   Gender,
                   [Influencing Factors],
                   [Higher Education Aspiration],
                   [LongevityLikelihood_3YrsPlus], 
                   [CompanyMissionClarityPreference],
                   [CompanyMissionActionMislignmentTolerance],
                   [SocialImpactImportanceRating],
                   [PreferredWorkEnvironment],
                   [EmployerPreference],
                   [PreferredManagerType],
                   [WillingnessToJoinPostLayoffs],
                   [LikelihoodToStay_7YrsPlus],
                   [Email address],
                   [MinExpectedMonthlySalary_3Yrs],
                   [MinExpectedMonthlySalary_5Yrs],
                   [WillingnessToWork_NoRemotePolicy],
                   [MinStartingSalaryExpectations],
                   [Preferred_Company_Type],
                   [Tolerance_For_Abusive_Leadership],
                   [Daily_Work_Hours_Willingness],
                   [Weekly_Break_Interval_Needed],
                   [Work_Frustration_Factors],
                   [Preferred_Work_Setup],
                   [Preferred_Learning_Env_Type],
                   [Aspirational_Job_Selection],
                   [Happiness_Productivity_Factor]
           ORDER BY (SELECT NULL)) AS DupCount
    FROM Responses
)
DELETE FROM Duplicate_CTE
WHERE DupCount > 1;




