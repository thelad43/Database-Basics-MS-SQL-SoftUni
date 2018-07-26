CREATE VIEW V_DepartmentsToIncreaseSalary AS
     SELECT DepartmentID FROM Departments
	  WHERE Name IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services')
		 GO

UPDATE Employees
   SET Salary *= 1.12
 WHERE DepartmentID IN (SELECT * FROM V_DepartmentsToIncreaseSalary)

SELECT Salary FROM Employees