SELECT tt.r030, 
       tt.txt, 
       tt.rate, 
       tt.cur, 
       TO_DATE(tt.exchangedate, 'dd.mm.yyyy') AS exchangedate
FROM (SELECT get_needed_curr('PLN') AS json_value FROM dual)
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

SELECT get_needed_curr('USD')FROM dual;
