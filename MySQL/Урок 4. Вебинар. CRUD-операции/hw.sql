-- дополнил таблицу необходимой колонкой
ALTER TABLE profiles ADD COLUMN is_active BOOLEAN DEFAULT 1;

-- добавим немного записей в таблицу users 
INSERT INTO users (id, first_name, last_name, email, phone, password_hash, created_at, updated_at)
VALUES (DEFAULT, 'Oleg', 'Menshicov', 'olgegdm@gmai.com', '85405553535', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, DEFAULT),
(DEFAULT, 'Den', 'Plasticov', 'denplast@gmai.com', '88005511535', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, DEFAULT),
(DEFAULT, 'Misha', 'Derevenshicov', 'mishder@gmai.com', '88225553535', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, DEFAULT),
(DEFAULT, 'Dima', 'Denisov', 'dimden@gmai.com', '88005553655', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, DEFAULT),
(DEFAULT, 'Anatoliy', 'Mishcin', 'anatmish@gmai.com', '88001453535', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, DEFAULT),
(DEFAULT, 'Anna', 'Yacovleva', 'annyac@gmai.com', '88005553665', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, DEFAULT),
(DEFAULT, 'Elena', 'Svinarenco', 'elensvin@gmai.com', '88005515535', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, DEFAULT),
(DEFAULT, 'Anastasia', 'Krutiva', 'anastkrutaya@gmai.com', '88065553535', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, DEFAULT),
(DEFAULT, 'Kristina', 'Klassova', 'kristklass@gmai.com', '82205553535', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, DEFAULT),
(DEFAULT, 'Sophia', 'Bogdanova', 'sophbog@gmai.com', '88005433535', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, DEFAULT);

-- выводим только уникальные имена из таблицы, отсортированные по алфавиту
SELECT DISTINCT first_name FROM users
ORDER BY first_name ASC;

SELECT * FROM users;

-- добавим записи в таблицу profiles 
INSERT INTO profiles (user_id, gender, birthday, photo_id, city, country, is_active)
VALUES (3, 'm', '2015-12-01', 54, 'Moscow', 'Russia', DEFAULT),
(4, 'm', '1990-12-01', 1943, 'buzuluk', 'Russia', DEFAULT),
(6, 'm', '2001-12-01', 1234, 'spb', 'Russia', DEFAULT),
(7, 'm', '1999-12-01', 541, 'orenburg', 'Russia', DEFAULT),
(8, 'm', '2006-12-01', 661, 'samara', 'Russia', DEFAULT),
(9, 'm', '2008-12-01', 341, 'ufa', 'Russia', DEFAULT),
(10, 'm', '2015-12-01', 261, 'novgorod', 'Russia', DEFAULT),
(11, 'f', '2011-12-01', 771, 'penza', 'Russia', DEFAULT),
(12, 'f', '1967-12-01', 761, 'vladivostok', 'Russia', DEFAULT),
(13, 'f', '1957-12-01', 231, 'novosibirsk', 'Russia', DEFAULT),
(14, 'f', '2000-12-01', 2641, 'pushkin', 'Russia', DEFAULT),
(15, 'f', '2013-12-01', 65331, 'saratov', 'Russia', DEFAULT);

-- деактивируем всех пользователей несовершеннолетних (6570 кол-во дней к 18 летию)
UPDATE profiles 
SET is_active = 0
WHERE abs(datediff(birthday, current_date())) < 6570;

-- добавим сообщения
INSERT INTO messages (id, from_user_id, to_user_id, txt, created_at, updated_at, is_delivered)
VALUES (DEFAULT, 4, 7, 'hello', '2030-05-20 20:29:21', '2030-05-20 20:29:21', DEFAULT),
(DEFAULT, 1, 8, 'play', '2040-05-20 20:29:21', '2030-05-20 20:29:21', DEFAULT),
(DEFAULT, 10, 12, 'dota', '2010-05-20 20:29:21', '2030-05-20 20:29:21', DEFAULT),
(DEFAULT, 11, 9, 'geekbrains', '2010-05-20 20:29:21', '2030-05-20 20:29:21', DEFAULT),
(DEFAULT, 3, 1, 'windows', '2110-05-20 20:29:21', '2030-05-20 20:29:21', DEFAULT);

-- удалим сообщения из будущего
DELETE FROM messages 
WHERE datediff(created_at, current_date()) > 0;