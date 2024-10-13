CREATE FUNCTION add_years(p_date IN DATE,
                          p_year IN NUMBER) RETURN DATE IS
    v_date DATE;
    v_year NUMBER := p_year*12;

BEGIN

    SELECT add_months(p_date, v_year)
    INTO v_date
    FROM dual;
    
    RETURN v_date;

END add_years;
/

SELECT add_years(p_date => SYSDATE, p_year => 10), SYSDATE
FROM dual;

CREATE TABLE employees AS
SELECT *
FROM hr.employees em;