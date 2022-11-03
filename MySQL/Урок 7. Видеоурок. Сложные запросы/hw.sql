-- 1
SELECT DISTINCT users.id, users.name, users.birthday_at 
FROM users INNER JOIN orders ON users.id = orders.user_id;

-- 2
SELECT products.name, products.price, catalogs.name
FROM products INNER JOIN catalogs ON products.catalog_id = catalogs.id;








