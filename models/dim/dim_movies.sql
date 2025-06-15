WITH src_movies as (
    SELECT * FROM {{ ref('src_movies')  }}
)

SELECT  
    MOVIE_ID,
    INITCAP(TRIM(TITLE)) as MOVIE_TITLE,
    SPLIT(GENRES,'|') as GENRES_ARRAY
FROM src_movies