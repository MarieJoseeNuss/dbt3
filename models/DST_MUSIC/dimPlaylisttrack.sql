{{ config(materialized='table', tags=['unique']) }}

select distinct p.PlaylistId, p.TrackId, pl.Name 
from {{ source('music_src', 'PlaylistTrack') }} p
JOIN {{ source('music_src', 'Playlist') }} pl ON pl.PlaylistId = p.PlaylistId
JOIN {{ source('music_src', 'Track') }} t ON p.TrackId = t.TrackId