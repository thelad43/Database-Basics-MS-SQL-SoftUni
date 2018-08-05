SELECT TOP (50) e.EmployeeID, e.FirstName + ' ' + e.LastName AS EmployeeName, m.FirstName + ' ' + m.LastName AS ManagerName, d.Name
      FROM Employees AS e
INNER JOIN Employees AS m
        ON e.ManagerID = m.EmployeeID
INNER JOIN Departments AS d
		ON d.DepartmentID = e.DepartmentID
  ORDER BY e.EmployeeID