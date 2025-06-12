{{ config(materialized='view', tags=['tag_query']) }}

-- 7. Donnez le genre de musique le plus écouté dans les années 2000.

SELECT g.Name AS Genre, COUNT(DISTINCT ft.Name) AS Nb_de_morceaux
FROM {{ref('factTrack')}} ft
JOIN {{ref('dimGenre')}} g ON ft.GenreId = g.GenreId
JOIN {{ref('dimAlbum')}} a ON ft.AlbumId = a.AlbumId
WHERE a.Prodyear BETWEEN 2000 AND 2009
GROUP BY g.Name
ORDER BY Nb_de_morceaux DESC
LIMIT 1