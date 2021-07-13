-- INSERT INTO `users` VALUES (DEFAULT, 'noyanzin3@inbox.ru', '+79247911949', '2001-10-10',DEFAULT,DEFAULT);
-- INSERT INTO `users` VALUES (DEFAULT, 'noyanzin4@inbox.ru', '+79247911950', '2001-10-11',DEFAULT,DEFAULT);
-- INSERT INTO `users` VALUES (DEFAULT, 'noyanzin5@inbox.ru', '+79247911951', '2001-10-12',DEFAULT,DEFAULT);
-- 1. Подсчитайте средний возраст пользователей в таблице users.
USE vk;
SELECT AVG(datediff(CURDATE(), cast(birthdate as date)) / 365) FROM users;

-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.
-- При первом выполнении скрипта необходимо убрать комментарии ниже для заполнения 1 столбца таблички.

CREATE TABLE IF NOT EXISTS `count_days_of_week` (
	`day_of_week` INT UNSIGNED NOT NULL PRIMARY KEY,
    `days` INT
    );
/* INSERT INTO `count_days_of_week`(`day_of_week`,`days`) VALUES
(0,0),
(1,0),
(2,0),
(3,0),
(4,0),
(5,0),
(6,0);    
*/
SELECT * FROM users;

UPDATE `count_days_of_week`
SET days = (
SELECT COUNT(dayofweek(DATE_FORMAT(DATE_ADD(birthdate, INTERVAL (YEAR(CURRENT_DATE()) - YEAR(birthdate)) YEAR), '%Y-%m-%d')))
FROM users WHERE dayofweek(DATE_FORMAT(DATE_ADD(birthdate, INTERVAL (YEAR(CURRENT_DATE()) - YEAR(birthdate)) YEAR), '%Y-%m-%d')) = day_of_week) 
WHERE `day_of_week` > -1;
SELECT * FROM `count_days_of_week`;