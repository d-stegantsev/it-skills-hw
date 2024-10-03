--Специфікація
create or replace PACKAGE util AS

    PROCEDURE del_jobs(p_job_id IN VARCHAR2,
                       po_result OUT VARCHAR2);
                       
    FUNCTION get_dep_name(p_employee_id IN NUMBER) RETURN VARCHAR2;


END util;


--Тіло
create or replace PACKAGE BODY util AS
    --Процедура del_jobs
    PROCEDURE del_jobs(p_job_id IN VARCHAR2,
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
    
    --Функція get_dep_name
    FUNCTION get_dep_name(p_employee_id IN NUMBER) RETURN VARCHAR2 IS
        v_department_name dmitro_h93.departments.department_name%TYPE;
    
    BEGIN
    
        SELECT de.department_name
        INTO v_department_name
        FROM dmitro_h93.employees em
        LEFT JOIN dmitro_h93.departments de
        ON em.department_id = de.department_id
        WHERE em.employee_id = p_employee_id;
    
        RETURN v_department_name;
    
    END get_dep_name;

END util;


BEGIN
    util.del_jobs('101');
END;
/

--Виклик процедури та функції
DECLARE
    v_result VARCHAR2(100);
BEGIN
    util.del_jobs(p_job_id  => 'IT_QA',
             po_result => v_result);
                 
    dbms_output.put_line(v_result);
    
END;
/

SELECT em.*, 
       util.get_dep_name(em.employee_id) AS job_title
FROM dmitro_h93.employees em;