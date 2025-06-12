{{ config(materialized='view', tags=['tag_query']) }}

-- Donnez les morceaux produits en 2000 ou en 2002.
SELECT  
     DISTINCT t.name as "Noms des morceaux produit en 2000 ou 2002"
from {{ ref('factTrack') }} t
JOIN {{ ref('dimAlbum') }}  a ON t.AlbumId = a.AlbumId 
WHERE a.ProdYear = 2000 or a.ProdYear= 2002