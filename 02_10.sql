DECLARE 

    v_cnt_emp NUMBER :=10;
    v_cof_up NUMBER(2,1) := 1.2; --20%
    v_dep_id NUMBER := 80;

BEGIN
    
        FOR cc IN (SELECT em.employee_id
                    FROM dmitro_h93.employees em
                    WHERE em.department_id = 80
                    ORDER BY em.hire_date
                    FETCH FIRST v_cnt_emp ROWS ONLY) LOOP

        UPDATE dmitro_h93.employees
        SET salary = salary * v_cof_up
        WHERE employee_id = cc.employee_id;
        
        dbms_output.put_line(cc.employee_id);
    
    END LOOP;

END;
/





SELECT *
        FROM dmitro_h93.employees em
        WHERE em.department_id = 80
        ORDER BY em.hire_date
        FETCH FIRST 10 ROWS ONLY