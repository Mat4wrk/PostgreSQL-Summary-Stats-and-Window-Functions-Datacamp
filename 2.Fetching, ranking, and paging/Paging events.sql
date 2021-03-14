# Split the distinct events into exactly 111 groups, ordered by event in alphabetical order.
WITH Events AS (
  SELECT DISTINCT Event
  FROM Summer_Medals)
  
SELECT
  --- Split up the distinct events into 111 unique groups
  Event,
  NTILE(111) OVER(ORDER BY events ASC) AS Page
FROM Events
ORDER BY Event ASC;
