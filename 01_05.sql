DECLARE
    v_num1 NUMBER := 10;
    v_num2 NUMBER := 2;
    v_action VARCHAR2(1) := '/';
BEGIN
    
    IF v_action = '+' THEN
        dbms_output.put_line(v_num1 + v_num2);
    ELSIF v_action = '-' THEN
        dbms_output.put_line(v_num1 - v_num2);
    ELSIF v_action = '/' THEN
        dbms_output.put_line(v_num1 / v_num2);
    ELSIF v_action = '*' THEN
        dbms_output.put_line(v_num1 * v_num2);
    ELSE
        dbms_output.put_line('Error');
    END IF;

END;
/