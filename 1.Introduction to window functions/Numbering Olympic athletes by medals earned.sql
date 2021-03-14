# For each athlete, count the number of medals he or she has earned.
SELECT
  -- Count the number of medals each athlete has earned
  Athlete, 
  COUNT(*) AS Medals
FROM Summer_Medals
GROUP BY Athlete
ORDER BY Medals DESC;


# Having wrapped the previous query in the Athlete_Medals CTE, rank each athlete by the number of medals they've earned.
WITH Athlete_Medals AS (
  SELECT
    -- Count the number of medals each athlete has earned
    Athlete,
    COUNT(*) AS Medals
  FROM Summer_Medals
  GROUP BY Athlete)

SELECT
  -- Number each athlete by how many medals they've earned
  Athlete,
  ROW_NUMBER() OVER (ORDER BY medals DESC) AS Row_N
FROM Athlete_Medals
ORDER BY Medals DESC;
