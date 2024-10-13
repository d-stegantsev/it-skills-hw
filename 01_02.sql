DECLARE
     v_num NUMBER :=10;
     v_name VARCHAR2(50) := 'Dima';
BEGIN

    DBMS_OUTPUT.PUT_LINE(v_num);
    DBMS_OUTPUT.PUT_LINE(v_name);

END;
/


DECLARE
     v_name VARCHAR2(50);
BEGIN

    DBMS_OUTPUT.PUT_LINE(v_name);
    v_name := 'Dima';
    DBMS_OUTPUT.PUT_LINE(v_name);

END;
/

