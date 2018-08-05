CREATE FUNCTION ufn_GetSalaryLevel (@salary DECIMAL(18, 4))
RETURNS VARCHAR(7) AS
BEGIN
	DECLARE @SalaryLevel VARCHAR(7)
	IF(@Salary < 30000)
	BEGIN 
		SET @SalaryLevel = 'Low'
	END
	ELSE IF(@Salary >= 30000 AND @Salary <= 50000)
	BEGIN
		SET @SalaryLevel = 'Average'
	END
	ELSE 
	BEGIN 
		SET @SalaryLevel = 'High'
END
	RETURN @SalaryLevel
END