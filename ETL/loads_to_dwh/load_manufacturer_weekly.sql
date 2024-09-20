SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE PROCEDURE load_manufacturer_weekly()
BEGIN
	delete from amazon_dwh.d_manufacturer;
    
    insert into amazon_dwh.d_manufacturer
    select * from amazon_staging_clean.manufacturer ;
    
    update amazon_dwh.d_manufacturer set manufacturer = 'unknown' where manufacturer = '';
    
    insert into amazon_dwh.procedures_logs (date_of_execution, procedure_name, modified_table)
    values (NOW(), 'load_manufacturer_weekly', 'amazon_dwh.d_manufacturer');
END
//

CREATE EVENT weekly_manufacturer_load
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_manufacturer_weekly();
    
-- drop procedure load_manufacturer_weekly;

