DECLARE
    v_salary hr.jobs.min_salary%TYPE := 9000;

BEGIN
    
    FOR rr IN (SELECT j.job_title
               FROM hr.jobs j
               WHERE v_salary BETWEEN j.min_salary AND j.max_salary) LOOP
        dbms_output.put_line(rr.job_title);
    END LOOP;
    
END;
/



SELECT j.job_title
FROM hr.jobs j
WHERE 3000 BETWEEN j.min_salary AND j.max_salary
;