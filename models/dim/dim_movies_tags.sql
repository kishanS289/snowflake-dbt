{{
    config(
        materialized='ephemeral'
    )
}}

WITH movies as (
    SELECT * FROm {{ref('dim_movies')}}
),
tags as (
    SELECT * FROM {{ref('dim_genome_tags')}}
),
scores as (
    SELECT * FROM {{ref('fact_genome_scores')}}
)

SELECT 
m.movie_id,m.movie_title,m.genres_array,
s.TAG_ID,t.RELEVANCE_SCORE,
t.tag_name
FROM movies m 
left join scores s ON m.movie_id = s.movie_id
left join tags t ON m.movie_id = t.movie_id


--Its doesn't created any models at database,output is only created in memory