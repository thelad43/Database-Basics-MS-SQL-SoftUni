SELECT w.AgeGroup, COUNT(*) AS 'WizardCount' 
FROM (
		SELECT 'AgeGroup' = CASE
		WHEN d.Age BETWEEN 0 AND 10 THEN '[0-10]'
		WHEN d.Age BETWEEN 11 AND 20 THEN '[11-20]'
		WHEN d.Age BETWEEN 21 AND 30 THEN '[21-30]'
		WHEN d.Age BETWEEN 31 AND 40 THEN '[31-40]'
		WHEN d.Age BETWEEN 41 AND 50 THEN '[41-50]'
		WHEN d.Age BETWEEN 51 AND 60 THEN '[51-60]'
		WHEN d.Age >= 61 THEN '[61+]'
		END
		FROM WizzardDeposits AS d
	) AS w
GROUP BY w.AgeGroup