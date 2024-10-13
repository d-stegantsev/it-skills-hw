BEGIN

    EXECUTE IMMEDIATE '
        CREATE TABLE test1 (id NUMBER,
                            val VARCHAR2(50)) ';
    EXECUTE IMMEDIATE 'CREATE TABLE test2 (id NUMBER, val VARCHAR2(50))';

END;
/


SELECT *
FROM ALL_TABLES t
WHERE t.owner = 'DMITRO_H93'
AND t.table_name like 'TEST%';