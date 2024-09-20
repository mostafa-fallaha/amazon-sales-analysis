CREATE TABLE `d_also_bought` (
  `id` varchar(255) DEFAULT NULL,
  `also_bought` varchar(255) DEFAULT NULL,
  KEY `fk_aslo_bought_product_idx` (`id`),
  CONSTRAINT `fk_aslo_bought_product` FOREIGN KEY (`id`) REFERENCES `f_product_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `d_categories` (
  `id` int NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `d_countries` (
  `id` int NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `d_manufacturer` (
  `id` int NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `d_product_info` (
  `id` varchar(255) DEFAULT NULL,
  `product_information` text,
  `product_description` text,
  KEY `fk_info_product_idx` (`id`),
  CONSTRAINT `fk_info_product` FOREIGN KEY (`id`) REFERENCES `f_product_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `d_questions_answers` (
  `id` varchar(255) DEFAULT NULL,
  `q_and_a` text,
  KEY `fk_id_sales_id_idx` (`id`),
  CONSTRAINT `fk_q_and_a_product` FOREIGN KEY (`id`) REFERENCES `f_product_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `d_sub_categories` (
  `id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `sub_category_1` varchar(255) DEFAULT NULL,
  `sub_category_2` varchar(255) DEFAULT NULL,
  `sub_category_3` varchar(255) DEFAULT NULL,
  `sub_category_4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sub_cat_category_idx` (`category_id`),
  CONSTRAINT `fk_sub_cat_category` FOREIGN KEY (`category_id`) REFERENCES `d_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `f_product_sales` (
  `id` varchar(255) NOT NULL,
  `product_name` text,
  `manufacturer_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `ship_date` date DEFAULT NULL,
  `shipping_status` varchar(255) DEFAULT NULL,
  `target_group` varchar(255) DEFAULT NULL,
  `ship_country_id` int DEFAULT NULL,
  `count_in_stock` int DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `number_of_reviews` varchar(255) DEFAULT NULL,
  `number_of_answered_questions` varchar(255) DEFAULT NULL,
  `average_review_rating` decimal(10,2) DEFAULT NULL,
  `also_bought_similarity` decimal(10,2) DEFAULT NULL,
  `customer_reviews` text,
  `label` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sales_category_idx` (`category_id`),
  KEY `fk_sales_manufacturer_idx` (`manufacturer_id`),
  KEY `fk_sales_ship_country_idx` (`ship_country_id`),
  CONSTRAINT `fk_sales_manufacturer` FOREIGN KEY (`manufacturer_id`) REFERENCES `d_manufacturer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sales_ship_country` FOREIGN KEY (`ship_country_id`) REFERENCES `d_countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `procedures_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_of_execution` datetime DEFAULT NULL,
  `procedure_name` varchar(45) DEFAULT NULL,
  `modified_table` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci




