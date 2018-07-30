SELECT e.FirstName, e.LastName, e.DepartmentID
  FROM Employees as e
 WHERE e.Salary > (SELECT AVG(em.Salary)
					FROM Employees AS em
					WHERE em.DepartmentID = e.DepartmentID
					)
ORDER BY e.DepartmentID
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY