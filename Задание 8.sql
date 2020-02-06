-- 1.



START TRANSACTION;

INSERT INTO sample1.users SELECT * FROM shop.users  WHERE id=10;
DELETE FROM shop.users WHERE id=1;
COMMIT;





-- 2

USE shop;
CREATE OR REPLACE VIEW prod_cat AS
	SELECT 
		products.name AS `товар`,
		catalogs.name as `каталог`
	FROM
		shop.products
	JOIN
		shop.catalogs
	ON
		products.id = catalogs.id;



SELECT * FROM prod_cat;





-- 1 процедуры



delimiter //



CREATE FUNCTION hello()
RETURNS TINYTEXT not DETERMINISTIC
log_bin_trust_function_creators = 1;
BEGIN
  DECLARE hr INT;
  SET hr=HOUR(NOW());
  CASE
    WHEN hr BETWEEN 0 AND 5 THEN
      RETURN `ночи`;
    WHEN hr BETWEEN 6 AND 11 THEN
      RETURN `утро`;
    WHEN hr BETWEEN 12 AND 17 THEN
      RETURN `день`;
    WHEN hr BETWEEN 18 AND 23 THEN
      RETURN `вечер`;
  END CASE;

END//



SELECT hello()//





-- 2 триггеры



CREATE TRIGGER ani_name BEFORE INSERT ON products;

FOR EACH ROW BEGIN

	IF NEW.name IS NULL AND NEW.description IS NULL THEN

	  SIGNAL SQLSTATE '45000'

	  SET message_text = 'need name!';

	 END IF;

END//