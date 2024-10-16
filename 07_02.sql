--SET DEFINE OFF; -- ���� ��� ���������

SELECT tt.r030, 
       tt.txt, 
       tt.rate, 
       tt.cur, 
       TO_DATE(tt.exchangedate, 'dd.mm.yyyy') AS exchangedate
FROM (SELECT SYS.GET_NBU(p_url => 'https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?date=20230501&json') AS res FROM dual)
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


CREATE VIEW usd_curr_v AS
SELECT tt.r030, 
       tt.txt, 
       tt.rate, 
       tt.cur, 
       TO_DATE(tt.exchangedate, 'dd.mm.yyyy') AS exchangedate
FROM (SELECT get_needed_curr(p_valcode => 'USD',p_date => SYSDATE) AS json_value FROM dual)
CROSS JOIN json_table
(
    json_value,'$[*]'
     COLUMNS
    (
     r030         NUMBER        PATH '$.r030',
     txt          VARCHAR2(100) PATH '$.txt',
     rate         NUMBER        PATH '$.rate',
     cur          VARCHAR2(100) PATH '$.cc',
     exchangedate VARCHAR2(100) PATH '$.exchangedate'
    )
) tt;

SELECT *
FROM usd_curr_v;