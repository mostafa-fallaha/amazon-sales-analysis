SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE PROCEDURE load_countries_monthly()
BEGIN
	delete from amazon_dwh.d_countries;
    
    insert into amazon_dwh.d_countries(id, country)
    select id, country from amazon_staging_clean.countries ;
    
    insert into amazon_dwh.procedures_logs (date_of_execution, procedure_name, modified_table)
    values (NOW(), 'load_countries_monthly', 'amazon_dwh.d_countries');
END
//

CREATE EVENT monthly_countries_load
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_countries_monthly();
    
-- drop procedure load_countries_monthly;

