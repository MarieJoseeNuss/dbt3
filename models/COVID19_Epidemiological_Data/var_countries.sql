/* Pour finir cette partie sur la syntaxe Jinja, il est aussi possible de définir les variables dans le fichier dbt_project.yml directement à l'aide de la syntaxe suivante :

vars:
    countries: ["France", "Spain", "Germany", "United States"]
Nous pouvons alors faire appel à cette variable en utilisant la syntaxe Jinja :

{{ var('countries') }}
*/
select
{%- for country in var('countries') %}
{% if ' ' not in country  %}
count(case when country_name = '{{country}}' then country_name end) as {{country}}_amount
{%- else %} 
{% set country_underscore = country.replace(' ', '_') -%}
count(case when country_name = '{{country}}' then country_name end) as {{country_underscore}}_amount
{% endif %}
{%- if not loop.last %},{% endif -%}
{% endfor %}
from {{ ref('my_first_join') }}
