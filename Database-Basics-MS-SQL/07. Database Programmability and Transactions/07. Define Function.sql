CREATE FUNCTION ufn_IsWordComprised (@setOfLetters NVARCHAR(50), @word NVARCHAR(50)) 
RETURNS BIT
AS
BEGIN
	DECLARE @currentIndex int = 1;
	WHILE (@currentIndex <= LEN(@word))
		BEGIN
			DECLARE @currentLetter varchar(1) = SUBSTRING(@word, @currentIndex, 1);
			IF (CHARINDEX(@currentLetter, @setOfLetters)) = 0
				BEGIN
				RETURN 0;
			END
			SET @currentIndex += 1;
		END
	RETURN 1;
END