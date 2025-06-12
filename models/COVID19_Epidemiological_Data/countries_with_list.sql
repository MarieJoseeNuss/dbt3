{%- set countries = ["France", "Spain", "Germany", "United States"] -%}

select
{%- for country in countries %}
{% if ' ' not in country  %}
count(case when country_name = '{{country}}' then country_name end) as {{country}}_amount
{%- else %} 
{% set country_underscore = country.replace(' ', '_') -%}
count(case when country_name = '{{country}}' then country_name end) as {{country_underscore}}_amount
{% endif %}
{%- if not loop.last %},{% endif -%}
{% endfor %}
from {{ ref('my_first_join') }}

/*
S'ily a un espace dans le nom de la variable la clause sql plante.  
{% set a = 4 %}
{% if a == 4 %}
{% set a = a + 1 %}
{% elif a == 6 %}
{% set a = a - 1 %}
{% else %}
{% endif %}
select {{a}} as test

En utilisant la syntaxe de la clause if en Python et la technique ' ' not in country, 
corrigez le code précédent afin qu'il se lance dans le cas où on a un espace présent dans le nom du pays :
*/