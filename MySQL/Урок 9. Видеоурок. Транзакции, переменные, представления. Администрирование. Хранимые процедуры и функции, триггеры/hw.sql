-- 1
START TRANSACTION;
INSERT INTO samples.users (name, surname) SELECT name, surname FROM shopss.users WHERE id = 1;
COMMIT;

-- 2
CREATE VIEW prod AS SELECT products.name AS name, catalogs.name AS category FROM products JOIN catalogs ON products.catalog_id = catalogs.id;

-- 3
DELIMITER //
CREATE FUNCTION hello()
RETURNS text deterministic
BEGIN
	CASE
		WHEN hour(now()) BETWEEN 6 AND 12 THEN RETURN 'доброе утро';
		WHEN hour(now()) BETWEEN 12 AND 18 THEN RETURN 'добрый день';
		WHEN hour(now()) BETWEEN 18 AND 23 THEN RETURN 'добрый вечер';
		WHEN hour(now()) BETWEEN 0 AND 6 THEN RETURN 'доброй ночи';
	END CASE;
END//
DELIMITER ;
SELECT hello()

-- 4
DROP TRIGGER IF EXISTS name_and_desc;
delimiter //
CREATE TRIGGER name_and_desc BEFORE INSERT ON products
FOR EACH ROW 
BEGIN
	IF ((NEW.name IS NULL OR NEW.name = '') AND (NEW.desription IS NULL OR NEW.name = '')) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'поле name или поле description должно быть заполнено.';
	END IF;
END//
delimiter ;
