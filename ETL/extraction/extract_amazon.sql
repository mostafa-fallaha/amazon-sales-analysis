LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\amazon_co-ecommerce.csv"
INTO TABLE amazon.amazon_sales
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(uniq_id, product_name, manufacturer, price, purchase_date, ship_date, ship_country, number_available_in_stock,
number_of_reviews, number_of_answered_questions, average_review_rating, amazon_category_and_sub_category, customers_who_bought_this_item_also_bought,
description, product_information, product_description, items_customers_buy_after_viewing_this_item, customer_questions_and_answers, customer_reviews);

