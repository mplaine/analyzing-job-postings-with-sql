/*
Query 2

Question: What skills are required for the top-paying Data Analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
  SELECT
    jobs.id,
    job_title,
    salary_year_avg,
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
    10
)

SELECT
  top_paying_jobs.*,
  name
FROM
  top_paying_jobs
INNER JOIN
  job_skills ON top_paying_jobs.id = job_skills.job_id
INNER JOIN
  skills ON job_skills.skill_id = skills.id
ORDER BY
  salary_year_avg DESC;
