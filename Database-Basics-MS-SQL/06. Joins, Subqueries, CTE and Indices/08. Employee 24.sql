    SELECT e.EmployeeID, e.FirstName,
    	CASE 
      WHEN P.StartDate > '01/01/2005' THEN NULL
      ELSE P.NAME
    	END 
      FROM Employees AS e
INNER JOIN EmployeesProjects AS ep
        ON ep.EmployeeID = e.EmployeeID
INNER JOIN Projects AS p
        ON ep.ProjectID = p.ProjectID
     WHERE e.EmployeeID = 24