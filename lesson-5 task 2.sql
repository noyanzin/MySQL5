DROP DATABASE test1; 
CREATE DATABASE test1;
USE test1;
CREATE TABLE `users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `phone` VARCHAR(100) NOT NULL UNIQUE,
  -- `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  -- `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  `created_at` VARCHAR(15),
  `updated_at` VARCHAR(15)
);
INSERT INTO `users` VALUES (DEFAULT, 'noyanzin@inbox.ru', '+79247911946', '20.10.2017 8:10','21.11.2017 9:11');
INSERT INTO `users` VALUES (DEFAULT, 'noyanzin1@inbox.ru', '+79247911947', '22.10.2017 8:13','24.11.2017 9:18');
INSERT INTO `users` VALUES (DEFAULT, 'noyanzin2@inbox.ru', '+79247911948', '23.10.2017 8:17','25.11.2017 9:13');
ALTER TABLE users ADD created_at_dt DATETIME, ADD updated_at_dt DATETIME;
UPDATE users
SET created_at_dt = STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'),
    updated_at_dt = STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i') WHERE ID > 0;
ALTER TABLE users 
    DROP created_at, DROP updated_at, 
    RENAME COLUMN created_at_dt TO created_at, RENAME COLUMN updated_at_dt TO updated_at;
SELECT * FROM users;