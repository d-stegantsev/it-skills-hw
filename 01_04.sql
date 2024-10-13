DECLARE
    v_sysdate date := SYSDATE;
BEGIN

    v_sysdate := TO_DATE('03-06-2023', 'DD-MM-YY');
    
    IF to_char(v_sysdate, 'd') IN ('6', '7') THEN
        dbms_output.put_line('Holyday');
    ELSIF to_char(v_sysdate, 'd') = '3' THEN
        dbms_output.put_line('Small Friday');
    ELSE
        dbms_output.put_line('Workdays');
    END IF;

END;
/