/*
Query 1

Question: What are the top-paying Data Analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focus on job postings with specified salaries (remove nulls).
- BONUS: Include company names of top 10 roles.
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT
  jobs.id,
  job_title,
  job_location,
  job_schedule_type,
  salary_year_avg,
  job_posted_date,
  name AS company_name
FROM
  jobs
LEFT JOIN
  companies ON jobs.company_id = companies.id
WHERE
  job_title_short = 'Data Analyst' AND
  job_location = 'Anywhere' AND
  salary_year_avg IS NOT NULL
ORDER BY
  salary_year_avg DESC
LIMIT
  10;
