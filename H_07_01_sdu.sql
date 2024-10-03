--Оголощення функції та змінних
    TYPE rec_empcnt IS RECORD (region_name VARCHAR2(100),
                               emp_count   NUMBER);
    TYPE tab_empcnt IS TABLE OF rec_empcnt;
    
    FUNCTION get_region_cnt_emp(p_department_id IN VARCHAR2 DEFAULT NULL) RETURN tab_empcnt PIPELINED;
    
--Тіло функції
FUNCTION get_region_cnt_emp(p_department_id IN VARCHAR2 DEFAULT NULL) RETURN tab_empcnt PIPELINED IS
                         
    out_rec tab_empcnt := tab_empcnt();
    l_ctn   SYS_REFCURSOR;
                         
BEGIN

    OPEN l_ctn FOR
    
        SELECT reg.region_name, count (em.employee_id) AS emp_count
            FROM hr.regions reg
                LEFT JOIN hr.countries con ON reg.region_id = con.region_id
                LEFT JOIN hr.locations loc ON con.country_id = loc.country_id
                LEFT JOIN hr.departments dep ON loc.location_id = dep.location_id
                LEFT JOIN hr.employees em ON dep.department_id = em.department_id
            WHERE (em.department_id = p_department_id or p_department_id is null)
            GROUP BY reg.region_name;

        BEGIN
        
            LOOP
                EXIT WHEN l_ctn%NOTFOUND;
                FETCH l_ctn BULK COLLECT
                    INTO out_rec;
                    FOR i IN 1..out_rec.count LOOP
                        PIPE ROW(out_rec(i));
                    END LOOP;
            END LOOP;
            CLOSE l_ctn;
        
        EXCEPTION 
            WHEN OTHERS THEN
                IF (l_ctn%ISOPEN) THEN
                    CLOSE l_ctn;
                    RAISE;
                ELSE
                    RAISE;
                END IF;
            
        END;

END get_region_cnt_emp;

--Виклик функції
SELECT*
FROM TABLE (util.get_region_cnt_emp())

