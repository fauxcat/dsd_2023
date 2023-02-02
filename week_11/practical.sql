psql

create role pract2_role1 with login password 'role1';

create role pract2_role2 with login password 'role2';

create database pract2_role1 owner pract2_role1;

create database pract2_role2 owner pract2_role2;

\q

psql -h localhost -p 5432 -U pract2_role1

\l

\c dsd_22

\dt

SELECT * FROM PRODUCT WHERE PROD_ID <= 10;

\q

psql

\c dsd_22

GRANT SELECT ON PRODUCT TO pract2_role1;

\q

psql -h localhost -p 5432 -U pract2_role1

\c dsd_22

SELECT * FROM PRODUCT WHERE PROD_ID <= 10;

INSERT INTO PRODUCT (PROD_NAME,PROD_CAT) VALUES ('The Amazing New Thingy',3);

SELECT PROD_NAME, PROD_ID, PROD_CAT FROM PRODUCT WHERE PROD_NAME = 'The Amazing New Thingy';

\q

psql

\c dsd_22

GRANT UPDATE, SELECT ON role TO pract2_role1, pract2_role2;


select role_name from role;

\q

psql -h localhost -p 5432 -U pract2_role2

\c dsd_22

INSERT INTO role(role_name) VALUES ('Cleaner');

UPDATE ROLE SET ROLE_NAME = 'Hygiene Expert' where role_name = 'Cleaner';

select role_name from role;

\q

psql

CREATE VIEW cust_email AS
    SELECT cust_fname, cust_lname, email
    FROM customer;

SELECT * FROM cust_email;

\q

psql -h localhost -p 5432 -U pract2_role1

\c dsd_22

SELECT * FROM staff
JOIN role on  staff.role = role.role_id
WHERE role.role_name = 'Hygiene Expert';

\q

psql

\c dsd_22

GRANT SELECT ON cust_email TO pract2_role2;

\q

psql -h localhost -p 5432 -U pract2_role2

\c dsd_22

SELECT * FROM cust_email;

\q

psql -h localhost -p 5432 -U pract2_role1

\c dsd_22

SELECT * FROM cust_email;

\q

psql

\c dsd_22

REVOKE SELECT ON cust_email FROM pract2_role2;

\q

psql -h localhost -p 5432 -U pract2_role2

\c dsd_22

SELECT * FROM cust_email;

\q

psql -h localhost -p 5432 -U pract2_role1

\c dsd_22

SELECT * FROM cust_email;

DROP ROLE pract2_role2;

\q

psql

\c dsd_22

DROP DATABASE pract2_role1;
DROP DATABASE pract2_role2;

DROP OWNED by pract2_role1;
DROP OWNED by pract2_role2;

DROP ROLE pract2_role1;
DROP ROLE pract2_role2;
