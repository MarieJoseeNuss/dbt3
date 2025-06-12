-- models/my_first_join.sql

with demographics as (
    select * from {{ source('COVID19_Epidemiological_Data', 'DEMOGRAPHICS') }}
),

country_codes as (
    select * from {{ ref('country_codes') }}
)

select 
    d.county,
    d.ISO3166_1 as country_code,
    cc.name as country_name,
    d.total_population as population
from demographics d
left join country_codess cc
    on d.ISO3166_1 = cc.code
