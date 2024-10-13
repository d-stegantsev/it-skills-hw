CREATE FUNCTION get_job_title(p_employee_id IN NUMBER) RETURN VARCHAR2 IS
    v_job_title dmitro_h93.jobs.job_title%TYPE;

BEGIN

    SELECT j.job_title
    INTO v_job_title
    FROM dmitro_h93.employees em
    JOIN dmitro_h93.jobs j
    ON em.job_id = j.job_id
    WHERE em.employee_id = p_employee_id;

    RETURN v_job_title;

END get_job_title;
/


SELECT *
FROM dmitro_h93.jobs;


SELECT em.*, get_job_title(em.employee_id) AS job_title
FROM dmitro_h93.employees em


SELECT j.job_title
INTO v_job_title
FROM dmitro_h93.employees em
JOIN dmitro_h93.jobs j
ON em.job_id = j.job_id
WHERE em.employee_id = p_employee_id