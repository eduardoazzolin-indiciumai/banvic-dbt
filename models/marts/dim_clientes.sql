with

    source as (select * from {{ ref("int_dimensao_clientes") }}),

    renamed as (select * from source)

select *
from renamed
