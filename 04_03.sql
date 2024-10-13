DECLARE
    v_job_title dmitro_h93.jobs.job_title%TYPE;
    v_min_salary NUMBER := 4000;
BEGIN

    BEGIN
        SELECT j.job_title
        INTO v_job_title
        FROM dmitro_h93.jobs j
        WHERE j.min_salary = v_min_salary;      
    EXCEPTION 
        WHEN no_data_found THEN 
            dbms_output.put_line ('Даних не знайдено по min_salary = '||v_min_salary);    
        WHEN too_many_rows THEN 
            dbms_output.put_line ('Вибірка повернула більше одного рядка'); 
        WHEN value_error THEN 
            dbms_output.put_line ('Невірний тип даних'); 
        WHEN OTHERS THEN 
            dbms_output.put_line ('Невідома помилка. '||SQLERRM); 
    END;
    
    dbms_output.put_line (v_job_title);
    
END;
/



SELECT * 
FROM dmitro_h93.jobs j
WHERE j.min_salary = 4000;