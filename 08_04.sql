--SET SERVEROUTPUT ON;
<<some_proc>> -- ���� ��������� PL-SQL �����
DECLARE
    v_productid        NUMBER := 1;
    v_is_exist_product NUMBER;
BEGIN

    <<search_product>> -- ���� ����������� PL-SQL �����
    BEGIN
        SELECT 1
        INTO v_is_exist_product
        FROM products p
        WHERE p.productid = v_productid;
    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, '�� productid='||v_productid||', �� ������� ��� � ������� ��������');
    END search_product;
    
    dbms_output.put_line('�� productid='||v_productid||' ����� ��� � ������� ��������');
    
    dbms_output.put_line('�������� ��� ����� ����');

END some_proc;
/


<<some_proc>> -- ���� ��������� PL-SQL �����
DECLARE
    v_productid        NUMBER := 4;
    v_is_exist_product NUMBER;
BEGIN
    
    <<search_product>> -- ���� �����
    FOR cc IN (SELECT 1
               FROM products p
               WHERE p.productid = v_productid
               HAVING COUNT(*)=0)LOOP
               
        raise_application_error(-20001, '�� productid='||v_productid||', �� ������� ��� � ������� ��������');
        
    END LOOP search_product;
    
    dbms_output.put_line('�� productid='||v_productid||' ����� ��� � ������� ��������');
    dbms_output.put_line('�������� ��� ����� ����');
    
END some_proc;
/
