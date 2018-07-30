  SELECT DepartmentID, SUM(Salary)
    FROM Employees AS e
GROUP BY e.DepartmentID