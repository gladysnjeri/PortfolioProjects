--count the number of records in the data

SELECT COUNT(*) as total_records
FROM PortfolioProject..students

--inspect the data

SELECT TOP 5 * 
FROM PortfolioProject..students

--count number of international and domestic students

SELECT inter_dom, COUNT(inter_dom) as count_inter_dom
FROM PortfolioProject..students
GROUP BY inter_dom

--what region international students are from

SELECT Region, COUNT (inter_dom) as count_inter_dom
FROM PortfolioProject..students
WHERE inter_dom = 'Inter'
GROUP BY Region

--find the summary statistics of the diagnostic tests for all students

SELECT MIN(ToDep) as min_phq, MAX(ToDep) as max_phq, ROUND(AVG(ToDep), 2) as avg_phq,
	   MIN(ToSC) as min_scs, MAX(ToSC) as max_scs, ROUND(AVG(ToSC), 2) as avg_scs,
	   MIN(ToAS) as min_as, MAX(ToAS) as max_as, ROUND(AVG(ToAS), 2) as avg_as
FROM PortfolioProject..students

--summary statistics for each student group(patient health, social connectedness, acculturative stress)

SELECT inter_dom,
       MIN(ToDep) as min_phq, MAX(ToDep) as max_phq, ROUND(AVG(ToDep), 2) as avg_phq,
	   MIN(ToSC) as min_scs, MAX(ToSC) as max_scs, ROUND(AVG(ToSC), 2) as avg_scs,
	   MIN(ToAS) as min_as, MAX(ToAS) as max_as, ROUND(AVG(ToAS), 2) as avg_as
FROM PortfolioProject..students
--WHERE inter_dom IS NOT NULL
WHERE inter_dom IN ('Inter', 'Dom')
GROUP BY inter_dom

--average scores based on age group and length of stay of international students, to see if and how they impact the scores
--age group
SELECT Age,
       ROUND(AVG(ToDep), 2) as avg_phq,
	   ROUND(AVG(ToSC), 2) as avg_scs,
	   ROUND(AVG(ToAS), 2) as avg_as
FROM PortfolioProject..students
WHERE inter_dom = 'Inter'
GROUP BY Age
ORDER BY Age

--length of stay	

SELECT Stay,
       ROUND(AVG(ToDep), 2) as avg_phq,
	   ROUND(AVG(ToSC), 2) as avg_scs,
	   ROUND(AVG(ToAS), 2) as avg_as
FROM PortfolioProject..students
WHERE inter_dom = 'Inter'
GROUP BY Stay
ORDER BY Stay






