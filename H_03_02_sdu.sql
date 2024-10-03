CREATE FUNCTION get_dep_name(p_employee_id IN NUMBER) RETURN VARCHAR2 IS
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
/



SELECT employee_id, 
       first_name, 
       last_name, 
       email, 
       phone_number, 
       hire_date, 
       get_job_title(em.employee_id) AS job_title, 
       salary, 
       commission_pct, 
       manager_id, 
       get_dep_name(em.employee_id) AS dep_name
FROM dmitro_h93.employees em