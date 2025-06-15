WITH Ratings as (
    SELECT DISTINCT USER_ID FROM {{ ref('src_ratings') }} 
),
Tags as (
    SELECT DISTINCT USER_ID FROM {{ ref('src_tags') }}
)

SELECT DISTINCT USER_ID
FROM (
    SELECT * FROM Ratings
    UNION
    SELECT * FROM Tags
)
