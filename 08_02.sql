BEGIN
    add_product (p_productname => 'test3',
                 p_price       => 100,
                 p_quantity    => 10,
                 p_commit      => TRUE);
END;
/

SELECT *
FROM products;

CREATE UNIQUE INDEX productname_idx ON products(productname);