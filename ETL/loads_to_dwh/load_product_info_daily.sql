SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE PROCEDURE load_product_info_daily()
BEGIN
	delete from amazon_dwh.d_product_info;
    
    insert into amazon_dwh.d_product_info
    select * from amazon_staging_clean.product_info ;
    
    insert into amazon_dwh.procedures_logs (date_of_execution, procedure_name, modified_table)
    values (NOW(), 'load_product_info_daily', 'amazon_dwh.d_product_info');
END
//

CREATE EVENT daily_product_info_load
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_product_info_daily();
    
-- drop procedure load_product_info_daily;
-- drop event daily_product_info_load

