{{ config(materialized='table', tags=['unique']) }}
select distinct al.AlbumId, al.Title, al.Prodyear, al.Cdyear
from {{ source('music_src', 'Album') }} al
JOIN {{ source('music_src', 'Track') }} t ON al.AlbumId = t.AlbumId