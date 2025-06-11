with demographics as (
    select * from {{ source('COVID19_Epidemiological_Data', 'DEMOGRAPHICS') }}
),
country_codess as (
    select * from {{ ref('country_codess') }}
),
final as (
    select
        demographics.total_population,
        country_codes.name
    from demographics
    left join country_codess
        on country_codess.code = demographics.ISO3166_1
)
select * from final