{{
    config(
        materialized='incremental',
        on_schema_change = 'fail'
    )
}}

WITH Ratings as (
    select * from {{ref("src_ratings")}}
)
select user_id, movie_id, rating, rating_timestamp
from Ratings
{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses >= to include records whose timestamp occurred since the last run of this model)
  -- (If event_time is NULL or the table is truncated, the condition will always be true and load all records)
where rating_timestamp > (select max(rating_timestamp) from {{ this }} )

{% endif %}