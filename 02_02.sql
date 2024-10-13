DECLARE
    v_employee_id       hr.employees.employee_id%TYPE := 107;
    v_department_name   hr.departments.department_name%TYPE;
    v_name_emp          VARCHAR2(50);
BEGIN

    SELECT em.first_name || ' ' || em.last_name AS name, d.department_name
    INTO v_name_emp, v_department_name
    FROM hr.employees em
    JOIN hr.departments d
    ON em.department_id = d.department_id
    WHERE em.employee_id = v_employee_id;
    
    IF v_department_name = 'IT' THEN
        dbms_output.put_line('Співробітник '||v_name_emp||' з департаменту ІТ');
    ELSE
        dbms_output.put_line('Співробітник '||v_name_emp||' не з департаменту ІТ');
    END IF;
    
END;
/





SELECT em.first_name || ' ' || em.last_name AS name, d.department_name
FROM hr.employees em
JOIN hr.departments d
ON em.department_id = d.department_id
WHERE em.employee_id = 107;

