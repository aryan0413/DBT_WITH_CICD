{{ config(
    materialized='view'
) }}

SELECT *
from {{ source('source', 'fact_sales') }}