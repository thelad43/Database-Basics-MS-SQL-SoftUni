SELECT * INTO NewEmployees
  FROM Employees AS e
 WHERE e.Salary > 30000

DELETE FROM NewEmployees
 WHERE NewEmployees.ManagerID = 42

UPDATE NewEmployees
   SET Salary += 5000
 WHERE NewEmployees.DepartmentID = 1

  SELECT n.DepartmentID, AVG(Salary) AS AverageSalary
    FROM NewEmployees AS n
GROUP BY n.DepartmentID

DROP TABLE NewEmployees