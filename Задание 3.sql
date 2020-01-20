use vk; -- использования БД vk

show tables; -- показ всех таблиц БД vk

select * from family_statuses; -- показ конкретной таблицы

CREATE TABLE sex ( 
  id INT UNSIGNED NOT NULL PRIMARY KEY,
  name VARCHAR(10)
); -- создание новой таблицы 
INSERT INTO `sex` (`id`, `name`) VALUES (1, 'мужской'); -- добавление в ручную новых параметров в эту таблицу не через фейкера 
INSERT INTO `sex` (`id`, `name`) VALUES (2, 'женский'); 


ALTER TABLE profiles ADD COLUMN family_status_id INT UNSIGNED AFTER hometown; -- добавление колонку family_status_id в таблицу profiles после столбца hometown 

UPDATE profiles SET family_status_id = FLOOR(1 + (RAND() * 2)); -- рандомно меняются значения family_status_id от 1 до 2 floor округляет значение до целых

ALTER TABLE profiles DROP COLUMN user_id; -- удаление колонку user_id из таблицы profiles
ALTER TABLE profiles ADD COLUMN user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY FIRST; -- добавление колонку user_id в таблицы profiles



