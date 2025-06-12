{{ config(materialized='table', tags=['unique']) }}
-- 
select distinct ge.GenreId,ge.Name from {{ source('music_src', 'Genre') }} ge
JOIN {{ source('music_src', 'Track') }} t ON ge.GenreId = t.GenreId