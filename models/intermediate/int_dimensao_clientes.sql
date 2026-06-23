with
    clientes as (select * from {{ ref("stg_erp__clientes") }}),
    localidades as (select * from {{ ref("stg_erp__localidades") }}),
    cliente_enriquecido as (

        select
            clientes.pk_cliente,
            clientes.nome_cliente,
            clientes.email_cliente,
            clientes.tipo_cliente,
            clientes.ts_inclusao,
            clientes.cpf_cnpj_cliente,
            clientes.data_nascimento_cliente,
            clientes.endereco_cliente,
            clientes.cep_cliente,
            localidades.cidade as cidade_cliente,
            localidades.uf as uf_cliente
        from clientes
        left join localidades on localidades.pk_localidade = clientes.fk_localidade

    )

select *
from cliente_enriquecido
