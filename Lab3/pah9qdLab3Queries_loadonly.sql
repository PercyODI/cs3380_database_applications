-- CREATE TABLE STATEMENTS

-- A1
CREATE TABLE pilot (
fname varchar(15),
lname varchar(15) NOT NULL,
license_num integer AUTO_INCREMENT PRIMARY KEY,
birthdate datetime NOT NULL
) ENGINE = INNODB;

-- A1
CREATE TABLE plane (
tail_num varchar(10) PRIMARY KEY,
brand varchar(25),
model varchar(25),
owner_license_num integer references pilot(license_num),
num_engines smallint
) ENGINE = INNODB;

-- INSERT STATEMENTS

-- B1: pilot population
INSERT INTO pilot (fname, lname, birthdate) VALUES (
'Charles',
'Lindbergh',
'1902-02-04'
);

INSERT INTO pilot (fname, lname, birthdate) VALUES (
'Enola',
'White',
'1988-01-02'
);

INSERT INTO pilot (fname, lname, birthdate) VALUES (
'Michael',
'O\'Neill',
'1990-08-20'
);

INSERT INTO pilot (fname, lname, birthdate) VALUES (
'Jessica',
'Powell',
'1990-12-27'
);

INSERT INTO pilot (fname, lname, birthdate) VALUES (
'Alex',
'Kirby',
'1990-07-15'
);

INSERT INTO pilot (fname, lname, birthdate) VALUES (
'Daniel',
'Wright',
'1990-05-09'
);

INSERT INTO pilot (fname, lname, birthdate) VALUES (
'Alvin',
'Zitting',
'1989-07-18'
);

INSERT INTO pilot (fname, lname, birthdate) VALUES (
'Daniel',
'Dey',
'1988-05-13'
);

INSERT INTO pilot (fname, lname, birthdate) VALUES (
'J.C.',
'Feger',
'1982-04-13'
);

INSERT INTO pilot (fname, lname, birthdate) VALUES (
'Vince',
'Serianni',
'1968-09-14'
);

-- B2: plane population

INSERT INTO plane (tail_num, brand, model, owner_license_num, num_engines) VALUES (
'18859',
'Babcock',
'Bartlett Zephry',
91,
1
);

INSERT INTO plane (tail_num, brand, model, owner_license_num, num_engines) VALUES (
'81965',
'Backer',
'Supercat',
31,
1
);

INSERT INTO plane (tail_num, brand, model, owner_license_num, num_engines) VALUES (
'1569',
'Hall',
'XP2H',
11,
4
);

INSERT INTO plane (tail_num, brand, model, owner_license_num, num_engines) VALUES (
'998',
'Paalson',
'Type 1',
1,
1
);

INSERT INTO plane (tail_num, brand, model, owner_license_num, num_engines) VALUES (
'98540',
'Electravia',
'Electro Trike',
51,
1
);

INSERT INTO plane (tail_num, brand, model, owner_license_num, num_engines) VALUES (
'20041988',
'Xian',
'JH-7',
71,
2
);

INSERT INTO plane (tail_num, brand, model, owner_license_num, num_engines) VALUES (
'442012',
'XtremeAir',
'Sbach 342',
81,
1
);

INSERT INTO plane (tail_num, brand, model, owner_license_num, num_engines) VALUES (
'1710013',
'Quest',
'Kodiak',
41,
1
);

INSERT INTO plane (tail_num, brand, model, owner_license_num, num_engines) VALUES (
'19361',
'Laird-Turner',
'Meteor LTR-14',
51,
1
);

INSERT INTO plane (tail_num, brand, model, owner_license_num, num_engines) VALUES (
'1515',
'Laister',
'LP-15 Nugget',
11,
0
);

/*
-- SELECT STATEMENTS

-- C1
SELECT brand, model FROM plane;

-- C2
SELECT lname FROM pilot WHERE lname = 'Dey';

-- C3
SELECT num_engines FROM plane WHERE brand = 'XtremeAir';

-- C4
SELECT birthdate FROM pilot;

-- C5
SELECT * FROM pilot;

-- C6
SELECT tail_num FROM plane;


-- UPDATE/DELETE STATEMENTS

-- D1
UPDATE plane SET num_engines = 4 WHERE tail_num = '1515';

-- D2
DELETE FROM plane WHERE tail_num = '442012';

-- D3
UPDATE pilot SET lname = 'Cookie' WHERE fname = 'Daniel';

-- D4
UPDATE plane SET brand = 'Kodiak' WHERE model = 'XP2H';

-- D5
DELETE FROM plane WHERE num_engines < 2;
*/
