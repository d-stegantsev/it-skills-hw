SELECT TRIM(REGEXP_SUBSTR(p_list_val, '[^'||p_separator||']+', 1, LEVEL)) AS cur_value
FROM dual
CONNECT BY LEVEL <= REGEXP_COUNT(p_list_val, p_separator) + 1;


SELECT TRIM(REGEXP_SUBSTR('usd,eur', '[^'||','||']+', 1, LEVEL)) AS cur_value
FROM dual
CONNECT BY LEVEL <= REGEXP_COUNT('usd,eur', ',') + 1;


SELECT value_list
FROM TABLE(util.table_from_list(p_list_val => 'USD,EUR,KZT,AMD,GBP,ILS'));