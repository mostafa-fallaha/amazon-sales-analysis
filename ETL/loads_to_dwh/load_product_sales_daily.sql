SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE PROCEDURE load_product_sales_daily()
BEGIN
	delete from amazon_dwh.f_product_sales;
    
    insert into amazon_dwh.f_product_sales
    select * from amazon_staging_clean.product_sales ;
    
    insert into amazon_dwh.procedures_logs (date_of_execution, procedure_name, modified_table)
    values (NOW(), 'load_product_sales_daily', 'amazon_dwh.f_product_sales');
END
//

CREATE EVENT daily_product_sales_load
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_product_sales_daily();
    
-- drop procedure load_product_sales_daily;
-- drop event daily_product_sales_load

