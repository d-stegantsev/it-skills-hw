DECLARE 

    v_row_emp NUMBER :=1;
    v_cnt_emp NUMBER :=10;
    v_cof_up NUMBER(2,1) := 1.2; --20%
    v_dep_id NUMBER := 80;
    v_emp_id NUMBER;

BEGIN
    
    WHILE v_row_emp <= v_cnt_emp LOOP
        
        WITH cte_tt AS (SELECT tt.*, rownum as row_num
                         FROM
                             (SELECT *
                             FROM dmitro_h93.employees em
                             WHERE em.department_id = 80
                             ORDER BY em.hire_date) tt)
        SELECT cte_tt.employee_id
        INTO v_emp_id
        FROM cte_tt
        WHERE cte_tt.row_num = v_row_emp;

        UPDATE dmitro_h93.employees
        SET salary = salary * v_cof_up
        WHERE employee_id = v_emp_id;
        
        v_row_emp := v_row_emp + 1;
    
    END LOOP;

END;
/



SELECT tt.*, rownum as row_num
FROM
 (SELECT *
 FROM dmitro_h93.employees em
 WHERE em.department_id = 80
 ORDER BY em.hire_date) tt
 
 
WITH cte_tt AS (SELECT tt.*, rownum as row_num
                 FROM
                     (SELECT *
                     FROM dmitro_h93.employees em
                     WHERE em.department_id = 80
                     ORDER BY em.hire_date) tt)
SELECT *
FROM cte_tt
WHERE cte_tt.row_num = 2

UPDATE dmitro_h93.employees
SET salary = salary * 1.2
WHERE employee_id = 157;