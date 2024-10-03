CREATE PROCEDURE del_jobs(p_job_id IN VARCHAR2,
                          po_result OUT VARCHAR2) IS
                          
    v_exist_job NUMBER;
    
BEGIN

    SELECT COUNT(j.job_id)
    INTO v_exist_job
    FROM dmitro_h93.jobs j
    WHERE j.job_id = p_job_id;

    IF v_exist_job >= 1 THEN
        DELETE FROM dmitro_h93.jobs j
        WHERE j.job_id = p_job_id;
        --COMMIT;
        po_result := 'Посада '||p_job_id||' успішно видалена';
    ELSE
        po_result := 'Посада '||p_job_id||' не існує';
        
    END IF;

END del_jobs;
/

