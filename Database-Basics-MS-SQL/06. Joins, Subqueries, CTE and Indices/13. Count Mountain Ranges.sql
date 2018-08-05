    SELECT mc.CountryCode, COUNT(mc.CountryCode)
      FROM mountainsCountries AS mc
INNER JOIN mountains AS m ON m.ID = mc.mountainId
     WHERE mc.CountryCode IN ('US','BG','RU')
  GROUP BY mc.CountryCode