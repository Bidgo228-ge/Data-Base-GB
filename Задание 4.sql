DROP DATABASE IF EXISTS shop;

CREATE DATABASE shop;

USE shop;



DROP TABLE IF EXISTS catalogs;

CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '�������� �������',
  UNIQUE unique_name(name(10))
);



INSERT INTO catalogs VALUES

  (DEFAULT, '����������'),

  (DEFAULT, '���.�����'),

  (DEFAULT, '����������');



DROP TABLE IF EXISTS cat;

CREATE TABLE cat (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);



INSERT INTO

  cat

SELECT  * FROM  catalogs;

SELECT * FROM cat;



DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '����������';



DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��������',
  desription TEXT COMMENT '��������',
  price DECIMAL (11,2) COMMENT '����',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = '�������� �������';



DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = '������';



DROP TABLE IF EXISTS orders_products;

CREATE TABLE orders_products (
  id SERIAL PRIMARY KEY,
  order_id INT UNSIGNED,
  product_id INT UNSIGNED,
  total INT UNSIGNED DEFAULT 1 COMMENT '���������� ���������� �������� �������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '������ ������';



DROP TABLE IF EXISTS discounts;

CREATE TABLE discounts (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  product_id INT UNSIGNED,
  discount FLOAT UNSIGNED COMMENT '�������� ������ �� 0.0 �� 1.0',
  started_at DATETIME,
  finished_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  KEY index_of_product_id(product_id)
) COMMENT = '������';



DROP TABLE IF EXISTS storehouses;

CREATE TABLE storehouses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '������';



DROP TABLE IF EXISTS storehouses_products;

CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT '����� �������� ������� �� ������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '������ �� ������';





-- =================================





-- 1.

-- ��� ��� � ������� �� ������� � ����� �� � ����� � ������� ������������, ����������� ��� ������������ shop



INSERT INTO users (name) VALUES  -- �������� ��������������
('Brandt1'),
('Brandt2'),
('Brandt3'),
('Brandt4');

UPDATE users SET created_at=NOW(), updated_at=NOW(); -- � �������� ������ ������� ������ �����







-- 2. ��� ��� � �� ������� ������� ���������, �� �������� ���� ������������



DROP TABLE IF EXISTS users2;

CREATE TABLE users2 (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = '����������';



INSERT INTO users2 (name) VALUES  -- �������� ��������������
('Brandt11'),
('Brandt12'),
('Brandt13'),
('Brandt14');



UPDATE users2 SET created_at='20.10.2017 8:10', updated_at='20.10.2017 8:10';  -- ������������� ������

UPDATE users2 set created_at=str_to_date(created_at, '%d.%m.%Y %H:%i:%s'), updated_at=str_to_date(updated_at, '%d.%m.%Y %H:%i:%s'); -- �������� � ���� datetime �������� �������

ALTER TABLE users2 MODIFY COLUMN created_at DATETIME; -- ����������� �� ������ � ���� datetime

ALTER TABLE users2 MODIFY COLUMN updated_at DATETIME;





-- 3.



ALTER TABLE storehouses ADD COLUMN `value` bigint; -- ��� ������ �������� ����������� ����



INSERT into storehouses (name, value) VALUES
('w','1'),
('qwe','2'),
('werr','3'),
('ewr','9'),
('asdf','4'),
('aa','0'),
('ff','0'),
('ffff','7');



SELECT * FROM storehouses ORDER BY IF(value=0,1,0), value;





-- 4.



SELECT * FROM users WHERE MONTHNAME(birthday_at) IN ('may', 'august');



-- 5.



SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY
													CASE id
    												WHEN 5 THEN 1
												    WHEN 1 THEN 2
    												WHEN 2 THEN 3
													END;





-- 6.



INSERT INTO users (birthday_at) VALUES
('1994-04-15'),
('2004-04-15'),
('1987-09-01'),
('1966-12-20');



SELECT  AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) FROM users; -- ������� ��.�������





-- 7.



SELECT COUNT(*), DAYNAME(DATE_FORMAT((CONCAT(YEAR(NOW()),DATE_FORMAT(birthday_at,'.%m.%d'))),'%Y.%m.%d')) AS `WEEKDAY_of_birthday` FROM users GROUP BY `WEEKDAY_of_birthday`; 








