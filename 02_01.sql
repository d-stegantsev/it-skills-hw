DECLARE
    v_salary NUMBER;
    v_employee_id NUMBER := 135;
    v_first_name VARCHAR2(30);
BEGIN

    SELECT em.salary, em.first_name
    INTO v_salary, v_first_name
    FROM hr.employees em
    WHERE em.employee_id = v_employee_id; 
    
    dbms_output.put_line(v_salary || ' ' || v_first_name);

END;
/


SELECT em.salary
FROM hr.employees em
WHERE em.employee_id = 101; 

