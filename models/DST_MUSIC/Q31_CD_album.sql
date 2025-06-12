{{ config(materialized='view', tags=['tag_query']) }}

SELECT DISTINCT
    a.Title AS title_of_albums
FROM {{ ref('factTrack') }} t
JOIN {{ ref('dimAlbum') }} a ON t.AlbumId = a.AlbumId
WHERE a.Cdyear > 1

