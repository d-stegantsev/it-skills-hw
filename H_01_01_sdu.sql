DECLARE
    v_year NUMBER := 2024;
    v_check_year NUMBER;
BEGIN

    v_check_year := MOD(v_year, 4);
    
    IF v_check_year = 0 THEN
        dbms_output.put_line ('���������� ��');
    ELSE
        dbms_output.put_line('�� ���������� ��');
    END IF;

END;
/