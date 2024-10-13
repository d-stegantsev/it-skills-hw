PROCEDURE update_balance(p_employee_id IN NUMBER,
                         p_balance     IN NUMBER) IS
                         
         v_balance_new balance.balance%TYPE;
         v_balance_old balance.balance%TYPE;
         v_message     logs.message%TYPE;
                         
BEGIN
    SELECT balance
    INTO v_balance_old
    FROM balance b
    WHERE b.employee_id = p_employee_id
    FOR UPDATE; -- Блокуємо рядок для оновлення
    
    IF v_balance_old >= p_balance THEN
        UPDATE balance b
        SET b.balance = v_balance_old - p_balance
        WHERE employee_id = p_employee_id
        RETURNING b.balance INTO v_balance_new; -- щоб не робити новий SELECT INTO
    ELSE
        v_message := 'Employee_id = '||p_employee_id||'. Недостатньо коштів на рахунку. Поточний баланс '||v_balance_old||', спроба зняття '||p_balance||'';
        to_log(p_appl_proc => 'util.update_balance', p_message => v_message);
        raise_application_error(-20001, v_message);
    END IF;
    
    v_message := 'Employee_id = '||p_employee_id||'. Кошти успішно зняті з рахунку. Було '||v_balance_old||', стало '||v_balance_new||'';
    dbms_output.put_line(v_message);
    to_log(p_appl_proc => 'util.update_balance', p_message => v_message);
    
    /*IF 1=0 THEN -- зімітуємо непередбачену помилку
        v_message := 'Непередбачена помилка';
        raise_application_error(-20001, v_message);
    END IF;*/
    
    COMMIT; -- зберігаємо новий баланс та знімаємо блокування в поточній транзакції
    
    EXCEPTION
        WHEN OTHERS THEN
            to_log(p_appl_proc => 'util.update_balance', p_message => NVL(v_message, 'Employee_id = '||p_employee_id||'. ' ||SQLERRM));
        ROLLBACK; -- Відміняємо транзакцію у разі виникнення помилки
            raise_application_error(-20001, NVL(v_message, 'Не відома помилка'));
            
END update_balance;
