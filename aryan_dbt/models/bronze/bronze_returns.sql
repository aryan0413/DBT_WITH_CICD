SELECT *
from {{ source('source', 'fact_returns') }}