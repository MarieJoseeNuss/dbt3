select 'factTrack' as Table_Name, count(*) as nb_records  from {{ref('factTrack')}}
UNION ALL
select 'dimGenre',                count(*)                from {{ref('dimGenre')}}
UNION ALL
select 'dimArtist',                count(*)               from {{ref('dimArtist')}}
UNION ALL
select 'dimComposer',                count(*)             from {{ref('dimComposer')}}
UNION ALL
select 'dimAlbum',                count(*)               from {{ref('dimAlbum')}}
UNION ALL
select 'dimPlaylisttrack',                count(*)        from {{ref('dimPlaylisttrack')}}