{{ config(materialized='view', tags=['tag_query']) }}

-- 5. Donnez le nombre d'albums produits pour chaque artiste

SELECT ar.Name AS Artiste, COUNT(DISTINCT a.AlbumId) AS Nb_Albums
FROM {{ref('factTrack')}} ft
JOIN {{ref('dimAlbum')}} a ON ft.AlbumId = a.AlbumId
JOIN {{ref('dimArtist')}} ar ON ft.ArtistId = ar.ArtistId
GROUP BY ar.Name
ORDER BY Nb_Albums DESC