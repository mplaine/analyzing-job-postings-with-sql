SELECT
  name AS company,
  COUNT(*) AS job_count
FROM
  companies AS c
LEFT JOIN
  jobs AS j ON c.id = j.company_id
WHERE
  job_country = 'Finland'
GROUP BY
  name
ORDER BY
  job_count DESC, name
LIMIT
  25;
