DECLARE
    v1 VARCHAR2(2000);
    f1 utl_file.file_type;
    file_location VARCHAR2(200) := 'FILES_FROM_SERVER';
    file_name VARCHAR2(200) := 'TOTAL_PROJ_INDEX_sdu.csv';
BEGIN
    f1 := utl_file.fopen(file_location, file_name, 'R');
    
    LOOP
        BEGIN
        utl_file.get_line(f1, v1);
        dbms_output.put_line(v1);
        EXCEPTION
            WHEN no_data_found THEN
            EXIT;
        END;
    END LOOP;
    
    IF utl_file.is_open(f1) THEN
        dbms_output.put_line('File '|| file_name || ' is exist');
    END IF;
    
    utl_file.fclose(f1);
    
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('File '|| file_name || ' is NOT exist');
END;
/
