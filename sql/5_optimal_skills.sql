/*
Query 5

Question: What are the most optimal skills to learn (a.k.a. it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles.
- Concentrate on remote positions with specified salaries.
- Why? Target skills that offer job security (high demand) and financial benefits (high salaries), offering strategic insights for career development in data analysis.
*/

WITH
  skills_demand AS (
    SELECT
      skills.id,
      skills.name,
      COUNT(job_skills.job_id) AS demand_count
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
      skills.id    
  ),
  average_salary AS (
    SELECT
      job_skills.skill_id,
      ROUND(AVG(jobs.salary_year_avg), 0) AS avg_salary
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
      job_skills.skill_id    
  )

SELECT
  skills_demand.id,
  skills_demand.name,
  demand_count,
  avg_salary
FROM
  skills_demand
INNER JOIN
  average_salary ON skills_demand.id = average_salary.skill_id
WHERE
  demand_count > 10
ORDER BY
  avg_salary DESC,
  demand_count DESC
LIMIT
  25;


-- The same query without the use of CTEs (more concise)
SELECT
  skills.id,
  skills.name,
  COUNT(job_skills.job_id) AS demand_count,
  ROUND(AVG(jobs.salary_year_avg), 0) AS avg_salary
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
  skills.id
HAVING
  COUNT(job_skills.job_id) > 10
ORDER BY
  avg_salary DESC,
  demand_count DESC
LIMIT
  25;
