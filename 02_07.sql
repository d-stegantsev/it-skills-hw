BEGIN
    
    FOR rr IN (SELECT em.first_name, em.salary
               FROM hr.employees em
               ORDER BY em.first_name) LOOP
               
        IF rr.salary >= 15000 THEN
            dbms_output.put_line(rr.first_name || ' have a big salary');
            EXIT;
        ELSE
            --dbms_output.put_line('skip');
            CONTINUE;
        END IF;
        
    END LOOP;
    
    dbms_output.put_line('Наступний код');
    
END;
/



SELECT em.first_name, em.salary
FROM hr.employees em
ORDER BY em.first_name;




BEGIN
    
    FOR rr IN (SELECT 
                    ROW_NUMBER() OVER (ORDER BY em.first_name) AS row_num,
                    em.first_name, 
                    em.last_name, 
                    em.salary
               FROM 
                    hr.employees em
               ORDER BY 
                    em.first_name) LOOP
               
        IF rr.salary >= 15000 THEN
            EXIT;
        ELSE
            dbms_output.put_line('skip '|| rr.row_num);
            CONTINUE;
        END IF;
        
    END LOOP;
    
    dbms_output.put_line('Наступний код');
    
END;
/



SELECT 
    ROW_NUMBER() OVER (ORDER BY em.first_name) AS row_num,
    em.first_name, 
    em.last_name, 
    em.salary
FROM 
    hr.employees em
ORDER BY 
    em.first_name;
