SELECT
  job_title_short AS role,
  COUNT(*) AS job_count
FROM
  jobs
WHERE
  job_country = 'Finland'
GROUP BY
  job_title_short
ORDER BY
  job_count DESC;
