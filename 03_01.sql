CREATE PROCEDURE get_date_ukraine IS

BEGIN

    dbms_output.put_line('В Україні зараз: '|| to_char(SYSDATE,'DD.MM.YYYY HH24:MI:SS'));
    
END get_date_ukraine;
/

SELECT 'На території України діє часовий пояс: '|| to_char(SYSTIMESTAMP,'tzr')
FROM DUAL;