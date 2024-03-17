-- Create companies table with primary key
CREATE TABLE companies (
  id INT PRIMARY KEY,
  name TEXT,
  link TEXT,
  link_google TEXT,
  thumbnail TEXT
);

-- Create skills table with primary key
CREATE TABLE skills (
  id INT PRIMARY KEY,
  name TEXT,
  type TEXT
);

-- Create jobs table with primary key
CREATE TABLE jobs (
  id INT PRIMARY KEY,
  company_id INT,
  job_title_short VARCHAR(255),
  job_title TEXT,
  job_location TEXT,
  job_via TEXT,
  job_schedule_type TEXT,
  job_work_from_home BOOLEAN,
  search_location TEXT,
  job_posted_date TIMESTAMP,
  job_no_degree_mention BOOLEAN,
  job_health_insurance BOOLEAN,
  job_country TEXT,
  salary_rate TEXT,
  salary_year_avg NUMERIC,
  salary_hour_avg NUMERIC,
  FOREIGN KEY (company_id) REFERENCES companies (id)
);

-- Create job_skills table with a composite primary key and foreign keys
CREATE TABLE job_skills (
  job_id INT,
  skill_id INT,
  PRIMARY KEY (job_id, skill_id),
  FOREIGN KEY (job_id) REFERENCES jobs (id),
  FOREIGN KEY (skill_id) REFERENCES skills (id)
);

-- Create indexes on foreign key columns for better performance
CREATE INDEX idx_company_id ON jobs (company_id);
CREATE INDEX idx_job_id ON job_skills (job_id);
CREATE INDEX idx_skill_id ON job_skills (skill_id);

-- Import data into corresponding tables
COPY companies FROM '/docker-entrypoint-initdb.d/companies.csv' DELIMITER ',' CSV HEADER;
COPY skills FROM '/docker-entrypoint-initdb.d/skills.csv' DELIMITER ',' CSV HEADER;
COPY jobs FROM '/docker-entrypoint-initdb.d/jobs.csv' DELIMITER ',' CSV HEADER;
COPY job_skills FROM '/docker-entrypoint-initdb.d/job_skills.csv' DELIMITER ',' CSV HEADER;
