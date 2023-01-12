{% macro dim_update_timestamp(dim_name, inc_prefix, t2_prefix, source_prefix) %}
    {% if is_incremental() -%}
    {#- Incremental Run Case -#}
        case when ({{t2_prefix}}.dbt_valid_to is null 
                    and {{inc_prefix}}.t1_key != {{source_prefix}}.t1_key) then convert_timezone('America/New_York',current_timestamp::timestamp)
             when ({{inc_prefix}}.{{dim_name}}_key is not null) then {{inc_prefix}}.dbt_updated_at
             else convert_timezone('America/New_York',{{t2_prefix}}.dbt_updated_at::timestamp) end as dbt_updated_at
    {%- else %}
    {#- Initial Run Case -#}
        case when ({{t2_prefix}}.dbt_valid_to is null 
                    and {{t2_prefix}}.t1_key != {{source_prefix}}.t1_key ) then convert_timezone('America/New_York',current_timestamp::timestamp)
             else convert_timezone('America/New_York',{{t2_prefix}}.dbt_updated_at::timestamp) end as dbt_updated_at
    {%- endif %}
{% endmacro %}