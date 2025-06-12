{{ config(materialized='table', tags=['unique']) }}
--on récupère les données dans la table dimension artist mais on ne le lance pas à chaque fois
select distinct a.ArtistId, a.Name, a.Birthyear, a.Country 
from {{ source('music_src', 'Artist') }} a
JOIN {{ source('music_src', 'Album') }} al ON al.ArtistId = a.ArtistId
JOIN {{ source('music_src', 'Track') }}  t ON al.AlbumId = t.AlbumId
