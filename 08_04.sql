--SET SERVEROUTPUT ON;
<<some_proc>> -- мітка головного PL-SQL блоку
DECLARE
    v_productid        NUMBER := 1;
    v_is_exist_product NUMBER;
BEGIN

    <<search_product>> -- мітка внутрішнього PL-SQL блоку
    BEGIN
        SELECT 1
        INTO v_is_exist_product
        FROM products p
        WHERE p.productid = v_productid;
    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'По productid='||v_productid||', не знайдені дані в таблиці продуктів');
    END search_product;
    
    dbms_output.put_line('По productid='||v_productid||' інснує дані в таблиці продуктів');
    
    dbms_output.put_line('Виконуємо цей кусок коду');

END some_proc;
/


<<some_proc>> -- мітка головного PL-SQL блоку
DECLARE
    v_productid        NUMBER := 4;
    v_is_exist_product NUMBER;
BEGIN
    
    <<search_product>> -- мітка циклу
    FOR cc IN (SELECT 1
               FROM products p
               WHERE p.productid = v_productid
               HAVING COUNT(*)=0)LOOP
               
        raise_application_error(-20001, 'По productid='||v_productid||', не знайдені дані в таблиці продуктів');
        
    END LOOP search_product;
    
    dbms_output.put_line('По productid='||v_productid||' інснує дані в таблиці продуктів');
    dbms_output.put_line('Виконуємо цей кусок коду');
    
END some_proc;
/
