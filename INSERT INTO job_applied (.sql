INSERT INTO job_applied (
    job_id, 
    application_sent_date, 
    custom_resume, 
    resume_file_name, 
    cover_letter_sent, 
    cover_letter_file_name, 
    status
)
VALUES
    (1, '2024-02-01', true, 'resume_01.pdf', true, 'cover_letter_01.pdf', 'submitted'),
    (2, '2024-02-02', false, 'resume_02.pdf', false, NULL, 'interview scheduled'),
    (3, '2024-02-03', true, 'resume_03.pdf', true, 'cover_letter_03.pdf', 'ghosted'),
    (4, '2024-02-04', true, 'resume_04.pdf', false, NULL, 'submitted'),
    (5, '2024-02-05', false, 'resume_05.pdf', true, 'cover_letter_05.pdf', 'rejected');

SELECT * FROM job_applied;

SELECT job_id, COUNT(*)
FROM job_applied
GROUP BY job_id
HAVING COUNT(*) > 1;

WITH duplicates AS (
    SELECT ctid, ROW_NUMBER() OVER (PARTITION BY job_id ORDER BY ctid) AS rnum
    FROM job_applied
)
DELETE FROM job_applied
WHERE ctid IN (SELECT ctid FROM duplicates WHERE rnum > 1);

SELECT * FROM job_applied;

UPDATE job_applied 
SET    contact = 'Erlich Bachman'
WHERE  job_id = 1;

UPDATE job_applied 
SET    contact = 'Dinesh Chugtai'
WHERE  job_id = 2;

UPDATE job_applied 
SET    contact = 'Bertram Gilfoyle'
WHERE  job_id = 3;

UPDATE job_applied 
SET    contact = 'Jian Yang'
WHERE  job_id = 4;

UPDATE job_applied 
SET    contact = 'Dinesh Josh'
WHERE  job_id = 5;

SELECT * FROM job_applied;

ALTER TABLE job_applied 
RENAME COLUMN contact TO contact_name;

SELECT * FROM job_applied

ALTER TABLE job_applied 
ALTER COLUMN contact_name TYPE TEXT;


