-- Урок 5 задание 1

INSERT INTO users VALUES(DEFAULT,'noyanzin@inbox.ru', '+79247911946', DEFAULT, DEFAULT);
SELECT * FROM users;
UPDATE users SET created_at = current_timestamp(), updated_at = current_timestamp() WHERE 
	email = 'noyanzin@inbox.ru' AND 
    phone = '+79247911946';