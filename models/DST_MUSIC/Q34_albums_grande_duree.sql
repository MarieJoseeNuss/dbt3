{{ config(materialized='view', tags=['tag_query']) }}

-- Donnez les 10 albums les plus longs (en duréee)
SELECT  
     a.Title AS Album, SUM(ft.Duration) AS DureeTotaleenMillisecondes
from {{ ref('factTrack') }} ft
JOIN {{ ref('dimAlbum') }} a ON ft.AlbumId = a.AlbumId
GROUP BY a.Title
ORDER BY DureeTotaleenMillisecondes DESC
LIMIT 10