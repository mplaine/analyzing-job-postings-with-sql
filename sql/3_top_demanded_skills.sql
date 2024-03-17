/*
Query 3

Question: What are the most in-demand skills for Data Analysts?
- Join job postings to inner join table similar to Query 2.
- Identify the top 5 in-demand skills for a Data Analyst.
- Focus on all job postings.
- Why? Retrieve the top 5 skills with the highest demand in the job market, providing insights into the most valuable skills for job seekers.
*/

SELECT
  name,
  COUNT(job_skills.job_id) AS demand_count
FROM
  jobs
INNER JOIN
  job_skills ON jobs.id = job_skills.job_id
INNER JOIN
  skills ON job_skills.skill_id = skills.id
WHERE
  job_title_short = 'Data Analyst' AND
  job_work_from_home = True
GROUP BY
  name
ORDER BY
  demand_count DESC
LIMIT
  5;
