BEGIN
    util.update_balance(p_employee_id => 101,
                        p_balance     => 50000);
END;
/


SELECT * FROM balance
WHERE employee_id = 101
;
SELECT *
FROM logs
ORDER BY id;