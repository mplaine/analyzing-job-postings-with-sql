SELECT
  job_title_short AS role,
  COUNT(salary_year_avg) AS job_count,
  ROUND(AVG(salary_year_avg), 0) AS average_salary,
  ROUND(MIN(salary_year_avg), 0) AS min_salary,
  ROUND(MAX(salary_year_avg), 0) AS max_salary
FROM
  jobs
WHERE
  --  job_country = 'Finland' AND
  salary_year_avg IS NOT NULL
GROUP BY
  job_title_short
ORDER BY
  average_salary DESC;
