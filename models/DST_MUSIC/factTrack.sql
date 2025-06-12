{{ config(materialized='table', tags=['unique']) }}

SELECT 
    t.TrackId,
    t.AlbumId,
    t.GenreId,
    ar.ArtistId,
    c.ComposerId,
    t.Name,
    t.Milliseconds AS Duration,
    t.Bytes AS Size

FROM {{ source('music_src', 'Track') }} t

-- chercher l'artiste depuis l'album
JOIN {{ source('music_src', 'Album') }} a ON t.AlbumId = a.AlbumId

JOIN {{ source('music_src', 'Artist') }} ar ON a.ArtistId = ar.ArtistId

-- Genre
JOIN {{ ref('dimGenre') }} g ON t.GenreId = g.GenreId

-- Compositeur
JOIN {{ ref('dimComposer') }} c ON t.Composer = c.Name

-- factTrack = 3379 records
