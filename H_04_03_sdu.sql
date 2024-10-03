--Специфікація
--
FUNCTION get_sum_price_sales(p_table IN VARCHAR2) RETURN NUMBER;
--
 
--Тіло
--
FUNCTION get_sum_price_sales(p_table IN VARCHAR2) RETURN NUMBER IS

    v_sum_price_sales NUMBER;
    v_dynamic_sql VARCHAR2(100);
    v_table VARCHAR2(30) := p_table;
    v_masage VARCHAR2(100);

BEGIN

    IF v_table NOT IN ('products','products_old') THEN

        v_masage := 'Неприпустиме значення! Очікується products або products_old';
        to_log(p_appl_proc => 'util.get_sum_price_sales', p_message => v_masage);
        raise_application_error(-20001, v_masage);

    END IF;
    
     v_dynamic_sql :='
        SELECT SUM(p.price_sales)
        FROM hr.'||p_table||' p';
        
    EXECUTE IMMEDIATE v_dynamic_sql INTO v_sum_price_sales;

    RETURN v_sum_price_sales;

END get_sum_price_sales;
--