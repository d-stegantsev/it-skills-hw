CREATE FUNCTION get_day RETURN VARCHAR2 IS
    v_day VARCHAR2(30);

BEGIN

    SELECT to_char(SYSDATE, 'day')
    INTO v_day
    FROM dual;
    
    RETURN v_day;

END get_day;
/


SELECT get_day
FROM dual;