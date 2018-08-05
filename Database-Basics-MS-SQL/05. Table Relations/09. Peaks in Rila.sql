USE Geography

  SELECT r.MountainRange, p.PeakName, p.Elevation
    FROM Mountains AS r
    JOIN Peaks AS p ON r.Id = p.MountainId
   WHERE r.MountainRange = 'Rila'
ORDER BY p.Elevation DESC