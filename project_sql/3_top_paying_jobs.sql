/* The question is to group the skills from this data set and find what skills are listed the most (top 10)
*/

WITH remote_job_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
    WHERE
        job_postings.job_work_from_home = TRUE AND
        job_postings.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id
)

SELECT
    skills AS skill_name,
    skill_count
FROM
    remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY
    skill_count DESC
LIMIT 20

/*
Top 10 Skills List in Job Offers
Skill	        Count
SQL	            7291
Excel	        4611
Python	        4330
Tableau	        3745
Power BI	    2609
SAS 	        1866
R	            1483
PowerPoint	    1387
Word	        1352
SAP	            1129
*/