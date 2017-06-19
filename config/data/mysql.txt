CREATE DATABASE stamps;

CREATE TABLE user_credentials (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	username CHAR(16) NOT NULL UNIQUE, 
	password CHAR(16) NOT NULL, 	
	environment CHAR(5) NOT NULL,
	in_use TINYINT unsigned NOT NULL	
	account_type CHAR(16), 
	last_name CHAR(20), 
	first_name CHAR(20), 
	middle_name CHAR(20), 
	account_no CHAR(20), 
	meter_no CHAR(20), 
	account_status CHAR(20), 
	account_info CHAR(20), 
	status_reason CHAR(20), 	
	email CHAR(20), 
	billing_address CHAR(20), 
	company_name CHAR(20), 
	phone_no CHAR(20), 
	comment CHAR(200), 
	date_added DATE NOT NULL
);


CREATE TABLE t8 (
    col1 INT NOT NULL,
    col2 DATE NOT NULL,
    col3 INT NOT NULL,
    col4 INT NOT NULL,
    PRIMARY KEY(col1, col2, col4),
    UNIQUE KEY(col2, col1)
)
PARTITION BY HASH(col1 + YEAR(col2))
PARTITIONS 4;


CREATE TABLE states (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	state CHAR(25), 
	population INT(9),
    UNIQUE KEY(state)
);

