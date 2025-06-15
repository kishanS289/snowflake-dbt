WITH Tags as (
    SELECT * from {{  ref('src_genome_tags') }}
)
SELECT 
    TAG_ID,
    INITCAP(TRIM(TAG)) as TAG_NAME
FROM Tags