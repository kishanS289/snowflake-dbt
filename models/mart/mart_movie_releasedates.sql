{{ config(materialized="table") }}

with
    ratingss as (select * from {{ ref("fact_ratings") }}),
    releasedates as (select * from {{ ref("seed_movie_release_dates") }})

select fr.movie_id, fr.rating, rd.release_date,
CASE WHEN FR.movie_id = RD.movie_id THEN 'MATCHING' ELSE 'NOT MATCHING' END AS STAGE
from ratingss fr
left join releasedates rd 
on fr.movie_id = rd.movie_id
