CREATE PROCEDURE add_new_jobs(p_job_id     IN VARCHAR2, 
                              p_job_title  IN VARCHAR2, 
                              p_min_salary IN NUMBER, 
                              p_max_salary IN NUMBER DEFAULT NULL,
                              po_err       OUT VARCHAR2) IS
                              
    v_max_salary dmitro_h93.jobs.max_salary%TYPE;

BEGIN

    IF p_max_salary IS NULL THEN
        v_max_salary := p_min_salary * 1.5;
    ELSE
        v_max_salary := p_max_salary;
    END IF;
    
    IF (p_min_salary < 2000 OR p_max_salary < 2000) THEN
        po_err := 'Передана ЗП менше 2000';
    ELSE
        INSERT INTO dmitro_h93.jobs (job_id, job_title, min_salary, max_salary)
        VALUES (p_job_id, p_job_title, p_min_salary, v_max_salary); 
        --COMMIT;
        po_err := 'Посада '||p_job_id||' успішно додана';
    END IF;

END add_new_jobs;
/


--CREATE TABLE jobs AS
SELECT job_id, job_title, min_salary, max_salary
FROM dmitro_h93.jobs