PROCEDURE del_jobs(p_job_id  IN VARCHAR2,
                   po_result OUT VARCHAR2) IS

    v_delete_no_data_found EXCEPTION;
    
BEGIN

    BEGIN
        util.check_work_time;
    END;
    
    BEGIN
        DELETE FROM dmitro_h93.jobs j
        WHERE j.job_id = p_job_id;
        --COMMIT;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE v_delete_no_data_found;
        END IF;        
    EXCEPTION
        WHEN v_delete_no_data_found THEN
            raise_application_error(-20004, 'Посада '||p_job_id||' не існує');
    END;
    
        po_result := 'Посада '||p_job_id||' успішно видалена';

END del_jobs;