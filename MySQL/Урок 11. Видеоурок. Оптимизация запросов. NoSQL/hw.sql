CREATE TABLE logs (
	create_date datetime,
	table_name varchar(20),
	pk_value bigint,
	name varchar(255)
) engine=archive;


delimiter //
CREATE TRIGGER userslog AFTER INSERT ON users FOR EACH ROW
BEGIN 
	INSERT INTO logs VALUES (now(), 'users', NEW.id, NEW.name);
END //

CREATE TRIGGER catalogslog AFTER INSERT ON catalogs FOR EACH ROW
BEGIN 
	INSERT INTO logs VALUES (now(), 'catalogs', NEW.id, NEW.name);
END //

CREATE TRIGGER productslog AFTER INSERT ON products FOR EACH ROW 
BEGIN 
	INSERT INTO logs VALUES (now(), 'products', NEW.id, NEW.name);
END //
delimiter ;