SELECT 'Playlist' AS table_name, COUNT(*) AS nb_rows FROM {{ source('music_src', 'Playlist') }}
UNION ALL
SELECT 'Genre', COUNT(*) FROM {{ source('music_src', 'Genre') }}
UNION ALL
SELECT 'MediaType', COUNT(*) FROM {{ source('music_src', 'MediaType') }}
UNION ALL
SELECT 'Artist', COUNT(*) FROM {{ source('music_src', 'Artist') }}
UNION ALL
SELECT 'Album', COUNT(*) FROM {{ source('music_src', 'Album') }}
UNION ALL
SELECT 'Track', COUNT(*) FROM {{ source('music_src', 'Track') }}
UNION ALL
SELECT 'PlaylistTrack', COUNT(*) FROM {{ source('music_src', 'PlaylistTrack') }}