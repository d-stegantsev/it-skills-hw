CREATE TRIGGER delete_as_log
    BEFORE INSERT ON logs
    FOR EACH ROW
DECLARE
    PRAGMA autonomous_transaction;
BEGIN
    DELETE FROM logs l
    WHERE l.log_date < trunc(SYSDATE, 'dd') -45;
    COMMIT;
END delete_as_log;
/


BEGIN
    to_log('proc_test','text_test3');
END;
/

ALTER TRIGGER delete_as_log DISABLE;
ALTER TRIGGER delete_as_log ENABLE;


SELECT * 
FROM logs;



DELETE FROM logs l
WHERE l.log_date < trunc(SYSDATE, 'dd') -45;