{{ config(materialized='view', tags=['tag_query']) }}

-- 9.Donnez les morceaux de Rock dont les artistes sont en France.
SELECT DISTINCT ft.Name AS MorceauDeRock
FROM {{ref('factTrack')}} ft
JOIN {{ref('dimGenre')}} g ON ft.GenreId = g.GenreId
JOIN {{ref('dimArtist')}} ar ON ft.ArtistId = ar.ArtistId
WHERE g.Name ='Rock' AND ar.Country = 'France'