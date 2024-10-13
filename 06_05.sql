SELECT *
FROM cur_exchange
ORDER BY change_date;

SELECT *
FROM all_scheduler_jobs sj;


CREATE OR REPLACE PROCEDURE add_test_curr IS

BEGIN

    INSERT INTO cur_exchange (r030, txt, rate, cur, exchangedate)
    SELECT ROUND(dbms_random.value(100, 1000)) AS r030,
        'Тестова валюта №'||ROUND(dbms_random.value(1, 100)) AS txt,
        ROUND(dbms_random.value(20, 50), 4) AS rate,
        dbms_random.string('X',3) AS cur,
        TRUNC(SYSDATE, 'DD') AS exchangedate
    FROM dual;
        
    COMMIT;
    
END add_test_curr;
/

BEGIN
    add_test_curr;
END;
/



BEGIN
    sys.dbms_scheduler.create_job  (job_name => 'test_update_curr',
                                    job_type => 'PLSQL_BLOCK',
                                    job_action => 'begin add_test_curr(); end;',
                                    start_date => SYSDATE,
                                    repeat_interval => 'FREQ=SECONDLY; INTERVAL=30',
                                    end_date => TO_DATE(NULL),
                                    job_class => 'DEFAULT_JOB_CLASS',
                                    enabled => TRUE,
                                    auto_drop => FALSE,
                                    comments => 'Оновлення курс валют тестовими даними');
END;
/