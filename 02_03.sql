BEGIN
    
    FOR dd IN 0..5 LOOP
        dbms_output.put_line('Вибачте '||dd);
    END LOOP;
    
END;
/