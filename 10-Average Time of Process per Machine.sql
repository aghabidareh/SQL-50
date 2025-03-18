#
Write your MySQL query statement below
SELECT ac1.machine_id,
       ROUND(AVG(ac2.timestamp - ac1.timestamp), 3) as processing_time
FROM Activity ac1
         JOIN Activity ac2 ON ac2.machine_id = ac1.machine_id
WHERE ac1.activity_type = 'start'
  AND ac2.activity_type = 'end'
GROUP BY ac1.machine_id