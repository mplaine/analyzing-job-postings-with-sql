/*
Query 4

Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focus on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT
  name,
  ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
  jobs
INNER JOIN
  job_skills ON jobs.id = job_skills.job_id
INNER JOIN
  skills ON job_skills.skill_id = skills.id
WHERE
  job_title_short = 'Data Analyst' AND
  salary_year_avg IS NOT NULL AND
  job_work_from_home = True
GROUP BY
  name
ORDER BY
  avg_salary DESC
LIMIT
  25;
