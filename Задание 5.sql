-- 3 задача

SELECT COUNT(id) FROM LIKES WHERE user_id IN (

  SELECT * FROM (

    SELECT id FROM users ORDER BY birthday DESC LIMIT 10

    ) as smth

);



-- 4 задача



SELECT IF(

	(SELECT COUNT(id) FROM LIKES WHERE user_id IN (

		SELECT id FROM users WHERE sex="m")

	) 

	> 

	(SELECT COUNT(id) FROM LIKES WHERE user_id IN (

		SELECT id FROM users WHERE sex="f")

	), 

   'male', 'female');



-- 5 задача



SELECT user_id, COUNT(*) AS count

FROM likes

GROUP BY user_id

ORDER BY count LIMIT 10;



SELECT user_id, COUNT(*) AS count

FROM media

GROUP BY user_id

ORDER BY count LIMIT 10;



SELECT from_user_id, COUNT(*) AS count

FROM messages

GROUP BY from_user_id

ORDER BY count LIMIT 10;