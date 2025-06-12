{{ config(materialized='view', tags=['tag_query']) }}

-- 11.Donnez les playlist où figurent des morceaux d'artistes nés avant 1990.
SELECT DISTINCT pl.name as PlaylistName
FROM {{ ref('factTrack') }} ft
JOIN  {{ ref('dimPlaylisttrack') }} pl ON pl.trackId=ft.trackId
JOIN {{ ref('dimArtist') }} ar ON ft.ArtistId = ar.ArtistId
WHERE ar.birthyear<1990
