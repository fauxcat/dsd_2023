create database secdb;

\c secdb

CREATE EXTENSION IF NOT EXISTS pgcrypto; --Turns on encryption

CREATE TABLE secDemo(id serial PRIMARY KEY, pw bytea);

INSERT INTO secdemo(pw)
VALUES (encrypt('Holiday!lips@', '56732', 'aes'));

select * from secdemo;

select decrypt(pw, '56732', 'aes') as 'decrypted version' FROM secdemo; -- still bytea at this point


-- select convert_from(decrypt(pw, 'key', 'aes'), 'utf-8') FROM secdemo;
-- convert_from() converts from binary to plaintext

select convert_from(decrypt(pw, '56732', 'aes'), 'utf-8') as "converted from decrypted" FROM secdemo;

create database sec3;

\c sec3

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE member(
    member_id serial PRIMARY KEY,
    fname varchar(30),
    lname varchar(30),
    dob date,
    pcode varchar(8),
    pw bytea
);

INSERT INTO member(fname, lname, dob, pcode, pw)
VALUES ('Adam', 'Smith', '1984-12-15', 'PO1 4GU', (encrypt('H3l10P3op!e', '75206', 'aes'))),
       ('Jane', 'Smith', '1989-07-21', 'PO5 1UT', (encrypt('Wh007ts!nM8', '64326', 'aes'))),
       ('John', 'Smith', '2001-03-10', 'PO11 7IS', (encrypt('lO0Op_zs33!', '23463', 'aes'))),
       ('Sarah', 'Smith', '2000-09-21', 'PO3 1AA', (encrypt('5pUwo09@', '74527', 'aes'))),
       ('Michael', 'Smith', '1999-02-19', 'PO3 5ER', (encrypt('P4s5w000r8!2', '85753', 'aes')));

SELECT * FROM member;

--This could probably be done better
select convert_from(decrypt(pw, '75206', 'aes'), 'utf-8') as "converted from decrypted" FROM member
WHERE member_id = 1;
select convert_from(decrypt(pw, '64326', 'aes'), 'utf-8') as "converted from decrypted" FROM member
WHERE member_id = 2;
select convert_from(decrypt(pw, '23463', 'aes'), 'utf-8') as "converted from decrypted" FROM member
WHERE member_id = 3;
select convert_from(decrypt(pw, '74527', 'aes'), 'utf-8') as "converted from decrypted" FROM member
WHERE member_id = 4;
select convert_from(decrypt(pw, '85753', 'aes'), 'utf-8') as "converted from decrypted" FROM member
WHERE member_id = 5;


\c dsd_22

ALTER TABLE customer
ADD CONSTRAINT unique_town
UNIQUE (town);

select count(*) from manifest;

select count(DISTINCT prod_id) from manifest;

select count(*) from manifest WHERE prod_id = 24;

select count(*) from manifest WHERE prod_id = 2;

select DISTINCT prod_id from manifest ORDER BY prod_id desc;

ALTER TABLE staff
ADD CONSTRAINT postcodeCheck
CHECK (char_length(postcode) > 5);

\c up2107490

create table date_check (
	id INT primary key,
	first_name VARCHAR(50) not null,
	last_name VARCHAR(50) not null,
	email VARCHAR(50) not null,
	joined DATE not null
);
insert into date_check (id, first_name, last_name, email, joined) values (1, 'Carie', 'Harling', 'charling0@yale.edu', '2022-04-28');
insert into date_check (id, first_name, last_name, email, joined) values (2, 'Deina', 'Brennans', 'dbrennans1@slashdot.org', '2022-04-08');
insert into date_check (id, first_name, last_name, email, joined) values (3, 'Devon', 'Matijasevic', 'dmatijasevic2@economist.com', '2022-09-25');
insert into date_check (id, first_name, last_name, email, joined) values (4, 'Wald', 'Kleinhausen', 'wkleinhausen3@trellian.com', '2022-08-13');
insert into date_check (id, first_name, last_name, email, joined) values (5, 'Cammie', 'Womack', 'cwomack4@who.int', '2022-06-19');
insert into date_check (id, first_name, last_name, email, joined) values (6, 'Cross', 'MacCallam', 'cmaccallam5@tuttocitta.it', '2023-02-05');
insert into date_check (id, first_name, last_name, email, joined) values (7, 'Maris', 'Flitcroft', 'mflitcroft6@clickbank.net', '2022-07-12');
insert into date_check (id, first_name, last_name, email, joined) values (8, 'Peggy', 'Gasquoine', 'pgasquoine7@ebay.com', '2022-07-22');
insert into date_check (id, first_name, last_name, email, joined) values (9, 'Kermit', 'Ninnoli', 'kninnoli8@smh.com.au', '2022-10-10');
insert into date_check (id, first_name, last_name, email, joined) values (10, 'Frieda', 'Glassford', 'fglassford9@wufoo.com', '2022-08-26');
insert into date_check (id, first_name, last_name, email, joined) values (11, 'Lanie', 'Boggish', 'lboggisha@comcast.net', '2022-03-31');
insert into date_check (id, first_name, last_name, email, joined) values (12, 'Amelie', 'Timmons', 'atimmonsb@wp.com', '2022-11-23');
insert into date_check (id, first_name, last_name, email, joined) values (13, 'Portia', 'Nielson', 'pnielsonc@wix.com', '2022-10-10');
insert into date_check (id, first_name, last_name, email, joined) values (14, 'Sara-ann', 'Ellens', 'sellensd@chronoengine.com', '2022-06-15');
insert into date_check (id, first_name, last_name, email, joined) values (15, 'Bob', 'Larcombe', 'blarcombee@dailymotion.com', '2022-06-28');
insert into date_check (id, first_name, last_name, email, joined) values (16, 'Celestyn', 'Wickenden', 'cwickendenf@prnewswire.com', '2022-06-15');
insert into date_check (id, first_name, last_name, email, joined) values (17, 'Rina', 'Dymoke', 'rdymokeg@discuz.net', '2022-07-19');
insert into date_check (id, first_name, last_name, email, joined) values (18, 'Isadora', 'Haughey', 'ihaugheyh@sfgate.com', '2022-07-31');
insert into date_check (id, first_name, last_name, email, joined) values (19, 'Demetria', 'Neem', 'dneemi@jiathis.com', '2022-05-08');
insert into date_check (id, first_name, last_name, email, joined) values (20, 'Feliza', 'Gras', 'fgrasj@printfriendly.com', '2022-03-19');

select last_name, joined FROM date_check;

select last_name, joined FROM date_check ORDER BY last_name desc;

select last_name, joined FROM date_check ORDER BY first_name desc;

select last_name, joined FROM date_check 
WHERE joined >= '2022-10-01'::date;

select last_name, joined FROM date_check 
WHERE joined >= '2022-10-01'::date
ORDER BY joined asc;

select last_name, joined FROM date_check 
WHERE joined BETWEEN '2022-04-20' AND '2022-11-30';