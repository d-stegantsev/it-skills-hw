-- Створення VIEW
CREATE VIEW rep_project_dep_v AS 
SELECT dp.department_name dep_name, count(em.employee_id) emp_total, count(distinct dp.manager_id) manager_count, sum(em.salary) total_salary
FROM departments dp
JOIN employees em ON dp.department_id = em.department_id
WHERE dp.department_id IN (SELECT ext_fl.department_id
                           FROM EXTERNAL (( project_id NUMBER,
                                            project_name VARCHAR2(300),
                                            department_id NUMBER)
                                TYPE oracle_loader DEFAULT DIRECTORY FILES_FROM_SERVER
                                ACCESS PARAMETERS (records delimited BY newline
                                                   nologfile
                                                   nobadfile
                                                   fields terminated BY ','
                                                   missing field VALUES are NULL)
                            LOCATION('PROJECTS.csv')
                            REJECT LIMIT UNLIMITED) ext_fl)
GROUP BY dp.department_name;


-- Завантаження звіту на сервер               
DECLARE
    file_handle UTL_FILE.FILE_TYPE;
    file_location VARCHAR2(200) := 'FILES_FROM_SERVER';
    file_name VARCHAR2(200) := 'TOTAL_PROJ_INDEX_sdu.csv';
    file_content VARCHAR2(4000);
    
BEGIN

    FOR cc IN (SELECT dep_name ||','|| emp_total ||','|| manager_count ||','|| total_salary AS file_content
               FROM rep_project_dep_v) LOOP
            file_content := file_content || cc.file_content || CHR(10);
    END LOOP;
    
    file_handle := utl_file.fopen(file_location,file_name,'W');
    
    utl_file.put_raw(file_handle, utl_raw.cast_to_raw(file_content));
    
    utl_file.fclose(file_handle);

EXCEPTION
    WHEN OTHERS THEN
        RAISE;

END;
/
