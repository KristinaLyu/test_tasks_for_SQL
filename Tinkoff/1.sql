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
