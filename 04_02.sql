BEGIN

    BEGIN
        dbms_output.put_line (10 / 0);
    EXCEPTION 
        WHEN OTHERS THEN 
             --dbms_output.put_line ('Fatal error');
             dbms_output.put_line ('Fatal error '||SQLERRM);
         
    END;

    dbms_output.put_line (10 / 0);

END;
/