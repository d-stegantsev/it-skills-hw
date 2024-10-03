CREATE TRIGGER hire_date_update
    BEFORE UPDATE ON employees
    FOR EACH ROW
DECLARE
    PRAGMA autonomous_transaction;
BEGIN

    IF :OLD.job_id != :NEW.job_id THEN
    
        :NEW.hire_date := TRUNC(SYSDATE,'DD');

    END IF;

    COMMIT;

END hire_date_update;
/