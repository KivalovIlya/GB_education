-- ЗАДАНИЕ 1 
SELECT users.firstname, users.lastname
FROM users INNER JOIN messages WHERE users.id = messages.from_user_id AND messages.to_user_id = 11
GROUP BY messages.from_user_id
ORDER BY COUNT(from_user_id) DESC
LIMIT 1;

-- ЗАДАНИЕ 2

INSERT INTO posts VALUES
(DEFAULT, 9, 'hello', DEFAULT, DEFAULT),
(DEFAULT, 7, 'how', DEFAULT, DEFAULT),
(DEFAULT, 9, 'are you', DEFAULT, DEFAULT);

INSERT INTO posts_likes VALUES 
(18, 4, 1),
(19, 3, 1),
(20, 2, 1),
(21, 1, 1),
(21, 5, 1),
(19, 6, 1);

SELECT COUNT(*)
FROM posts_likes INNER JOIN posts ON posts_likes.post_id = posts.id INNER JOIN users ON posts.user_id = users.id INNER JOIN profiles ON users.id = profiles.user_id
WHERE datediff(current_date(), profiles.birthday) < 3650;

-- ЗАДАНИЕ 3
SELECT profiles.gender  
FROM posts_likes INNER JOIN users ON posts_likes.user_id = users.id INNER JOIN profiles ON users.id = profiles.user_id
WHERE profiles.gender = 'f' OR profiles.gender = 'm'
GROUP BY profiles.gender
ORDER BY count(profiles.gender) DESC
LIMIT 1;