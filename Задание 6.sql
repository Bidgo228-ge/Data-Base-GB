-- 1.



use shop;
SELECT 
  users.name
FROM
  users
JOIN
  orders
ON users.id = orders.user_id; 

 

 

-- 2.



SELECT
  products.name AS `�����`,
  catalogs.name AS `������ �������`
FROM
  products
JOIN
  catalogs
ON products.catalog_id = catalogs.id;

