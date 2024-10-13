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
            dbms_output.put_line ('����� �� �������� �� min_salary = '||v_min_salary);    
        WHEN too_many_rows THEN 
            dbms_output.put_line ('������ ��������� ����� ������ �����'); 
        WHEN value_error THEN 
            dbms_output.put_line ('������� ��� �����'); 
        WHEN OTHERS THEN 
            dbms_output.put_line ('������� �������. '||SQLERRM); 
    END;
    
    dbms_output.put_line (v_job_title);
    
END;
/



SELECT * 
FROM dmitro_h93.jobs j
WHERE j.min_salary = 4000;