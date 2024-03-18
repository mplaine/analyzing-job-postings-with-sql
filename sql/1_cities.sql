SELECT
  job_location AS location,
  COUNT(*) AS job_count
FROM
  jobs
WHERE
  job_country = 'Finland'
GROUP BY
  job_location
ORDER BY
  job_count DESC, location
LIMIT
  10;
