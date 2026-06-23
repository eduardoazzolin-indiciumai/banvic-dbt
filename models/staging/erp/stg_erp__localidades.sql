with 

    source as (
        select *
        from {{ source('erp', 'localidades') }}
    ),

    renamed as (
        select
            cast(cod_localidade as int) as pk_localidade,
            cast(cidade as string) as cidade,
            cast(uf as string) as uf
        from source
    )

select * from renamed