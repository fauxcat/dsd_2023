\c up2107490

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(40),
    email VARCHAR(100),
    password text
);

scp users.csv up2107490@104.155.99.98:~  (from folder with users.csv file in a command prompt)

\copy users(id, first_name, last_name, email, password) from '/home/up2107490/users.csv' DELIMITER ',' CSV HEADER

SELECT * FROM users limit 5;

CREATE EXTENSION PGCRYPTO; # This needs to be run on your upxx database

update users set password = crypt(password, gen_salt('bf'));

SELECT * FROM users limit 5;

SELECT first_name, last_name, password from users where id = 304;

SELECT id,
   	first_name,
   	last_name
FROM users
WHERE email = 'cpeaseman8f@simplemachines.org'
  AND password = crypt('nr4kjyxW', password);



##Send an incorrect password to test the response
SELECT id,
   	first_name,
   	last_name
FROM users
WHERE email = 'cpeaseman8f@simplemachines.org'
  AND password = crypt('nr4kjyxW!', password);


INSERT INTO users
VALUES(600,
   	'Flubby',
   	'Foster',
   	'f_f@fmail.com',
   	crypt('thisismypassword1', gen_salt('bf')));

SELECT password
FROM users
WHERE id = 600;

INSERT INTO users
VALUES(601,
   	'Flabby',
   	'Faster',
   	'l_a@fmail.com',
   	crypt('thisismypassword1', gen_salt('bf')));

SELECT password
FROM users
WHERE id = 601;

SET DATESTYLE TO EUROPEAN;

create table users2 (
	id INT primary key,
	first_name VARCHAR(20) not null,
	last_name VARCHAR(30) not null,
	email VARCHAR(55) not null,
	dob DATE not null
);

insert into users2 (id, first_name, last_name, email, dob) values (1, 'Zaria', 'Coot', 'zcoot0@baidu.com', '07-11-2002');
insert into users2 (id, first_name, last_name, email, dob) values (2, 'Lucho', 'Holbie', 'lholbie1@adobe.com', '09-03-2000');
insert into users2 (id, first_name, last_name, email, dob) values (3, 'Sherlock', 'Shoveller', 'sshoveller2@zdnet.com', '10-10-2002');
insert into users2 (id, first_name, last_name, email, dob) values (4, 'Shelba', 'Riach', 'sriach3@xing.com', '09-11-2002');
insert into users2 (id, first_name, last_name, email, dob) values (5, 'Joseph', 'Lynn', 'jlynn4@weather.com', '25-11-2003');
insert into users2 (id, first_name, last_name, email, dob) values (6, 'Haroun', 'De Haven', 'hdehaven5@vistaprint.com', '23-06-2003');
insert into users2 (id, first_name, last_name, email, dob) values (7, 'Fidelio', 'Lindeboom', 'flindeboom6@salon.com', '01-11-2003');
insert into users2 (id, first_name, last_name, email, dob) values (8, 'Sheryl', 'Kubat', 'skubat7@fc2.com', '07-11-2001');
insert into users2 (id, first_name, last_name, email, dob) values (9, 'Lisha', 'Skillern', 'lskillern8@goo.gl', '10-09-2003');
insert into users2 (id, first_name, last_name, email, dob) values (10, 'Aubrie', 'Sedgmond', 'asedgmond9@nymag.com', '02-01-2004');
insert into users2 (id, first_name, last_name, email, dob) values (11, 'Thorvald', 'Blincko', 'tblinckoa@mozilla.org', '21-11-2001');
insert into users2 (id, first_name, last_name, email, dob) values (12, 'Quincy', 'Keeltagh', 'qkeeltaghb@multiply.com', '04-12-2002');
insert into users2 (id, first_name, last_name, email, dob) values (13, 'Javier', 'Camel', 'jcamelc@weather.com', '15-11-2001');
insert into users2 (id, first_name, last_name, email, dob) values (14, 'Ann-marie', 'Scholtz', 'ascholtzd@hp.com', '03-07-2001');
insert into users2 (id, first_name, last_name, email, dob) values (15, 'Camel', 'Radmer', 'cradmere@about.com', '06-02-2001');
insert into users2 (id, first_name, last_name, email, dob) values (16, 'Friedrich', 'Truluck', 'ftruluckf@soup.io', '04-09-2000');
insert into users2 (id, first_name, last_name, email, dob) values (17, 'Nichole', 'Rowbottam', 'nrowbottamg@state.tx.us', '10-09-2001');
insert into users2 (id, first_name, last_name, email, dob) values (18, 'Kory', 'Agglio', 'kagglioh@i2i.jp', '20-04-2000');
insert into users2 (id, first_name, last_name, email, dob) values (19, 'Bella', 'O''Brallaghan', 'bobrallaghani@bravesites.com', '01-10-2002');
insert into users2 (id, first_name, last_name, email, dob) values (20, 'Francine', 'Rantoul', 'frantoulj@e-recht24.de', '24-08-2001');

select dob from users2 where id = 10;

select age(dob) from users2 where id = 1;

select age('30-06-2035', dob) from users2 where id = 1;

ALTER TABLE users2 ADD COLUMN joined date DEFAULT CURRENT_DATE;

SELECT id from users2
ORDER BY id desc;

insert into users2 (id, first_name, last_name, email, dob, joined) values (21, 'Laura', 'Tooc', 'ltooc12@baidu.com', '21-01-2001', '09-10-2021');
insert into users2 (id, first_name, last_name, email, dob, joined) values (22, 'Lochu', 'Hibloe', 'lhibloe00@adobe.com', '09-11-2003', '03-01-2023');
insert into users2 (id, first_name, last_name, email, dob) values (23, 'Shorleck', 'Shevoller', 'sshevoller9@zdnet.com', '12-12-2000');
insert into users2 (id, first_name, last_name, email, dob) values (24, 'Sebla', 'Raich', 'saich1@xing.com', '02-01-2002');
insert into users2 (id, first_name, last_name, email, dob) values (25, 'Jesoph', 'Lunn', 'jlunn5@weather.com', '28-11-2001');

select * from users2;

select * from users2
WHERE joined = null;