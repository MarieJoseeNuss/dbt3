{{ config(materialized='table', tags=['unique']) }}


SELECT
    ROW_NUMBER() OVER (ORDER BY Composer) AS ComposerId,
    Composer AS Name
FROM (
    SELECT DISTINCT Composer
    FROM {{ source('music_src', 'Track') }}
    WHERE Composer IS NOT NULL
) composers
