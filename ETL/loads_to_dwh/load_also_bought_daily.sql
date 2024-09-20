SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE PROCEDURE load_also_bought_daily()
BEGIN
	delete from amazon_dwh.d_also_bought;
    
    insert into amazon_dwh.d_also_bought
    select * from amazon_staging_clean.also_bought ;
    
    insert into amazon_dwh.procedures_logs (date_of_execution, procedure_name, modified_table)
    values (NOW(), 'load_also_bought_daily', 'amazon_dwh.d_also_bought');
END
//

CREATE EVENT daily_also_bought_load
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_also_bought_daily();
    
-- drop procedure load_also_bought_daily;
-- drop event daily_also_bought_load

