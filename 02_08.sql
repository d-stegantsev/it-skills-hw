DECLARE 

    v_cc NUMBER :=1;

BEGIN
    
    WHILE v_cc <=5 LOOP
    dbms_output.put_line('������� '||dd);
    v_cc := v_cc + 1;
    END LOOP;

END;
/





BEGIN
    
    FOR dd IN 0..5 LOOP
        dbms_output.put_line('������� '||dd);
    END LOOP;
    
END;
/


DECLARE 

    v_salary NUMBER := 5000;
    v_step NUMBER := 500;

BEGIN
    
    WHILE v_salary <=9500 LOOP
    
        IF trim(to_char(SYSDATE-2, 'day')) IN ('�����','������') THEN
            EXIT;        
        END IF;
        
        IF v_salary IN (6500,7500) THEN
            v_salary := v_salary + v_step;
            CONTINUE;
        END IF;
    
    v_salary := v_salary + v_step;
    dbms_output.put_line('ϳ�������� �� �� '||v_step||', � ����� �� = '||v_salary);
    
    
    END LOOP;
    
    dbms_output.put_line('ϳ�������� �� �� ����');

END;
/