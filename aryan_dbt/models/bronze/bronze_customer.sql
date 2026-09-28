SELECT *
from {{ source('source', 'dim_customer') }}