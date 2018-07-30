  SELECT TOP (2) w.DepositGroup
        FROM WizzardDeposits AS w
    GROUP BY w.DepositGroup
      HAVING AVG(w.MagicWandSize) <=
	(
		SELECT TOP (1) AVG(MagicWandSize) AS 'AverageWandSize'
		      FROM WizzardDeposits
		  GROUP BY DepositGroup
		  ORDER BY AverageWandSize
	)