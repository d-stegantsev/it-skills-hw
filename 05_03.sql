SELECT *
FROM all_directories;

CREATE VIEW iban_accounts_v AS
SELECT ext_fl.employee_id, ext_fl.iban, ext_fl.type
FROM EXTERNAL ( ( employee_id NUMBER,
                  iban VARCHAR2(100),
                  type VARCHAR2(3) )
    TYPE oracle_loader DEFAULT DIRECTORY FILES_FROM_SERVER -- ������� ����� �������� � ��
    ACCESS PARAMETERS ( records delimited BY newline
                        nologfile
                        nobadfile
                        fields terminated BY ','
                        missing field VALUES are NULL )
LOCATION('IBAN_ACCOUNTS.csv') -- ������� ����� �����
REJECT LIMIT UNLIMITED /*���� �������� ��� ��������� �����*/ ) ext_fl;


SELECT *
FROM iban_accounts_v;