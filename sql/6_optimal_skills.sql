SELECT
  name AS skill,
  type,
  COUNT(*) AS job_count,
  ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM
  jobs AS j
INNER JOIN
  job_skills AS js ON j.id = js.job_id
INNER JOIN
  skills AS s ON js.skill_id = s.id
WHERE
  -- job_country = 'Finland' AND
  job_title_short in ('Data Analyst', 'Data Engineer') AND
  salary_year_avg IS NOT NULL
GROUP BY
  s.id
HAVING
  COUNT(*) > 500
ORDER BY
  average_salary DESC, job_count DESC
LIMIT
  10;
