# Return each year's gold medalists in the Men's 69KG weightlifting competition.
SELECT
  -- Return each year's champions' countries
  year,
  Country AS champion
FROM Summer_Medals
WHERE
  Discipline = 'Weightlifting' AND
  Event = '69KG' AND
  Gender = 'Men' AND
  Medal = 'Gold';
  
  
# Having wrapped the previous query in the Weightlifting_Gold CTE, get the previous year's champion for each year.
WITH Weightlifting_Gold AS (
  SELECT
    -- Return each year's champions' countries
    Year,
    Country AS champion
  FROM Summer_Medals
  WHERE
    Discipline = 'Weightlifting' AND
    Event = '69KG' AND
    Gender = 'Men' AND
    Medal = 'Gold')

SELECT
  Year, Champion,
  -- Fetch the previous year's champion
  LAG(Champion) OVER
    (ORDER BY YEAR ASC) AS Last_Champion
FROM Weightlifting_Gold
ORDER BY Year ASC;
