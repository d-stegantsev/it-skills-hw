DECLARE 
    v_table    VARCHAR2(50) := 'products_old';
    v_sql_code VARCHAR2(50);
    v_sum NUMBER;
BEGIN

    v_sql_code := 'SELECT SUM(p.price_sales) FROM hr.'||v_table||' p';
    
    --dbms_output.put_line (v_sql_code);
    
    EXECUTE IMMEDIATE v_sql_code INTO v_sum;
    
    dbms_output.put_line (v_sum);

END;
/
