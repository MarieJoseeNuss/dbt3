{{ config(materialized='view', tags=['tag_query']) }}
-- 6. Donnez le nombre de morceaux produits par chaque artiste.
SELECT DISTINCT ar.Name AS Artist, COUNT(DISTINCT ft.Name) AS Nb_de_morceaux
FROM {{ref('factTrack')}} ft
JOIN {{ref('dimArtist')}} ar ON ft.ArtistId = ar.ArtistId
GROUP BY ar.Name
ORDER BY Nb_de_morceaux DESC