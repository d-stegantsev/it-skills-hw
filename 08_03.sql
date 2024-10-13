SELECT * --SUM(p.price * p.quantity)
FROM products p
WHERE (p.productid = &p_productid OR &p_productid IS NULL);

CREATE OR REPLACE FUNCTION get_sum_product(p_productid IN NUMBER DEFAULT NULL) RETURN NUMBER IS

    total_value NUMBER;

BEGIN

    SELECT SUM(p.price * p.quantity)
    INTO total_value
    FROM products p
    WHERE (p.productid = p_productid OR p_productid IS NULL);
    
    RETURN total_value;
    
END;
/

SELECT get_sum_product(1)
FROM dual; 