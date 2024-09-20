SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE PROCEDURE load_sub_categories_weekly()
BEGIN
	delete from amazon_dwh.d_sub_categories;
    
    insert into amazon_dwh.d_sub_categories
    select * from amazon_staging_clean.sub_categories ;
    
    -- update amazon_dwh.d_categories set category = 'unknown' where category = '';
    
    insert into amazon_dwh.procedures_logs (date_of_execution, procedure_name, modified_table)
    values (NOW(), 'load_sub_categories_weekly', 'amazon_dwh.d_sub_categories');
END
//

CREATE EVENT weekly_sub_categories_load
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_sub_categories_weekly();
    
-- drop procedure load_sub_categories_weekly;

