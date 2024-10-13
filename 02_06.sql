BEGIN
    
    FOR rr IN 1..10 LOOP
        IF rr = 5 THEN
            EXIT;
        END IF;
        dbms_output.put_line(rr);
    END LOOP;
    
    dbms_output.put_line('Наступний код');
    
END;
/