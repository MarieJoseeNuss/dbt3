{{ config(materialized='view', tags=['tag_query']) }}

-- Donnez les morceaux produits en 2000 ou en 2002.
SELECT  
     DISTINCT t.Name AS "Nom du morceau", c.Name AS "Compositeur"
from {{ ref('factTrack') }} t
JOIN {{ ref('dimGenre') }} g ON t.GenreId = g.GenreId
JOIN {{ ref('dimComposer') }} c ON t.ComposerId = c.ComposerId
WHERE g.Name IN ('Rock', 'Jazz') 
  AND c.Name != 'nan'