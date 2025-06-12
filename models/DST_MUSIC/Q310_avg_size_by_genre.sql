{{ config(materialized='view', tags=['tag_query']) }}

-- 10.Donnez la moyenne des tailles des morceaux par genre musical.

SELECT g.Name AS Genre, ROUND(AVG(ft.Size),1) AS MoyenneSizeBytes
FROM {{ ref('factTrack') }}  ft
JOIN {{ ref('dimGenre') }} g ON ft.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY MoyenneSizeBytes DESC
