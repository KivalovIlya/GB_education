CREATE VIEW client_main_doc AS SELECT client.id AS 'рег. номер', client.name AS 'имя', client.lastname AS 'фамилия', client.patronymic AS 'отчество',
client_document.series_of_doc AS 'серия', client_document.number_of_doc AS 'номер', client_document.date_of_issue AS 'дата выдачи', client_document.action_time AS 'дата окончания'
FROM client JOIN client_document ON client.id = client_document.id_client
WHERE client_document.type_doc = 1 AND client_document.attr_doc = 1;

CREATE VIEW all_deals AS SELECT contract.number_deal AS 'номер сделки', client.id AS 'рег. номер клиента', products.name AS 'продукт', contract.status AS 'статус сделки'
FROM contract JOIN client ON contract.id_client = client.id JOIN products ON contract.product = products.id_product;