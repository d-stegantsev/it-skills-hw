CREATE TABLE cur_exchange (r030 NUMBER,
                           txt VARCHAR2(100),
                           rate NUMBER,
                           cur VARCHAR2(100),
                           exchangedate DATE );
                           
                           
SELECT *
FROM cur_exchange

DECLARE
    v_list_curr VARCHAR2(200) := 'USD,EUR,KZT,AMD,GBP,ILS,';
BEGIN

    FOR cc IN (SELECT REGEXP_SUBSTR(v_list_curr, '[^,]+', 1, LEVEL) AS cur_value
               FROM dual
               CONNECT BY LEVEL <= REGEXP_COUNT(v_list_curr, ','))LOOP
               
        INSERT INTO cur_exchange (r030, txt, rate, cur, exchangedate)   
        SELECT tt.r030, 
               tt.txt, 
               tt.rate, 
               tt.cur, 
               TO_DATE(tt.exchangedate, 'dd.mm.yyyy') AS exchangedate
        FROM (SELECT get_needed_curr(cc.cur_value) AS res FROM dual)
        CROSS JOIN json_table
        (
            res,'$[*]'
             COLUMNS 
            (
             r030         NUMBER        PATH '$.r030',
             txt          VARCHAR2(100) PATH '$.txt',
             rate         NUMBER        PATH '$.rate',
             cur          VARCHAR2(100) PATH '$.cc',
             exchangedate VARCHAR2(100) PATH '$.exchangedate'  
            ) 
        ) tt;
                
    END LOOP;
END;
/
