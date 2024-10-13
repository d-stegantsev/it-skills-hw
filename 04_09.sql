BEGIN

    FOR cc IN (SELECT *
               FROM ALL_TABLES t
               WHERE t.owner = 'DMITRO_H93'
               AND t.table_name like 'TEST%') LOOP
               
        --dbms_output.put_line ('DROP TABLE '||cc.table_name);
        
        EXECUTE IMMEDIATE 'DROP TABLE '||cc.table_name;
    
    END LOOP;

END;
/

DROP TABLE TEST4;

SELECT *
FROM ALL_TABLES t
WHERE t.owner = 'DMITRO_H93'
AND t.table_name like 'TEST%'