    SELECT Peaks.PeakName, Rivers.RiverName, LOWER(LEFT(Peaks.PeakName, LEN(Peaks.PeakName) - 1)) + LOWER(Rivers.RiverName) AS Mix
      FROM Peaks
INNER JOIN Rivers ON LEFT(RiverName, 1) = RIGHT(PeakName, 1)
  ORDER BY Mix