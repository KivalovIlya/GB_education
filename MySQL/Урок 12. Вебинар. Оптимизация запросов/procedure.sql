-- просмотр размера базы данных, можно, например в логи потом заносить и смотреть как база разрастается по времени.
delimiter //
CREATE PROCEDURE db_size()
BEGIN 
	SELECT table_schema AS 'база данных', round(sum(data_length + index_length) / 1024 / 1024, 1) AS 'размер (MB)'
	FROM information_schema.tables
	WHERE table_schema = 'mini_bank'
	GROUP BY TABLE_SCHEMA;
END//
delimiter ;
