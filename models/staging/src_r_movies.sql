
WITH r_movies AS (
    SELECT * FROM {{source('netflix','r_movies')}}
)

SELECT 
    MOVIEID AS MOVIE_ID,
    TITLE,
    GENRES
FROM r_movies