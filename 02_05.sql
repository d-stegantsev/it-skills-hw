DECLARE
    v_location_id hr.departments.location_id%TYPE := 1700;

BEGIN
    
    FOR rr IN (SELECT 1
               FROM hr.departments d
               WHERE d.location_id = v_location_id) LOOP
        dbms_output.put_line('По переданому v_location_id існує департамент');
        RETURN;
    END LOOP;
    
END;
/


SELECT *
FROM hr.departments d
WHERE d.location_id = 1700;