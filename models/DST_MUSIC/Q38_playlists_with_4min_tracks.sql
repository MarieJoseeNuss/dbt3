{{ config(materialized='view', tags=['tag_query']) }}

-- 8. Donnez les noms de toutes les playlists où figurent des morceaux de plus de 4 minutes.
SELECT DISTINCT pl.name as PlaylistName
FROM {{ref('factTrack')}} ft
JOIN  {{ref('dimPlaylisttrack')}} pl ON pl.trackId=ft.trackId
WHERE ft.duration>(4*60*1000)