-- клиенты, которых можно будет добавить в базу обзвона...
SELECT client.id, client.name, client.lastname, client.patronymic, client.telephone
FROM client JOIN contacts ON client.id = contacts.id_client
WHERE contacts.calls = 1;

-- кол-во клиентов мужчин
SELECT count(client.id) AS 'кол-во клиентов мужского пола'
FROM client
WHERE gender = 1
GROUP BY gender;