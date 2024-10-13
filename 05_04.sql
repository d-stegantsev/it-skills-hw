CREATE PROCEDURE write_file_to_disk IS
    file_handle UTL_FILE.FILE_TYPE;
    file_location VARCHAR2(200) := 'FILES_FROM_SERVER'; -- Назва створеної директорії
    file_name VARCHAR2(200) := 'file_sdu.csv'; -- Ім'я файлу, який буде записаний
    file_content VARCHAR2(4000); -- Вміст файл
    
BEGIN

    FOR cc IN (SELECT job_id ||','|| job_title ||','|| min_salary ||','|| max_salary AS file_content
               FROM jobs) LOOP
            file_content := file_content || cc.file_content || CHR(10);
    END LOOP;
    
    file_handle := utl_file.fopen(file_location,file_name,'W');
    
    utl_file.put_raw(file_handle, utl_raw.cast_to_raw(file_content));
    
    utl_file.fclose(file_handle);

EXCEPTION
    WHEN OTHERS THEN
        RAISE;

END write_file_to_disk;
/




SELECT job_id ||','|| job_title ||','|| min_salary ||','|| max_salary AS file_content
FROM jobs;



BEGIN
    write_file_to_disk;
END;
/