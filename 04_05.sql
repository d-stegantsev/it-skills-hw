DECLARE
    v_job_title VARCHAR2(500);
    v_salary NUMBER := 1000;
    err_salary EXCEPTION;
BEGIN

    BEGIN
    
        IF v_salary < 2000 THEN
            raise err_salary;
        END IF;
    
        SELECT LISTAGG(j.job_title, ', ') WITHIN GROUP (ORDER BY 1)
        INTO v_job_title
        FROM dmitro_h93.jobs j
        WHERE j.min_salary = v_salary;      
    EXCEPTION   
        WHEN err_salary THEN
            raise_application_error(-20002, 'ЗП менше 2000-х тисяч');
        WHEN too_many_rows THEN 
            --dbms_output.put_line ('Вибірка повернула більше одного рядка');
            raise_application_error(-20001, 'Вибірка повернула більше одного рядка');
    END;
    
    dbms_output.put_line (v_job_title);
    
END;
/



SELECT LISTAGG(j.job_title, ', ') WITHIN GROUP (ORDER BY j.job_title)
FROM dmitro_h93.jobs j
WHERE j.min_salary = 4000;