SELECT t.DepartmentID, t.ThirdHighestSalary
 FROM (SELECT DISTINCT w.DepartmentID,
		(SELECT DISTINCT Salary FROM Employees WHERE DepartmentID = w.DepartmentID ORDER BY Salary DESC OFFSET 2 ROWS FETCH NEXT 1 ROW ONLY) AS ThirdHighestSalary
			FROM Employees AS w) AS t
 WHERE ThirdHighestSalary IS NOT NULL