DECLARE
    v_date DATE := TO_DATE ('05.05.2024','DD.MM.YYYY');
    v_day NUMBER;
BEGIN

    v_day := TO_NUMBER(TO_CHAR(v_date,'dd'));
    
    IF v_date = (last_day(trunc(SYSDATE))) THEN
        dbms_output.put_line ('Виплата зарплати');
    ELSIF v_day = 15 THEN
        dbms_output.put_line ('Виплата авансу');
    ELSIF v_day < 15 THEN
        dbms_output.put_line ('Чекаємо на аванс');
    ELSIF v_day > 15 THEN
        dbms_output.put_line ('Чекаємо на зарплату');
    END IF;

END;
/