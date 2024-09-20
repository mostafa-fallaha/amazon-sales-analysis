SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE PROCEDURE load_questions_answers_daily()
BEGIN
	delete from amazon_dwh.d_questions_answers;
    
    insert into amazon_dwh.d_questions_answers
    select * from amazon_staging_clean.questions_answers ;
    
    insert into amazon_dwh.procedures_logs (date_of_execution, procedure_name, modified_table)
    values (NOW(), 'load_questions_answers_daily', 'amazon_dwh.d_questions_answers');
END
//

CREATE EVENT daily_questions_answers_load
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_questions_answers_daily();
    
-- drop procedure load_questions_answers_daily;
-- drop event daily_questions_answers_load

