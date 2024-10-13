UPDATE employees em
SET em.job_id = 'SA_REP'
WHERE em.employee_id = 150;



SELECT *
FROM job_history jh
WHERE jh.employee_id = 150
AND jh.end_date > SYSDATE;

SELECT *
FROM employees
WHERE employee_id = 150;


CREATE TRIGGER job_history_log
    AFTER UPDATE ON employees
    FOR EACH ROW
DECLARE
    PRAGMA autonomous_transaction;
BEGIN

    IF :OLD.job_id != :NEW.job_id THEN
    
        UPDATE job_history jb
        SET jb.end_date = TRUNC(SYSDATE, 'DD')
        WHERE jb.employee_id = :OLD.employee_id
        AND jb.job_id = :OLD.job_id;
        
            IF SQL%ROWCOUNT = 0 THEN
                INSERT INTO job_history(employee_id, start_date, end_date, job_id)
                VALUES (:OLD.employee_id, :OLD.hire_date, TRUNC(SYSDATE, 'DD'), :OLD.job_id);
            END IF;
    
        INSERT INTO job_history(employee_id, start_date, end_date, job_id)
        VALUES (:NEW.employee_id, TRUNC(SYSDATE, 'DD'), to_date('31.12.2999', 'DD.MM.YYYY'), :NEW.job_id);

    END IF;
    
    COMMIT;
    
END job_history_log;
/