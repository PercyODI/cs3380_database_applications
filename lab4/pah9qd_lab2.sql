SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS building;

CREATE TABLE building (
	name VARCHAR(30),
	address VARCHAR(30) NOT NULL,
	state VARCHAR(30),
	zipcode VARCHAR(11) NOT NULL,
	PRIMARY KEY (address, zipcode)
) ENGINE = INNODB;

DROP TABLE IF EXISTS office;

CREATE TABLE office (
	room_number INT,
	waiting_room_capacity INT,
	building_address VARCHAR(30) NOT NULL,
	building_zipcode VARCHAR(30) NOT NULL,
	FOREIGN KEY (building_address, building_zipcode)
		REFERENCES building (address, zipcode)
			ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (room_number, building_address, building_zipcode)
) ENGINE = INNODB;

DROP TABLE IF EXISTS doctor;

CREATE TABLE doctor (
	medical_license_num INT PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	office_room INT,
	building_address VARCHAR(30),
	building_zipcode VARCHAR(30),
	FOREIGN KEY (office_room, building_address, building_zipcode)
		REFERENCES office(room_number, building_address, building_zipcode)
			ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = INNODB;

DROP TABLE IF EXISTS patient;

CREATE TABLE patient (
	ssn VARCHAR(11) PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30)
) ENGINE = INNODB;

DROP TABLE IF EXISTS insurance;

CREATE TABLE insurance (
	policy_num INT,
	insurer VARCHAR(100),
	patient_ssn VARCHAR(11) PRIMARY KEY,
	FOREIGN KEY (patient_ssn) REFERENCES patient(ssn)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = INNODB;

DROP TABLE IF EXISTS `condition`;

CREATE TABLE `condition` (
	icd10 VARCHAR(7) PRIMARY KEY,
	description TEXT
) ENGINE = INNODB;

DROP TABLE IF EXISTS labwork;

CREATE TABLE labwork (
	test_name VARCHAR(255) NOT NULL,
	test_timestamp DATETIME NOT NULL,
	test_value TEXT,
	patient_ssn VARCHAR(11),
	FOREIGN KEY (patient_ssn) 
		REFERENCES patient(ssn)
			ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(test_name, test_timestamp)
) ENGINE = INNODB;

DROP TABLE IF EXISTS appointment;

CREATE TABLE appointment (
	appt_time TIME,
	appt_date DATE,
	patient_ssn VARCHAR(11),
	doctor_license_num INT,
	FOREIGN KEY (patient_ssn) 
		REFERENCES patient(ssn)
			ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (doctor_license_num) 
		REFERENCES doctor(medical_license_num)
			ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = INNODB;

DROP TABLE IF EXISTS patient_condition;

CREATE TABLE patient_condition (
	patient_ssn VARCHAR(11), 	
	condition_icd10 VARCHAR(7),
	FOREIGN KEY (patient_ssn) 
		REFERENCES patient(ssn)
			ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (condition_icd10)
		REFERENCES `condition`(icd10)
			ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(patient_ssn, condition_icd10)
) ENGINE = INNODB;

INSERT INTO building VALUES ('Scanton Park', '133 Business Ave, Scranton', 'Pennsylvania', '18501');
INSERT INTO building VALUES ('Providence Medical Plaza', '508 Providence, Columbia', 'Missouri', '65201');
INSERT INTO building VALUES ('Astoria Hospital Place', '252 Main St, Astoria', 'Oregon', '97103');

INSERT INTO office VALUES (14, 15, '133 Business Ave, Scranton', '18501');
INSERT INTO office VALUES (172, 250, '252 Main St, Astoria', '97103');
INSERT INTO office VALUES (4, 10, '508 Providence, Columbia', '65201');

INSERT INTO doctor VALUES (155678, 'Mary', 'Hutson', 4);
INSERT INTO doctor VALUES (17272789, 'John', 'Smith', 14);
INSERT INTO doctor VALUES (1992992, 'Rory', 'Riley', 4);

INSERT INTO patient VALUES ('552-99-8898', 'Ryan', 'Givens');
INSERT INTO patient VALUES ('555-99-0000', 'Lindsey', 'Whetsell');
INSERT INTO patient VALUES ('666-99-1111', 'Shirley', 'Batsell');

INSERT INTO insurance VALUES (1781717, 'BlueCross', '555-99-0000');
INSERT INTO insurance VALUES (9919882, 'Guardian', '666-99-1111');
INSERT INTO insurance VALUES (51122348, 'Aetna', '552-99-8898');

INSERT INTO `condition` VALUES ('I77819', "Aortic ectasia, unspecified site");
INSERT INTO `condition` VALUES ('047K04Z', "Dilation of right femoral artery with drug-eluting intraluminal device, open approach");
INSERT INTO `condition` VALUES ('D61.09', "Constitutional aplastic anemia, Other constitutional aplastic anemia");

INSERT INTO labwork VALUES ('Blood Culture', '2015-09-15 09:00:00', 'Abnormal', '552-99-8898');
INSERT INTO labwork VALUES ('Homocysteine', '2015-09-28 11:30:00', 'Normal', '666-99-1111');
INSERT INTO labwork VALUES ('Rubella', '2015-10-04 14:45:00', 'Positive', '555-99-0000');

INSERT INTO appointment VALUES ('09:00:00', '2015-09-16', '552-99-8898', 155678);
INSERT INTO appointment VALUES ('12:00:00', '2015-09-29', '666-99-1111', 1992992);
INSERT INTO appointment VALUES ('15:45:00', '2015-10-05', '555-99-0000', 17272789);


INSERT INTO patient_condition VALUES ('552-99-8898', 'I77819');
INSERT INTO patient_condition VALUES ('555-99-0000', '047K04Z');
INSERT INTO patient_condition VALUES ('555-99-0000', 'D61.09');

SET FOREIGN_KEY_CHECKS = 1;