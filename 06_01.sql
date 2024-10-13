--SET DEFINE OFF; -- один раз запустити


SELECT SYS.GET_NBU(p_url => 'https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?valcode=USD&date=20230513&json') AS res
FROM dual;



CREATE FUNCTION get_needed_curr(p_valcode IN VARCHAR2,
                                p_date IN DATE DEFAULT SYSDATE) RETURN VARCHAR2 IS
                                
    v_json VARCHAR2(500);
    v_date VARCHAR2(15) := TO_CHAR(p_date,'YYYYMMDD');
    
BEGIN

    SELECT sys.get_nbu(p_url => 'https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?valcode='||p_valcode||'&date='||v_date||'&json') AS res
    INTO v_json
    FROM dual;
    
RETURN v_json;

END get_needed_curr;
/


SELECT get_needed_curr('USD', SYSDATE-10)
FROM dual;

