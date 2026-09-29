WITH bronze_sales AS
(
    SELECT
        sales_id,
        gross_amount,
        product_sk,
        {{ multiply('unit_price', 'quantity') }} AS calculated_gross_amount,
        customer_sk,
        payment_method
    FROM {{ ref('bronze_sales') }}
),

bronze_products AS
(
    SELECT
        product_sk,
        category
    FROM {{ ref('bronze_product') }}
),

customer AS
(
    SELECT
        customer_sk,
        gender
    FROM {{ ref('bronze_customer') }}
),

joined_query AS
(
    SELECT
        bronze_sales.sales_id,
        bronze_sales.gross_amount,
        bronze_sales.product_sk,
        bronze_sales.customer_sk,
        bronze_sales.payment_method,
        bronze_products.category,
        customer.gender
    FROM bronze_sales
    JOIN bronze_products
        ON bronze_sales.product_sk = bronze_products.product_sk
    JOIN customer
        ON bronze_sales.customer_sk = customer.customer_sk
)

SELECT
    category,
    gender,
    SUM(gross_amount) AS total_sales
FROM joined_query
GROUP BY
    category,
    gender
ORDER BY
    total_sales DESC