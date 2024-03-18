SELECT
  name AS skill,
  type,
  COUNT(*) AS job_count
FROM
  jobs AS j
INNER JOIN
  job_skills AS js ON j.id = js.job_id
INNER JOIN
  skills AS s ON js.skill_id = s.id
WHERE
  job_country = 'Finland' AND
  job_title_short in ('Data Analyst', 'Data Engineer')
GROUP BY
  type, name
ORDER BY
  job_count DESC
LIMIT
  10;
