select 'fisrt_val' as name, '{{ env_var("DBT_FIRST_ENV_VAR") }}' as value
union all
select 'my_env_var' as name, '{{ env_var("DBT_MY_ENV") }}' as value
