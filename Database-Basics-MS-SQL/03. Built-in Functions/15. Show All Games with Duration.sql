  Select G.Name AS Game, CASE
    WHEN DATEPART(HOUR, G.Start) Between 0 and 11 Then 'Morning'
    WHEN DATEPART(HOUR, G.Start) Between 12 and 17 Then 'Afternoon'
    WHEN DATEPART(HOUR, G.Start) Between 18 and 23 Then 'Evening'
     END AS [Part of the Day], CASE
    WHEN G.Duration <= 3 THEN 'Extra Short'
    WHEN G.Duration Between 4 AND 6 THEN 'Short'
    WHEN G.Duration > 6 THEN 'Long'
    ELSE 'Extra Long'
  END AS [Duration]
    FROM Games AS G
ORDER BY G.Name, Duration, [Part of the Day]