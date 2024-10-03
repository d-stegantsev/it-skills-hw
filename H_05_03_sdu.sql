--INSERT робітника
INSERT INTO dmitro_h93.employees (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES (207, 'Dmirty', 'Stegantsev', 'stegan296', SYSDATE, 'IT_PROG');

--Створення HTML таблиці
SELECT 
    '<!DOCTYPE html>
    <html>
        <head>
            <title></title>
            <style>
                table, th, td {border: 1px solid;}
                .center{text-align: center;}
            </style>
        </head>
        <body>
            <table border=1 cellspacing=0 cellpadding=2 rules=GROUPS frame=HSIDES>
                <thead>
                    <tr align=left>
                        <th>dep_id</th>
                        <th>emp_count</th>
                    </tr>
                </thead>
                    <tbody>
                    ' || list_html || '
                    </tbody>
                </table>
        </body>
    </html>' AS html_table
FROM (SELECT LISTAGG('<tr align=left>
                <td>' || dep_id || '</td>' || '
                <td class=''center''> ' || emp_count || '</td>
             </tr>','<tr>') 
    WITHIN GROUP(ORDER BY emp_count) AS list_html
FROM (SELECT em.department_id dep_id, count (em.employee_id) emp_count
      FROM employees em
      GROUP BY em.department_id));
      
--Відправка листа на пошту      
DECLARE
    v_recipient VARCHAR2(50);
    v_subject VARCHAR2(50) := 'Report';
    v_mes VARCHAR2(5000);
BEGIN

    SELECT em.email||'@gmail.com'
    INTO v_recipient
    FROM dmitro_h93.employees em
    WHERE em.employee_id = 207;

    SELECT 
        v_mes||'<!DOCTYPE html>
        <html>
            <head>
                <title></title>
                <style>
                    table, th, td {border: 1px solid;}
                    .center{text-align: center;}
                </style>
            </head>
            <body>
                <table border=1 cellspacing=0 cellpadding=2 rules=GROUPS frame=HSIDES>
                    <thead>
                        <tr align=left>
                            <th>dep_id</th>
                            <th>emp_count</th>
                        </tr>
                    </thead>
                        <tbody>
                        ' || list_html || '
                        </tbody>
                    </table>
            </body>
        </html>' AS html_table
    INTO v_mes
    FROM (SELECT LISTAGG('<tr align=left>
                    <td>' || dep_id || '</td>' || '
                    <td class=''center''> ' || emp_count || '</td>
                 </tr>','<tr>') 
        WITHIN GROUP(ORDER BY emp_count) AS list_html
    FROM (SELECT em.department_id dep_id, count (em.employee_id) emp_count
          FROM employees em
          WHERE em.department_id IS NOT NULL
          GROUP BY em.department_id));
    
    sys.sendmail(p_recipient => v_recipient,
        p_subject => v_subject,
        p_message => v_mes || ' ');
END;
/
