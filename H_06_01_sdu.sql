--SET DEFINE OFF; -- один раз запустити

--Створення таблиці
CREATE TABLE interbank_index_ua_history (index_date DATE,
                                         api VARCHAR2(50),
                                         index_value NUMBER,
                                         special VARCHAR2(10));
                                         

--Створення VIEW
CREATE VIEW interbank_index_ua_v AS                                  
        SELECT TO_DATE(tt.index_date, 'dd.mm.yyyy') AS index_date,
               tt.api, 
               tt.index_value, 
               tt.special
        FROM (SELECT SYS.GET_NBU(p_url => 'https://bank.gov.ua/NBU_uonia?id_api=UONIA_UnsecLoansDepo&json') AS res FROM dual)
        CROSS JOIN json_table
        (
            res,'$[*]'
             COLUMNS 
            (
             index_date         VARCHAR2(100) PATH '$.dt',
             api                VARCHAR2(100) PATH '$.id_api',
             index_value        NUMBER        PATH '$.value',
             special            VARCHAR2(100) PATH '$.special'  
            ) 
        ) tt;



--Створення процедури
CREATE PROCEDURE download_ibank_index_ua IS

BEGIN

    INSERT INTO interbank_index_ua_history (index_date, api, index_value, special)
    SELECT index_date, 
           api, 
           index_value, 
           special
    FROM interbank_index_ua_v;

    COMMIT;

END download_ibank_index_ua;
/



--Створення джобу
BEGIN
    sys.dbms_scheduler.create_job  (job_name => 'ibank_index_ua',
                                    job_type => 'PLSQL_BLOCK',
                                    job_action => 'begin download_ibank_index_ua(); end;',
                                    start_date => SYSDATE,
                                    repeat_interval => 'FREQ=DAILY;BYHOUR=09;BYMINUTE=00',
                                    end_date => TO_DATE(NULL),
                                    job_class => 'DEFAULT_JOB_CLASS',
                                    enabled => TRUE,
                                    auto_drop => FALSE,
                                    comments => 'Зберігання історії Український індекс міжбанківських ставок овернайт (UONIA)');
END;
/