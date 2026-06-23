with
    source as (

        {{
            dbt_utils.date_spine(
                datepart="day",
                start_date="cast('2019-01-01' as date)",
                end_date="cast('2020-01-01' as date)",
            )
        }}
    ),
    renamed as (
        select
            row_number() over (order by date_day asc) as pk_data,
            cast(date_day as date) as dt_data,
            extract(day from date_day) as dia,
            extract(month from date_day) as mes,
            extract(year from date_day) as ano,
            extract(quarter from date_day) as trimestre,
            extract(dow from date_day) as dia_da_semana
        from source
    )

select *
from renamed
