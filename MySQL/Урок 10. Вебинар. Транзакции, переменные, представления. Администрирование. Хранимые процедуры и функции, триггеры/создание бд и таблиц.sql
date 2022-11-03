CREATE DATABASE mini_bank;

CREATE TABLE client (
	id bigint UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name varchar(50) NOT NULL,
	lastname varchar(70) NOT NULL,
	patronymic varchar(50),
	gender tinyint(1),
	email varchar(255),
	snils char(11),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	telephone char(11),
	birthday date
);

CREATE TABLE types_of_document (
	id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name varchar(100) NOT NULL
);

CREATE TABLE attribute_of_document (
	id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name varchar(100) NOT NULL
);

CREATE TABLE client_document (
	id bigint UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	id_client bigint UNSIGNED,
	type_doc TINYINT UNSIGNED,
	attr_doc TINYINT UNSIGNED,
	series_of_doc varchar(10),
	number_of_doc varchar(15),
	date_of_issue date,
	unit_code varchar(20),
	action_time date,
	issued text,
	FOREIGN KEY (type_doc) REFERENCES types_of_document (id),
	FOREIGN KEY (id_client) REFERENCES client (id),
	FOREIGN KEY (attr_doc) REFERENCES attribute_of_document (id)
);


CREATE TABLE additional_inf (
	id_client bigint UNSIGNED PRIMARY KEY,
	inn varchar(12),
	education text,
	office text,
	client_secret_code text,
	FOREIGN KEY (id_client) REFERENCES client (id)
);

CREATE TABLE contacts (
	id_client bigint UNSIGNED PRIMARY KEY,
	calls bool DEFAULT 1,
	email bool DEFAULT 1,
	sms bool DEFAULT 1,
	letter bool DEFAULT 0,
	FOREIGN KEY (id_client) REFERENCES client (id)
);

CREATE TABLE products (
	id_product int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name varchar(250) NOT NULL,
	start_prod date NOT NULL,
	finish_prod date NOT NULL
);

CREATE TABLE contract (
	number_deal bigint UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	product int UNSIGNED NOT NULL,
	id_client bigint UNSIGNED NOT NULL,
	date_open date NOT NULL,
	date_close date,
	status tinyint(1) NOT NULL,
	FOREIGN KEY (id_client) REFERENCES client (id),
	FOREIGN KEY (product) REFERENCES products (id_product)
);

CREATE TABLE types_of_address (
	id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	type_name varchar(100)
);

CREATE TABLE address (
	id bigint UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	id_client bigint UNSIGNED NOT NULL,
	type_address TINYINT UNSIGNED NOT NULL,
	locality varchar(250),
	region varchar(250),
	street varchar(250),
	build varchar(250),
	apartment varchar(10),
	FOREIGN KEY (type_address) REFERENCES types_of_address (id),
	FOREIGN KEY (id_client) REFERENCES client (id)
);

CREATE TABLE analytical_features (
	id bigint UNSIGNED PRIMARY KEY,
	vip tinyint(1) DEFAULT 0,
	use_ios tinyint(1),
	use_android tinyint(1),
	online_banking tinyint(1),
	FOREIGN KEY (id) REFERENCES client (id)
);


