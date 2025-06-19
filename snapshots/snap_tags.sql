{% snapshot snap_tags %}

{{
    config(
        target_schema='snapshots',
        unique_key=['USER_ID','MOVIE_ID','TAG'],
        strategy='timestamp',
        updated_at='tags_timestamp',
        invalidate_hard_deletes=True
    )
}}

SELECT 
{{ dbt_utils.generate_surrogate_key(['USER_ID','MOVIE_ID','TAG']) }} as skey,
USER_ID,
MOVIE_ID,
tag,
CAST(tags_timestamp as TIMESTAMP_NTZ) as tags_timestamp
FROM {{ref('src_tags')}}
LIMIT 100

{% endsnapshot %}