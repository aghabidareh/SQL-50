#
Write your MySQL query statement below
SELECT name AS results
FROM (SELECT u.name, COUNT(u.name) AS count
      FROM Users u
          JOIN MovieRating m
      ON u.user_id = m.user_id
      GROUP BY u.user_id
      ORDER BY count DESC, u.name ASC
          LIMIT 1) AS temp
UNION ALL
SELECT title AS results
FROM (SELECT mo.title, AVG(m.rating) AS avg_rating
      FROM Movies mo
               JOIN Movierating m
                    ON m.movie_id = mo.movie_id
      WHERE m.created_at BETWEEN '2020-02-01' AND '2020-02-28'
      GROUP BY m.movie_id
      ORDER BY avg_rating DESC, mo.title ASC LIMIT 1) AS temp1