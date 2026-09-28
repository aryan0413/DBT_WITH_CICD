SELECT *
from {{ source('source', 'dim_product') }}