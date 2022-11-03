-- 1
UPDATE users SET created_ad = current_timestamp(),  updated_ad = current_timestamp();

-- 2
UPDATE users SET created_ad = STR_TO_DATE(created_ad, '%d.%m.%Y %H:%i'), updated_ad = STR_TO_DATE(updated_ad, '%d.%m.%Y %H:%i');
ALTER TABLE users MODIFY COLUMN created_ad DATETIME, MODIFY COLUMN updated_ad DATETIME;

-- 3
SELECT * FROM storehouses_products ORDER BY CASE WHEN value = 0 THEN TRUE ELSE FALSE END, value;

-- 1 
SELECT sum(datediff(current_date(), birthday))/(365*COUNT(*)) AS 'средний возраст' FROM profiles;

-- 2 
SELECT dayname(date_format(birthday, '2022-%m-%d')) AS 'Day', count(*) AS 'Repeat'
FROM profiles
GROUP BY dayname(date_format(birthday, '2022-%m-%d'));
