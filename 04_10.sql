DECLARE
    v_sql_condition VARCHAR2(500) := 'job_id';
    v_sql_value VARCHAR2(50) := '''ST_CLERK''';
    v_dynamic_sql VARCHAR2(500);
    v_sum NUMBER;
BEGIN

    v_dynamic_sql :='
        SELECT SUM(e.salary)
        FROM hr.employees e
        WHERE e.'||v_sql_condition||' = '||v_sql_value||'';
        
    dbms_output.put_line(v_dynamic_sql);
    
    EXECUTE IMMEDIATE v_dynamic_sql INTO v_sum;
    
    dbms_output.put_line(v_sum);

END;
/

UPDATE 
SET v_job_id ||...
1=1
where...


IF p_job_id IS NOT NULL THEN
        v_job_id := 'emp.job_id = ''' || p_job_id || ''', '
        ELSE v_job_id := ' '
    END IF;