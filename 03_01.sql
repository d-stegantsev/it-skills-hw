CREATE PROCEDURE get_date_ukraine IS

BEGIN

    dbms_output.put_line('� ����� �����: '|| to_char(SYSDATE,'DD.MM.YYYY HH24:MI:SS'));
    
END get_date_ukraine;
/

SELECT '�� ������� ������ 䳺 ������� ����: '|| to_char(SYSTIMESTAMP,'tzr')
FROM DUAL;