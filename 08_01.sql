CREATE OR REPLACE PROCEDURE add_product (p_productname IN VARCHAR2,
                                         p_price IN NUMBER,
                                         p_quantity IN NUMBER,
                                         p_commit IN BOOLEAN DEFAULT FALSE) IS
                                         
    v_productid NUMBER;
    
    FUNCTION get_max_productid RETURN NUMBER IS

        v_productid NUMBER;

    BEGIN
    
        SELECT NVL(MAX(productid),0)+1
        INTO v_productid
        FROM products;
        RETURN v_productid;
        
    END get_max_productid;

BEGIN

    v_productid := get_max_productid;
    
    INSERT INTO products (productid,productname,price,quantity)
    VALUES (v_productid,p_productname,p_price,p_quantity);
    
    IF p_commit = TRUE THEN
        COMMIT;
    END IF;
    
    dbms_output.put_line('Продукт '||p_productname||' успішно доданий до таблиці Products.');
    
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Виникла помилка: '||sqlerrm);
        
END add_product;
/