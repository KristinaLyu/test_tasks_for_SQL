-- Задача 1. Напишите запрос, который выведет пилотов, которые в качестве второго пилота в августе этого года трижды ездили в аэропорт Шереметьево. 

SELECT 
  name 
FROM 
  pilots 
  INNER JOIN flights ON pilots.pilot_id = flights.second_pilot_id 
WHERE 
  destination = "Шереметьево" 
  AND flight_dt LIKE "2022-08-%" 
GROUP BY 
  pilot_id 
HAVING 
  COUNT(flight_dt) = 3;


-- Задача 2. Выведите пилотов старше 45 лет, совершали полеты на самолетах с количеством пассажиров больше 30.

SELECT 
  name 
FROM 
  pilots 
  INNER JOIN flights ON pilots.pilot_id = flights.first_pilot_id 
  OR pilots.pilot_id = flights.second_pilot_id 
  INNER JOIN planes ON flights.plane_id = planes.plane_id 
WHERE 
  age > 45 
  AND cargo_flg = 0 
  AND quantity > 30
GROUP BY 
  pilot_id;


-- Задача 3. Выведите ТОП 10 пилотов-капитанов (first_pilot_id), которые совершили наибольшее число грузовых перелетов в этом году

SELECT 
  name, 
  COUNT(flight_dt) AS amount 
FROM 
  pilots 
  INNER JOIN flights ON pilots.pilot_id = flights.first_pilot_id 
  INNER JOIN planes ON flights.plane_id = planes.plane_id 
WHERE 
  cargo_flg = 1 
  AND flight_dt LIKE "2022-%" 
GROUP BY 
  pilot_id 
ORDER BY 
  amount DESC 
LIMIT 
  10;
